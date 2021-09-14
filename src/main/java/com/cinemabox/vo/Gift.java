package com.cinemabox.vo;

import lombok.Data;

@Data
public class Gift {

	private int giftNo;
	private String name;
	private int price;
	private String thumbnail;
	private int discountPrice;
}
