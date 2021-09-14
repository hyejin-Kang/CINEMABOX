package com.cinemabox.web.controller.movie;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cinemabox.dao.movie.ReviewDao;
import com.cinemabox.service.movie.MovieService;
import com.cinemabox.service.movie.ReviewService;
import com.cinemabox.vo.Movie;
import com.cinemabox.vo.Review;
import com.cinemabox.vo.Wishlist;

@Controller
@RequestMapping("/boxoffice")
public class MovieAjaxController {

	@Autowired MovieService movieService;
	@Autowired ReviewDao reviewDao;
	@Autowired ReviewService reviewService;
	
	@RequestMapping("/sort")
	public @ResponseBody ResponseEntity<Map<String, Object>> nowMovieList(String sort){
		List<Movie> nowMovieList = movieService.getNowMovieList(sort);
		List<Movie> unreleasedMovieList = movieService.getUnreleasedMovieList(sort);
		Map<String, Object> map = new HashMap<>();
		map.put("nowMovieList", nowMovieList);
		map.put("unreleasedMovieList",unreleasedMovieList);
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}
	
	@RequestMapping("/like")
	public @ResponseBody ResponseEntity<Movie> like(Wishlist wishlist){
		//현재 영화 정보 찾기
		Movie movie = movieService.getMovieByNo(wishlist.getMovieNo());
		System.out.println("영화정보" + movie);
		//사용자 아이디로 찜한 내역 찾기
		Wishlist isLike = movieService.getLikeByUserId(wishlist);
		
		//현재 영화의 like수 구하기
		int currentLike = movie.getUserLike();
		
		if(isLike == null) {
			movie.setUserLike(currentLike+1);
			movieService.updateMovieLike(movie);
			movieService.insertWishlist(wishlist);
			return new ResponseEntity<Movie>(movie, HttpStatus.OK);
		}
		
		movie.setUserLike(currentLike-1);
		movieService.updateMovieLike(movie);
		movieService.deleteWishlist(wishlist);
		return new ResponseEntity<Movie>(movie, HttpStatus.OK);
	}
	
	@RequestMapping("/review")
	public @ResponseBody ResponseEntity<List<Review>> addReview(Review review, int movieNo){
		
		//사용자가 등록한 관람평 확인
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", review.getUserId());
		map.put("movieNo", movieNo);
		Review isExistReview = reviewService.getReviewByUserId(map);
		
		if(isExistReview == null) {
			//관람평 등록
			reviewService.insertReview(review);
			
			//기존의 영화 평점을 불러와서 추가된 평점으로 평균구하기
			Movie movie = movieService.getMovieByNo(movieNo);
			double avg = reviewDao.getMovieRatingAvg(movieNo);
			movie.setRating(avg);
			reviewService.updateMovieRating(movie);

			//관람평 목록 조회
			List<Review> reviewList = reviewService.getAllReviews(movieNo);
			return new ResponseEntity<List<Review>>(reviewList, HttpStatus.OK);
		}

		return null;
	}
	
	@RequestMapping("/delete")
	public @ResponseBody ResponseEntity<List<Review>> deleteReview(Review review, int movieNo){
		//관람평 삭제
		reviewService.deleteReview(review);
		
		//기존의 영화 평점을 불러와서 추가된 평점으로 평균구하기
		Movie movie = movieService.getMovieByNo(movieNo);
		double avg = reviewDao.getMovieRatingAvg(movieNo);
		movie.setRating(avg);
		reviewService.updateMovieRating(movie);
		
		//관람평 목록 조회
		List<Review> reviewList = reviewService.getAllReviews(movieNo);
		return new ResponseEntity<List<Review>>(reviewList, HttpStatus.OK);
	}
}
