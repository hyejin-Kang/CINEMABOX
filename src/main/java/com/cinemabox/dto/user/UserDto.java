package com.cinemabox.dto.user;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class UserDto {

	private String id;
	private int wishlistNo;
	@DateTimeFormat(pattern = "yyyyMMdd")
	private Date wishlistCreatedDate;
	private int movieNo;
	private String movieTitle;
	private String movieThumbnail;
	private int couponNo;
	private String couponType;
	@DateTimeFormat(pattern = "yyyyMMdd")
	private Date couponExpDate;
	private int reservationPrice;
	private String payment;
	@DateTimeFormat(pattern = "yyyyMMdd")
	private Date reservationCreatedDate;
	@DateTimeFormat(pattern ="yyyyMMdd")
	private Date orderDate;
	private int orderNo;
	private String name;
	private int orderAmount;
	private int orderPrice;
	private int reservationNo;
    private String reservationPayment;
    private int reservationPoint;
}
