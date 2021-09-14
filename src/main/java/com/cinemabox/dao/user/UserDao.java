package com.cinemabox.dao.user;

import java.util.List;

import com.cinemabox.dto.user.UserDto;
import com.cinemabox.vo.User;

public interface UserDao {

	/**
	 * 지정된 사용자정보를 데이터베이스에 저장한다.
	 * @param user 신규 사용자정보
	 */
	void insertUser(User user);
	
	/**
	 * 지정된 사용자 정보를 수정한다.
	 * @param user
	 */
	void updateUser(String userId);
	
	/**
	 * 지정된 사용자아이디로 데이터베이스에서 사용자정보를 조회해서 반환한다.
	 * @param userId 사용자 아이디
	 * @return 사용자정보, null일 수 있음
	 */
	User getUserById(String userId);
	
	/**
	 * 지정된 사용자이메일로 데이터베이스에서 사용자정보를 조회해서 반환한다.
	 * @param userId 사용자 이메일
	 * @return 사용자정보, null일 수 있음
	 */
	User getUserByEmail(String userEmail);
	
	/**
	 * 지정된 사용자 아이디로 위시리스트를 가져온다.
	 * @param userId 사용자 아이디
	 * @return
	 */
	List<UserDto> getwishListById(String userId);
	
	/**
	 * 사용자 아이디로 쿠폰 보유 내역 가져오기
	 * @param userId
	 * @return
	 */
	List<UserDto> getCouponsById(String userId);
	
	/**
	 * 사용자 아이디로 영화티켓 예매 내역 가져오기
	 * @param userId
	 * @return
	 */
	List<UserDto> getMovieReservationsById(String userId);
	
	/**
	 * 사용자 아이디로  구매내역 가져오기
	 * @param userId
	 * @return
	 */
	List<UserDto> getOrderlistById(String userId);
	
	/**
	 * 사용자 아이디로 보유 쿠폰 개수 가져오기
	 * @param userId
	 * @return
	 */
	int countCoupon(String userId);
	
	/**
	 * 사용자 아이디로 위시리스트 개수 가져오기
	 * @param userId 사용자 아이디
	 * @return
	 */
	int countWishlists(String userId);
	
	/**
	 * 적립금을 업데이트 한다.
	 * @param user 포인트와 해당 userId가 담긴 user객체
	 */
	void updatePayPoint(User user);
	
}
