package com.cinemabox.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Wishlist {

	private int movieNo;
	private int movieLike;
	private Date wishlistCreatedDate;
	private String userId;
}
