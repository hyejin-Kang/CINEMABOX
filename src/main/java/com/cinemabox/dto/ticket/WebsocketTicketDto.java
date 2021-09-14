package com.cinemabox.dto.ticket;


import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class WebsocketTicketDto {
	int webSeatNo;
	int webTicketNo;
	int webScreeningNo;
	String webTicketStatus;
	String webSeatRow;
	String webSeatCol;
	String webScreeningTime;
	String webSelectType;
	@DateTimeFormat(pattern = "yyyyMMdd")
	Date seatSelectedDate;
}
