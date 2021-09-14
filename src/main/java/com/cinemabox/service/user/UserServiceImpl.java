package com.cinemabox.service.user;

import java.util.List;
import java.util.Map;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cinemabox.dao.user.UserDao;
import com.cinemabox.dto.user.UserDto;
import com.cinemabox.vo.User;
import com.cinemabox.web.utils.SessionUtils;

@Service
@Transactional
public class UserServiceImpl implements UserService{
	@Autowired UserDao userDao;
	
	/**
	 * 회원가입 서비스 Impl
	 */
	@Override
	public void registerUser(User user) {
		
		User savedUser = userDao.getUserById(user.getId());
		
		if(savedUser !=null) {
			throw new RuntimeException("["+user.getId()+"]는 이미 사용중인 아이디입니다.");
		}
		
		savedUser = userDao.getUserByEmail(user.getEmail());
		if(savedUser !=null) {
			throw new RuntimeException("["+user.getEmail()+"]는 이미 사용중인 아이디입니다.");
		}
		
		String secretPassword = DigestUtils.sha256Hex(user.getPassword());
		user.setPassword(secretPassword);
		
		userDao.insertUser(user);
	}
	
	/**
	 * 회원정보 수정하기
	 
	@Override
	public void updateUser(User userId) {
		
		
	}
	*/
	/**
	 * 로그인 서비스 Impl
	 */
	@Override
	public void login(String id, String password) {
		
		User user = userDao.getUserById(id);
		
		if (user == null) {
			throw new RuntimeException("아이디 혹은 비밀번호가 유효하지 않습니다.");
		}
		
		if (!"ACTIVE".equalsIgnoreCase(user.getStatus())) {
			throw new RuntimeException( "탈퇴 혹은 일시정지 처리된 사용자입니다.");
		}
		
		String secretPassword = DigestUtils.sha256Hex(password);
		if (!user.getPassword().equals(secretPassword)) {
			throw new RuntimeException("아이디 혹은 비밀번호가 유효하지 않습니다.");
		}
		
		SessionUtils.addAttribute("LOGINED_USER", user);
	}
	
	/**
	 * 카카오로그인 Impl
	 */
	@Override
	public void kakaoLogin(User kakaoUser) {
		
		User user = userDao.getUserById(kakaoUser.getId());
		
		//사용자가 존재하지 않을 경우
		if(user == null) {
			
			userDao.insertUser(kakaoUser);
			SessionUtils.addAttribute("LOGINED_USER", kakaoUser);
		}
		
		//사용자가 존재할 경우 바로 로그인
		SessionUtils.addAttribute("LOGINED_USER", kakaoUser);
	}
	
	/**
	 * 회원가입 할 때 아이디 중복 찾으려는 Impl
	 */
	@Override
	public String getUserById(String userId) {
		
		User user = userDao.getUserById(userId);
		
		//사용자가 존재 할 경우
		if(user != null) {
			return "Y";
		}
		
		//사용자가 존재하지 않을 경우
		return "N";
	}
	
	/**
	 * 회원가입 할 때 이메일 중복 찾으려는 Impl
	 */
	@Override
	public String getUserByEmail(String userEmail) {
		
		User user = userDao.getUserByEmail(userEmail);
		
		//사용자가 존재 할 경우
		if(user != null) {
			return "Y";
		}
		
		return "N";
	}
	/**
	 * 위시리스트(영화 찜 목록) 서비스 Impl
	 */
	@Override
	public List<UserDto> getwishListById(String userId) {
		
		return userDao.getwishListById(userId);
	}
	
	/**
	 * 쿠폰 보유 목록 서비스 Impl
	 */
	@Override
	public List<UserDto> getCouponsById(String userId) {
		
		return userDao.getCouponsById(userId);
	}
	
	/**
	 * 영화 예매 내역 서비스 Impl
	 */
	@Override
	public List<UserDto> getMovieReservationsById(String userId) {
		
		return userDao.getMovieReservationsById(userId);
	}
	
	/**
	 * 구매 내역 서비스 Impl
	 */
	@Override
	public List<UserDto> getOrderlistById(String userId) {
		
		return userDao.getOrderlistById(userId);
	}
	
	@Override
	public int countCoupon(String userId) {
		int cnt = userDao.countCoupon(userId);
		if(cnt == 0 ) {
			return 0;
		}
		return cnt;
	}
	
	@Override
	public int countWishlists(String userId) {
		int cnt = userDao.countWishlists(userId);
		if (cnt == 0) {
			return 0;
		}
		return userDao.countWishlists(userId);
	}
	
	
	@Override
	public Map<String, Object> getUserDetail(String userId) {
		// TODO Auto-generated method stub
		return null;
	}
	
	// 결제후 적립금 적립 로직
	@Override
	public void updatePayPoint(User user) {
		userDao.updatePayPoint(user);
	}
	
	// 결제완료 유저 포인트 차감 로직
	@Override
	public void updateMinusPoint(int usedPoint) {
		User loginedUser = (User) SessionUtils.getAttribute("LOGINED_USER");
		User user = new User();
		user.setPoint(loginedUser.getPoint() - usedPoint);
		user.setId(loginedUser.getId());
		userDao.updatePayPoint(user);
	}
}
