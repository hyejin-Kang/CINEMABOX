package com.cinemabox.dto.ticket;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class TicketDto {
	private int ticketNo;
	private int screeningNo;
	private int movieNo;
	private int theaterNo;
	private int hallNo;
	private int seatCnt;
	@DateTimeFormat(pattern = "yyyyMMdd")
	private Date screeningDate;
	private String screeningTime;
	private String screeningEndTime;
	private String screeningStatus;
	private String theaterName;
	private String title;
	private String runningTime;
	private String age;
	private String movieStatus;
	private String hallName;
	private String ticketStatus;
	private String ageGroup;
	private int adultCnt;
	private int teenagerCnt;
	private String seatNo;
	private String seatCol;
	private String seatRow;
	private int totalPrice;
}
