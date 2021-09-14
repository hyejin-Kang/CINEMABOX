package com.cinemabox.dao.movie;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cinemabox.dto.movie.CloseMovieDto;
import com.cinemabox.vo.Movie;
import com.cinemabox.vo.Wishlist;

public interface MovieDao {

	void insertMovie(Movie movie);
	void updateMovieRateCnt(Movie movie);
	void updateMovieStatus(Movie movie);
	
	void insertWishlist(Wishlist wishlist);
	void deleteWishlist(Wishlist wishlist);
	void updateMovieLike(Movie movie);
	Wishlist getLikeByUserId(Wishlist wishlist);
	
	List<Movie> getAllmovies();
	Movie getMovieByNo(int no);
	List<Movie> getNowMovieList(@Param("sort") String sort);
	List<Movie> getUnreleasedMovieList(@Param("sort") String sort);
	
	List<Movie> getUnreleaseMoviesByToday();
	List<Movie> getSearchResult(String keyword);
	
	void updateCloseMovie(CloseMovieDto closeMovieDto);
	List<CloseMovieDto> getCloseMovies();
}
