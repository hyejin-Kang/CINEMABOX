package com.cinemabox.dto.ticket;

import java.util.List;

import lombok.Data;

@Data
public class ScreeningDto {

	private int theaterNo;
	private int movieNo;
	private String movieTitle;
	private String age;
	private String movieStatus;
	//상영번호, 상영날짜, 상영시간, 좌석수, 상영관
	private List<TicketDto> screenings;
}
