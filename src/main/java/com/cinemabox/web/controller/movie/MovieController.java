package com.cinemabox.web.controller.movie;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.cinemabox.service.movie.MovieService;
import com.cinemabox.service.movie.ReviewService;
import com.cinemabox.vo.Movie;
import com.cinemabox.vo.Review;
import com.cinemabox.vo.User;
import com.cinemabox.vo.Wishlist;
import com.cinemabox.web.utils.SessionUtils;

@Controller
public class MovieController{
	
	@Autowired MovieService movieService;
	@Autowired ReviewService reviewService;
	
	@GetMapping(path = {"/movie"})
	public String boxoffice(Model model, String sort) {
		List<Movie> nowMovies = movieService.getNowMovieList(sort);
		List<Movie> unreleased = movieService.getUnreleasedMovieList(sort);
		model.addAttribute("nowMovies", nowMovies);
		model.addAttribute("unreleased", unreleased);
		return "movie/boxoffice";	
	}
	
	@GetMapping(path = {"/movieDetail"})
	public String movieDetail(Model model, int no) {
		Movie movieDetail = movieService.getMovieByNo(no);
		model.addAttribute("movieDetail", movieDetail);

		User loginedUser = (User) SessionUtils.getAttribute("LOGINED_USER");
		Wishlist wishlist = new Wishlist();
		if(loginedUser != null) {
			wishlist.setUserId(loginedUser.getId());
		}
		wishlist.setMovieNo(no);
		Wishlist wish = movieService.getLikeByUserId(wishlist);
		model.addAttribute("wish", wish);
		
		int reviewCnt = reviewService.getReviewCntByMovieNo(no);
		model.addAttribute("reviewCnt", reviewCnt);
		
		List<Review> reviews = reviewService.getAllReviews(no);
		model.addAttribute("reviews", reviews);
		
		return "movie/movieDetail";	
	}
	
	@PostMapping(path = {"/movieDetail"})
	public String movieReview(Model model, int no) {
		Movie movieDetail = movieService.getMovieByNo(no);
		model.addAttribute("movieDetail", movieDetail);

		return "movie/movieDetail";	
	}
	
	@PostMapping(path = {"/search"})
	public String search(Model model, String keyword) {
		List<Movie> searchMovies = movieService.getSearchResult(keyword);
		model.addAttribute("searchMovies", searchMovies);
		return "movie/search";	
	}
}
