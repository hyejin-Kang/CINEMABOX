package com.cinemabox.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Reservation {

	private int no;
	private String status;
	private String payStatus;
	private int price;
	private int totalPrice;
	private String payment;
	private Date createdDate;
	private double point;
	private int movieNo;
	private String userId;
	private String ticketNos;
	private Integer usedPoint;
	private String serialNo;
	private int adultCnt;
	private int teenagerCnt;
	private String seatNo;
	private String seatCol;
	private String seatRow;
	@DateTimeFormat(pattern = "yyyyMMdd")
	private Date screeningDate;
	private String screeningTime;
	private String screeningEndTime;
	private String hallName;
	private String theaterName;
	private String title;
	private int screeningNo;
	private int theaterNo;
	private int hallNo;
}
