package com.cinemabox.service.Ticket;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cinemabox.dao.ticket.TicketDao;
import com.cinemabox.dto.ticket.Payload;
import com.cinemabox.dto.ticket.ScreeningDto;
import com.cinemabox.dto.ticket.TheaterTicketDto;
import com.cinemabox.dto.ticket.TicketDto;
import com.cinemabox.dto.ticket.WebsocketTicketDto;
import com.cinemabox.web.utils.JsonUtils;
import com.cinemabox.websocket.handler.AlarmHandler;

@Service
@Transactional
public class TicketServiceImpl implements TicketService{
	
	@Autowired TicketDao ticketDao;
	@Autowired AlarmHandler alarmHandler;
	
	//예매
	@Override
	public List<TicketDto> getMovieListByTheaterNo(Map<String, Object> map) {
		return ticketDao.getMovieListByTheaterNo(map);
	}
	@Override
	public List<TicketDto> getMovieTime(Map<String, Object> map) {
		return ticketDao.getMovieTime(map);
	}
	@Override
	public TicketDto getMovieByTime(Map<String, Object> map) {
		return ticketDao.getMovieByTime(map);
	}
	@Override
	public List<TicketDto> getTicketStatusByScreeningNo(int screeningNo) {
		return ticketDao.getTicketStatusByScreeningNo(screeningNo);
	}
	@Override
	public List<ScreeningDto> getAllMovieTime(Map<String, Object> map) {
		return ticketDao.getAllMovieTime(map);
	}
	@Override
	public List<TheaterTicketDto> getAllMovieTimeByTheater(Map<String, Object> map) {
		return ticketDao.getAllMovieTimeByTheater(map);
	}
	
	// 좌석
	@Override
	public List<TicketDto> getAllSeat(int screeningNo) {
		List<TicketDto> seats = ticketDao.getAllSeat(screeningNo);
		return seats;
	}
	
	// 웹소켓 좌석
	@Override
	public void webSocketAjax(int screeningNo, String col, String row, String selectType) {
		try {
			if("T".equals(selectType)) {
				WebsocketTicketDto wsDto = new WebsocketTicketDto();
				wsDto.setWebScreeningNo(screeningNo);
				wsDto.setWebSeatCol(col);
				wsDto.setWebSeatNo(Integer.parseInt(row));
				// 현재 페이지 영화상영 정보 찾기 위한 객체
				WebsocketTicketDto wstDto = ticketDao.getWebSocketData(wsDto);
				// 좌석상태  T, 좌석변경 데이트 업데이트 코드 //
				wstDto.setWebTicketStatus("T");
				wstDto.setSeatSelectedDate(new Date());
				ticketDao.updateWebSocetStatus(wstDto);
				wstDto.setWebSelectType(selectType);
				// 클라이언트에게 전달한 메세지 및 데이터를 포함하는 Payload객체를 생성한다.
				Payload payload = Payload.builder()
						.title("선택좌석")
						.message(wstDto.getWebSeatCol()+"행 "+ wstDto.getWebSeatRow()+ "번")
						.selectedType("임시선택 Y, 취소 N : " + selectType)
						.data(wstDto).build();
				// Payload객체를 JSON 형식의 텍스트로 변환한다.
				alarmHandler.sendMessage(JsonUtils.toJsonText(payload));
			} else {
				WebsocketTicketDto wsDto = new WebsocketTicketDto();
				wsDto.setWebScreeningNo(screeningNo);
				wsDto.setWebSeatCol(col);
				wsDto.setWebSeatNo(Integer.parseInt(row));
				// 현재 페이지 영화상영 정보 찾기 위한 객체
				WebsocketTicketDto wstDto = ticketDao.getWebSocketData(wsDto);
				// 좌석상태  T, 좌석변경 데이트 업데이트 코드 //
				wstDto.setWebTicketStatus("N");
				wstDto.setSeatSelectedDate(null);
				ticketDao.updateWebSocetStatus(wstDto);
				wstDto.setWebSelectType(selectType);
				// 클라이언트에게 전달한 메세지 및 데이터를 포함하는 Payload객체를 생성한다.
				Payload payload = Payload.builder()
						.title("선택좌석 취소")
						.message(wstDto.getWebSeatCol()+"행 "+ wstDto.getWebSeatRow()+ "번")
						.selectedType("임시선택 Y, 취소 N : " + selectType)
						.data(wstDto).build();
				// Payload객체를 JSON 형식의 텍스트로 변환한다.
				alarmHandler.sendMessage(JsonUtils.toJsonText(payload));
			}
		} catch (DataAccessException ex) {
			throw new RuntimeException("좌석선택 중 오류가 발생하였습니다.");
		}
	}
	
	//스케쥴러
	
}
