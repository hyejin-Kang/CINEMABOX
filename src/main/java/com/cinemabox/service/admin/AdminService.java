package com.cinemabox.service.admin;

import java.util.List;

import com.cinemabox.vo.Hall;
import com.cinemabox.vo.Movie;
import com.cinemabox.vo.Screening;
import com.cinemabox.vo.Theater;
import com.cinemabox.web.utils.Paging;


public interface AdminService {

	/**
	 * 영화 등록 서비스
	 * @param movie 영화 정보
	 */
	 void addMovie(Movie movie);
	 
	 void addSeat(Screening screening);
	 
	 /**
	  * 영화 수정 서비스
	  * @param movie 영화정보
	  */
	 void updateMovie(Movie movie);
	 
	 /**
	  * 검색된 영화정보를 제공하는 서비스
	  * @return 검색된 영화정보 목록
	  */
	 List<Movie> getAllSearchMovies(String movieTitle);
	 
	 /**
	 * 삭제된 영화정보를 제공하는 서비스
	 * @return 삭제된 영화정보 목록
	 */
	List<Movie> getAllDeleteMovies();
	
	/**
	 * 지정된 영화번호에 해당하는 영화의 상세정보를 제공하는 서비스
	 * @param movieNo 영화번호
	 * @return 영화정보
	 */
	Movie getMovieByNo(int movieNo);
	
	
	/**
	 * 지정된 영화 상영번호에 해당하는 영화를 삭제상태로 변경하는 서비스
	 * @param movieNo 영화 번호
	 */
	void deleteMovie(int movieNo);
	
	/**
	 * 지정된 영화 상영번호에 해당하는 영화를 삭제상태를  상영상태로 복원하는 서비스
	 * @param movieNo 영화 번호
	 */
	void recoveryMovie(int movieNo);
	
	/**
	 * 영화 상영을 시키는 서비스
	 * @param screening 영화 상영정보
	 */
	void addScreening(Screening screening);
	
	/**
	 * 상영정보 수정 서비스
	 * @param screening 영화 상영정보
	 */
	void updateScreening(Screening screening);
	
	/**
	 * 지정된 영화 상영번호에 해당하는 영화상영 정보를 제공하는 서비스
	 * @param screeningNo 영화 상영 번호
	 * @return 영화 상영 정보
	 */
	Screening getScreeningByNo(int screeningNo);
	
	/**
	 * 지정된 영화번호에 해당하는 영화의 상영정보를 제공하는 서비스
	 * @param moiveNo 영화 번호
	 * @return 상영정보
	 */
	List<Screening> getScreeningsByMovieNo(int moiveNo);
	
	/**
	 * 모든 극장 정보를 제공하는 서비스
	 * @return 극장정보
	 */
	List<Theater> getAllTheaterInfo();
	
	/**
	 * 모든 상영관 정보를 제공하는 서비스
	 * @return 상영관 정보
	 */
	List<Hall> getAllHallInfo();
	
	/**
	 * 페이지 총갯수를 구해주는 서비스
	 * @return 페이지 총 갯수
	 */
	int countBoard();
	
	/**
	 * 페이징처리후 Moive 정보를 제공하는 서비스
	 * @param page
	 * @return Moive 정보
	 */
	List<Movie> selectMoivePaging(Paging page);
}
