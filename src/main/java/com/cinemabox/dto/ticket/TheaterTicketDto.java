package com.cinemabox.dto.ticket;

import java.util.List;

import lombok.Data;

@Data
public class TheaterTicketDto {

	private int theaterNo;
	private int movieNo;
	private String movieTitle;
	private String age;
	private int runningTime;
	private String movieStatus;
	private int hallNo;
	private String hallName;
	
	//좌석수, 상영시간
	private List<TicketDto> screenings;
}
