package com.cinemabox.dto.Question;

import java.util.Date;

import lombok.Data;

@Data
public class AnswerDto {
	
	private int questionNo;
	private String name;
	private String answerContent;
	private Date answerDate;
	private String email;
	private char state ='Y';


}
