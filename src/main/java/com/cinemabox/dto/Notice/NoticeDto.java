package com.cinemabox.dto.Notice;

import lombok.Data;

@Data
public class NoticeDto {
	private String title;
	private String content;
	private String important;
	private String division = "전체";
}
