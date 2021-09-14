package com.cinemabox.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Notice {
	
	private int no;
	private String division;
	private String title;
	private String content;
	private Date creatDate;
	private int hits;
	

}
