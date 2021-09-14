package com.cinemabox.service.movie;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinemabox.dao.movie.MovieDao;
import com.cinemabox.vo.Movie;
import com.cinemabox.vo.Wishlist;

@Service
public class MovieServiceImpl implements MovieService{
	
	@Autowired MovieDao movieDao;
	
	@Override
	public void insertWishlist(Wishlist wishlist) {
		movieDao.insertWishlist(wishlist);
	}
	
	@Override
	public void deleteWishlist(Wishlist wishlist) {
		movieDao.deleteWishlist(wishlist);
	}
	
	@Override
	public void updateMovieLike(Movie movie) {
		movieDao.updateMovieLike(movie);
	}
	
	@Override
	public Wishlist getLikeByUserId(Wishlist wishlist) {
		return movieDao.getLikeByUserId(wishlist);
	}	
	
	@Override
	public List<Movie> getAllmovies() {
		return movieDao.getAllmovies();
	}
	
	@Override
	public Movie getMovieByNo(int no) {
		return movieDao.getMovieByNo(no);
	}
	
	@Override
	public List<Movie> getNowMovieList(String sort) {
		return movieDao.getNowMovieList(sort);
	}

	@Override
	public List<Movie> getUnreleasedMovieList(String sort) {
		return movieDao.getUnreleasedMovieList(sort);
	}

	@Override
	public List<Movie> getSearchResult(String keyword) {
		return movieDao.getSearchResult(keyword);
	}
}
