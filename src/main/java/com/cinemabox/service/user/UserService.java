package com.cinemabox.service.user;

import java.util.List;
import java.util.Map;

import com.cinemabox.dto.user.UserDto;
import com.cinemabox.vo.User;

public interface UserService {

	/**
	 * 지정된 사용자정보로 회원가입을 수행하는 서비스
	 * @param user 사용자정보
	 */
	void registerUser(User user);
	
	/**
	 * 
	 * @param user
	 
	void updateUser(User user);
	*/
	/**
	 * 지정된 아이디와 비밀번호로 사용자인증을 수행하는 서비스
	 * @param id 사용자 아이디
	 * @param password 사용자 비밀번호
	 */
	void login(String userId, String userPassword);
	
	/**
	 * 카카오 로그인
	 * @param userId
	 * @return
	 */
	void kakaoLogin(User kakaoUser);
	
	/**
	 * 위시리스트에 담겨있는 영화 가져오기
	 * @param userId 사용자 아이디
	 * @return
	 */
	List<UserDto> getwishListById(String userId);
	
	/**
	 * 보유 쿠폰 가져오기
	 * @param userId
	 * @return
	 */
	List<UserDto> getCouponsById(String userId);
	
	/**
	 *  쿠폰 개수 세기
	 * @param userId
	 * @return
	 */
	int countCoupon(String userId);
	
	/**
	 * 위시리스트 영화 개수 세기
	 * @param userId
	 * @return
	 */
	int countWishlists(String userId);
	
	/**
	 * 티켓 예매 내역 가져오기
	 * @param userId
	 * @return
	 */
	List<UserDto> getMovieReservationsById(String userId);
	
	/**
	 * snack 구매내역 가져오기
	 * @param userId
	 * @return
	 */
	List<UserDto> getOrderlistById(String userId);	
	
	/**
	 * 아이디로 사용자 불러오기 (중복 체크할 때)
	 * @param userId
	 * @return
	 */
	String getUserById(String userId);
	
	/**
	 * 이메일로 사용자 불러오기 (중복 체크할 때)
	 * @param userEmail
	 * @return
	 */
	String getUserByEmail(String userEmail);
	
	/**
	 * 저장되어 있는 사용자 정보 불러오기
	 * @param userId 사용자 아이디
	 * @return
	 */
	Map<String, Object> getUserDetail(String userId);
	
	/**
	 * 유저 포인트를 업데이트 한다.
	 * @param user 유저객체
	 */
	void updatePayPoint(User user);

	
	/**
	 * 포인트를 전달받아서 포인트를 수정한다.
	 * @param point 포인트
	 */
	void updateMinusPoint(int usedPoint);
}
