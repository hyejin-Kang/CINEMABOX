package com.cinemabox.service.movie;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinemabox.dao.movie.ReviewDao;
import com.cinemabox.vo.Movie;
import com.cinemabox.vo.Review;

@Service
public class ReviewServiceImpl implements ReviewService{

	@Autowired ReviewDao reviewDao;

	@Override
	public void insertReview(Review review) {
		//리뷰 추가하기
		Review comment = new Review();
		comment.setContent(review.getContent());
		comment.setRating(review.getRating());
		comment.setUserId(review.getUserId());
		comment.setMovieNo(review.getMovieNo());
		
		reviewDao.insertReview(comment);
	}
	
	@Override
	public void updateMovieRating(Movie movie) {
		reviewDao.updateMovieRating(movie);
	}
	
	@Override
	public int getReviewCntByMovieNo(int movieNo) {
		return reviewDao.getReviewCntByMovieNo(movieNo);
	}
	
	@Override
	public void deleteReview(Review review) {
		reviewDao.deleteReview(review);
	}
	
	@Override
	public List<Review> getAllReviews(int movieNo) {
		return reviewDao.getAllReviews(movieNo);
	}
	
	@Override
	public Review getReviewByUserId(Map<String, Object> map) {
		return reviewDao.getReviewByUserId(map);
	}
}
