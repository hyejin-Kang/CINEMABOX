package com.cinemabox.task;

import java.util.Date;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.cinemabox.dao.coupon.CouponDao;
import com.cinemabox.dao.movie.MovieDao;
import com.cinemabox.dao.ticket.TicketDao;
import com.cinemabox.dto.movie.CloseMovieDto;
import com.cinemabox.dto.ticket.TicketDto;
import com.cinemabox.dto.ticket.WebsocketTicketDto;
import com.cinemabox.service.movie.APIMovieService;
import com.cinemabox.vo.Coupon;
import com.cinemabox.vo.Movie;

@Component
public class Scheduler {

	@Autowired MovieDao movieDao;
	@Autowired TicketDao ticketDao;
	@Autowired CouponDao couponDao;
	@Autowired APIMovieService apiMovieService;

	//해당 클래스에 대한 정보확인
	private static Logger logger = LogManager.getLogger(Scheduler.class);
	
	//오늘날짜
	Date today = new Date();
	
	//쿠폰유통기한에 따른 사용불가 갱신 - 매일밤 12시 정각에 실행
	//@Scheduled(cron = "0 0 0 * * ?")
	@Scheduled(cron = "0 0/1 * * * ? ")
	public void updateCouponExp(){
		logger.info("-----------updateCouponExp 실행-----------");
		List<Coupon> coupons = couponDao.getCouponsByExp();
		for(Coupon item : coupons) {
			item.setStatus("Y");
			couponDao.updateCouponByExp(item);
		}
	}
	
	//개봉일로부터 2달 지난 영화 내리기 - 매일밤 12시마다 실행
	@Scheduled(cron = "0 0 0 * * ? ")
	public void closeMovie() {
		logger.info("-----------closeMovie 실행-----------");
		List<CloseMovieDto> movies = movieDao.getCloseMovies();
		if(movies.size() != 0) {
			for(CloseMovieDto item : movies) {
				item.setScreeningStatus("N");
				movieDao.updateCloseMovie(item);
			}
		}
	}
	
	//개봉한 영화 상영중으로 변경하기 - 매일 오후 12시 정각에 실행
	@Scheduled(cron = "0 0/1 * * * ?")
	public void updateMovieStatus(){
		logger.info("-----------updateMovieStatus 실행-----------");
		//모든 영화정보 가져오기
		List<Movie> movies = movieDao.getUnreleaseMoviesByToday();
		
		for(Movie item : movies) {
			//오늘날짜
			Date today = new Date();
			//개봉일
			Date releaseDate = item.getReleaseDate();
			//오늘날짜 개봉일 비교값
			int value = today.compareTo(releaseDate);
			
			if(value == 0 || value == 1) {
				item.setStatus("Y");
				movieDao.updateMovieStatus(item);
			}
		}
	}
	
	//상영시간이 지난 것 갱신하기 - 매일 1분마다 실행
	@Scheduled(cron = "0 0/1 * * * ? ")
	public void updateScreeningStatus() {
		logger.info("-----------updateScreeningStatus 실행-----------");
		//모든 상영시간 가져오기
		List<TicketDto> times = ticketDao.getAllScreeningTime();

		for(TicketDto item : times) {
			item.setScreeningStatus("N");
			ticketDao.updateScreeningStatus(item);
		}
	}
	
	//api로 새로 추가된 영화 추가하기 - 매일밤 12시마다 실행
	@Scheduled(cron = "0 0 0 * * ? ")
	public void updateMovie() throws Exception {
		logger.info("-----------updateMovie 실행-----------");
		//새로 올라온 영화 추가하기
		apiMovieService.saveMoive();
	}
	
	//크롤링으로 KOBIS의 실시간예매율 가져오기 - 매일 30분마다 실행
	@Scheduled(cron = "0 0/30 * * * ? ")
	public void updateMovieDetail() throws Exception {
		//실시간 예매율에서 예매율, 누적관객수 추가하기
		apiMovieService.crawler();		
		logger.info("-----------박스오피스 예매율, 누적관객수 갱신 완료-----------");
	}
	
	//좌석 선택 후 20분 지난 좌석 원래대로 갱신하기 - 매일 20분마다 실행
	@Scheduled(cron = "0 0/20 * * * ? ")
	public void settingWebSocketSeat() {
		logger.info("-----------임시선택된 좌석 20분마다 갱신후 원상복귀 로직 실행됨-----------");
		//모든 상영시간 가져오기
		List<WebsocketTicketDto> settingSeat = ticketDao.settingWebSocketSeat();

		for(WebsocketTicketDto item : settingSeat) {
			item.setWebTicketStatus("N");
			item.setSeatSelectedDate(null);
			ticketDao.updateWebSocetStatus(item);
		}
	}
	
}
