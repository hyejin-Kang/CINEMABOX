package com.cinemabox.task;

import java.util.Random;

public class Coupon {
	
	static int n = 16; // n자리 쿠폰 
	static char[] chs = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 
			'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 
			'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };

	public static String createCoupon() {
		Random rd = new Random();
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < n; i++) {
			char ch = chs[rd.nextInt(chs.length)];
			sb.append(ch);
		}
		return sb.toString();
	}

	public static void main(String[] args) {
		System.out.println(createCoupon());
	}
}
