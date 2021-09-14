package com.cinemabox.dto.Question;

import java.util.Date;

import lombok.Data;

@Data
public class QuestionDto {
	
	private int questionNo;
	private String questionTitle;
	private String questionContent;
	private Date questionDate;
	private String name;
	private String email;
	private String phone;
	
	

}
