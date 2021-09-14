package com.cinemabox.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Event {

	private int no;
	private String title;
	private String content;
	private Date createdDate;
}
