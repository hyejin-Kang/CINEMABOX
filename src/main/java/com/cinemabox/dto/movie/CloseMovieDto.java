package com.cinemabox.dto.movie;

import java.util.Date;

import lombok.Data;

@Data
public class CloseMovieDto {

	private int no;
	private String title;
	private String status;
	private String screeningStatus;
	private Date releasedDate;
	private Date twoMonth;
}
