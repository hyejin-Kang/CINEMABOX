package com.cinemabox.service.Ticket;

import java.util.List;
import java.util.Map;

import com.cinemabox.dto.ticket.ScreeningDto;
import com.cinemabox.dto.ticket.TheaterTicketDto;
import com.cinemabox.dto.ticket.TicketDto;

public interface TicketService {
	/**
	 * 극장번호로 등록된 영화정보 받아오기
	 * @param map 극장번호, 분류(정렬)
	 * @return 영화목록
	 */
	List<TicketDto> getMovieListByTheaterNo(Map<String, Object> map);
	
	/**
	 * 극장번호, 상영날짜로 영화목록, 상영시간 받아오기
	 * @param map 극장번호, 상영날짜
	 * @return 영화목록, 상영시간
	 */
	List<ScreeningDto> getAllMovieTime(Map<String, Object> map);
	
	/**
	 * 극장별 상영시간표 조회하기
	 * @param map
	 * @return 영화목록, 상영시간
	 */
	
	List<TheaterTicketDto> getAllMovieTimeByTheater(Map<String, Object> map); 
	
	/**
	 * 극장번호, 영화번호, 상영날짜로 예매하려는 영화 시간 구하기
	 * @param map 극장번호, 영화번호, 상영날짜
	 * @return 선택된 영화 시간목록
	 */
	List<TicketDto> getMovieTime(Map<String, Object> map);
	
	/**
	 * 극장번호, 영화번호, 상영날짜, 시간으로 예매하려는 영화정보 구하기
	 * @param map 극장번호, 영화번호, 상영날짜, 시간
	 * @return 예매하려는 영화정보
	 */
	TicketDto getMovieByTime(Map<String, Object> map);
	
	/**
	 * 현재 남아있는 좌석 확인하기
	 * @param screeningNo 상영정보가 들어있는 상영번호
	 * @return 좌석상태
	 */
	List<TicketDto> getTicketStatusByScreeningNo(int screeningNo);
	
	/**
	 * 상영번호를 전달하여 해당 상영스케쥴 정보 중 좌석번호, 좌석예매상태, 상영정보 목록을 가져온다.
	 * @param screeningNo 상영번호
	 * @return 좌석번호, 좌석예매상태, 상영정보 목록
	 */
	List<TicketDto> getAllSeat(int screeningNo);
	
	/*
	 * 좌석 임시 선택 
	 */
	void webSocketAjax(int screeningNo, String col, String row, String selectType);
	
}
