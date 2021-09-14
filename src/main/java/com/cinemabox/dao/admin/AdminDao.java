package com.cinemabox.dao.admin;

import java.util.List;

import com.cinemabox.vo.Hall;
import com.cinemabox.vo.Movie;
import com.cinemabox.vo.Screening;
import com.cinemabox.vo.Theater;
import com.cinemabox.web.utils.Paging;

public interface AdminDao  {
	
	void insertMovie(Movie movie);
	void updateMovie(Movie movie);
	void deleteMovie(int movieNo);
	void recoveryMovie(int movieNo);
	Movie getMovieByNo(int movieNo);
	List<Movie> getAllDeleteMovies();
	List<Theater> getAllTheaterInfo();
	List<Hall> getAllHallInfo();
	List<Movie> getAllSearchMovies(String movieTitle);
	
	void insertSeat(Screening screening);
	
	void insertScreening(Screening screening);
	void updateScreening(Screening screening);
	Screening getScreeningByNo(int screeningNo);
	
	List<Screening> getScreeningsByMovieNo(int moiveNo);
	
	// 페이징 처리
	// 게시물 총 갯수
	int countBoard();

	// 페이징 처리 게시글 조회
	List<Movie> selectMoivePaging(Paging page);
}
