package com.cinemabox.dao.coupon;

import java.util.List;

import com.cinemabox.vo.Coupon;

public interface CouponDao {
	/**
	 * 쿠폰 마감일이 오늘 이전인 것들 갱신하기
	 * @param coupon 쿠폰번호, 쿠폰사용가능상태
	 */
	void updateCouponByExp(Coupon coupon);
	
	/**
	 * userId를 전달 받아 내 쿠폰정보들을 조회한다.
	 * @param userId 사용자아이디
	 * @return 내 쿠폰목록
	 */
	List<Coupon> getAllMyCoupon(String userId);
	
	/**
	 * 쿠폰시리얼번호를 전달 받아 해당 쿠폰 정보를 조회한다.
	 * @param serialNo 쿠폰시리얼번호
	 * @return 쿠폰정보 객체
	 */
	Coupon getCouponInfoBySerialNo(String serialNo);
	
	/**
	 * 업데이트된 쿠폰정보 객체를 전달하여 쿠폰테이블의 데이터를 업데이트 한다.
	 * @param couponInfo 업데이트된 쿠폰 객체
	 */
	void updateUsedCoupon(Coupon couponInfo);
	
	/**
	 * 쿠폰 마감일이 오늘 이전인 것들 구하기
	 * @return 마감일이 지난 쿠폰목록
	 */
	List<Coupon> getCouponsByExp();
}
