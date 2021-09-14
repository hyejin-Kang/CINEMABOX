package com.cinemabox.web.controller.theater;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cinemabox.dto.ticket.TheaterTicketDto;
import com.cinemabox.service.Ticket.TicketService;
import com.cinemabox.service.theater.TheaterService;
import com.cinemabox.vo.Theater;

@Controller
@RequestMapping("/theater")
public class TheateHomeAjaxController{
	
	@Autowired
	TheaterService theaterService;
	@Autowired TicketService ticketService;
	
	@RequestMapping("/place")
	public @ResponseBody ResponseEntity<List<Theater>> viewPlace(@RequestParam("location") String location) {
		List<Theater> allLocations = theaterService.getAllLocation(location);
		return new ResponseEntity<List<Theater>>(allLocations, HttpStatus.OK);
	}
	
	@RequestMapping("/specialDetail")
	public @ResponseBody ResponseEntity<List<Theater>> specialDetail(@RequestParam("specialHall")String specialHall) {
		List<Theater> specialHallName = theaterService.specialHallLoca(specialHall);
		return new ResponseEntity<List<Theater>>(specialHallName, HttpStatus.OK);	
	}

	//상영시간표 - 극장선택으로 영화목록, 상영시간 불러오기
	@RequestMapping("/schedule")
	public @ResponseBody ResponseEntity<List<TheaterTicketDto>> theaterMovieTime
	(@RequestParam(value="theaterNo",required = false, defaultValue = "-1") int theaterNo
	,@RequestParam(value="screeningDate",required = false) @DateTimeFormat(pattern = "yyyyMMdd") Date screeningDate){
		//극장과 날짜에 따른 영화목록 시간표
		HashMap<String, Object> time = new HashMap<String, Object>();
		
		if(theaterNo != -1) {
			time.put("theaterNo", theaterNo);
		}
		
		time.put("screeningDate", screeningDate);
		List<TheaterTicketDto> times = ticketService.getAllMovieTimeByTheater(time);
		
		return new ResponseEntity<List<TheaterTicketDto>>(times, HttpStatus.OK);
	}
}
