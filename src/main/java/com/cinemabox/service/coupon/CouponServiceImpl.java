package com.cinemabox.service.coupon;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cinemabox.dao.coupon.CouponDao;
import com.cinemabox.vo.Coupon;

@Service
@Transactional
public class CouponServiceImpl implements CouponService{
	
	@Autowired CouponDao couponDao;
	
	@Override
	public void updateUsedCoupon(String serialNo) {
		System.out.println(serialNo);
		Coupon couponInfo = couponDao.getCouponInfoBySerialNo(serialNo);
		couponInfo.setStatus("Y");
		couponDao.updateUsedCoupon(couponInfo);
	}
}
