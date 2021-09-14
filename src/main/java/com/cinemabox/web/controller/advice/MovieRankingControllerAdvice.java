package com.cinemabox.web.controller.advice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.cinemabox.service.movie.MovieService;
import com.cinemabox.vo.Movie;

@ControllerAdvice
public class MovieRankingControllerAdvice {

	@Autowired MovieService movieService;
	
	@ModelAttribute(name = "NOW_MOVIES")
	public List<Movie> rankingMovies(){
		List<Movie> nowMovies = movieService.getNowMovieList("ticket");
		return nowMovies;
	}
}
