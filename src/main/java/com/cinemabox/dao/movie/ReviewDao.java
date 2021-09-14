package com.cinemabox.dao.movie;

import java.util.List;
import java.util.Map;

import com.cinemabox.vo.Movie;
import com.cinemabox.vo.Review;

public interface ReviewDao {

	void insertReview(Review review);
	void deleteReview(Review review);
	void updateMovieRating(Movie movie);
	int getReviewCntByMovieNo(int movieNo);
	List<Review> getAllReviews(int movieNo);
	Review getReviewByUserId(Map<String, Object> map);
	double getMovieRatingAvg(int movieNo);
}
