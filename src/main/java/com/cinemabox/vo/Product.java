package com.cinemabox.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Product {
	
	private int no;
	private String goods;
	private String email;
	private Date createdDate;

}
