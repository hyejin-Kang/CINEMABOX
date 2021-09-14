package com.cinemabox.dto.admin;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class AdminDto {
	private int screeningNo;
	private int theaterNo;
	private String theaterName;
	private int hallNo;
	private String hallName;
	private int movieNo;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date screeningDate;
	private String title;
	private int remainingSeats;
}
