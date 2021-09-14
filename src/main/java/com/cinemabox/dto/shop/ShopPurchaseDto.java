package com.cinemabox.dto.shop;

import java.util.Date;

import lombok.Data;

@Data
public class ShopPurchaseDto {
	
	private int oderNo;
	private int snackNo;
	private int giftNo;
	private int orderAmount;
	private Date orderDate;
	private String userId;
	
}
