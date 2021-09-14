package com.cinemabox.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class Screening {

	private int screeningNo;
	private int movieNo;
	private int theaterNo;
	private int hallNo;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date screeningDate;
	private String screeningTime;
	private String status;
	private String title;
	private String theaterName;
	
}
