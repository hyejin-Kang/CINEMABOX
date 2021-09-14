package com.cinemabox.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Review {

	private int no;
	private String content;
	private int rating;
	private int movieNo;
	private String userId;
	private String status;
	private Date createdDate;
	private int count;
}
