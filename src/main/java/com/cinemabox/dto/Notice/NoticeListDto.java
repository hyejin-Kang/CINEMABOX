package com.cinemabox.dto.Notice;

import lombok.Data;

@Data
public class NoticeListDto {

	private int page = 1;
	private int startPage = 1;
	private int endPage = 5;
	private String searchWord ="";
}
