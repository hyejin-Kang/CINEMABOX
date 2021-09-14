package com.cinemabox.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Question {
	

	private int questionNo;
	private String questionTitle;
	private String questionContent;
	private String answerContent;
	private Date questionDate;
	private Date answerDate;
	private char state;
	private int satisfaction;
	private String name;
	private String email;
	private String phone;
	
	
	

}
