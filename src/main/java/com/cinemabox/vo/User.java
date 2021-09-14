package com.cinemabox.vo;

import java.util.Date;

import lombok.Data;

@Data
public class User {
	
	private String id;
	private String name;
	private String password;
	private String email;
	private String phone;
	private String address;
	private String birth;
	private int couponNo;
	private int point;
	private int grade;
	private int wishNo;
	private String status;
	private Date createdDate;
	private Date deletedDate;
	private Date lockDate;
	private String roleType;
	private String isKakao;
}
