package com.cinemabox.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Coupon {
	
	private int couponNo;
	private int couponListNo;
	private String type;
	private String serialNo;
	private Date issueDate;
	private Date expDate;
	private Date usedDate;
	private String status;
}
