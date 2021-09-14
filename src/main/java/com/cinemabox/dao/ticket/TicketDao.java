package com.cinemabox.dao.ticket;

import java.util.List;
import java.util.Map;

import com.cinemabox.dto.ticket.ScreeningDto;
import com.cinemabox.dto.ticket.TheaterTicketDto;
import com.cinemabox.dto.ticket.TicketDto;
import com.cinemabox.dto.ticket.WebsocketTicketDto;


public interface TicketDao {
	//스케쥴러
	void updateScreeningStatus(TicketDto ticketDto);
	List<TicketDto> getAllScreeningTime();
	// 웹소켓 좌석 스케쥴러
	List<WebsocketTicketDto> settingWebSocketSeat();
	
	//예매
	List<TicketDto> getMovieListByTheaterNo(Map<String, Object> map);
	List<TicketDto> getMovieTime(Map<String, Object> map);
	TicketDto getMovieByTime(Map<String, Object> map);
	List<TicketDto> getTicketStatusByScreeningNo(int screeningNo);
	List<ScreeningDto> getAllMovieTime(Map<String, Object> map); //상영시간표
	List<TheaterTicketDto> getAllMovieTimeByTheater(Map<String, Object> map); //극장별 상영시간표
	//좌석
	List<TicketDto> getAllSeat(int screeningNo);
	TicketDto getTicketNo(TicketDto ticketDto);
	void updateTicketReservationStatus(int ticketNo);
	// 웹소켓 좌석
	WebsocketTicketDto getWebSocketData(WebsocketTicketDto wsDto);
	void updateWebSocetStatus(WebsocketTicketDto wstDto);
	//결제
}
