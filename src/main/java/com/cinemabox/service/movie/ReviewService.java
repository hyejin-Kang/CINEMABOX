package com.cinemabox.service.movie;

import java.util.List;
import java.util.Map;

import com.cinemabox.vo.Movie;
import com.cinemabox.vo.Review;

public interface ReviewService {
	
	/**
	 * 작성한 리뷰를 추가하기
	 * @param review 리뷰
	 */
	void insertReview(Review review);
	
	/**
	 * 기존에 있는 리뷰의 상태를 N으로 변경하기(삭제처리)
	 * @param review 리뷰
	 */
	void deleteReview(Review review);
	
	/**
	 * 영화 관람 평점을 갱신시키기
	 * @param rm 평점, 영화번호를 담은 맵
	 */
	void updateMovieRating(Movie movie);
	
	/**
	 * 영화번호의 영화의 리뷰 수 가져오기
	 * @param movieNo 영화번호
	 * @return 리뷰 총 개수
	 */
	int getReviewCntByMovieNo(int movieNo);
	
	/**
	 * 작성된 모든 리뷰를 불러오기
	 * @param movieNo 영화번호
	 * @return 상태가 Y인 모든 리뷰
	 */
	List<Review> getAllReviews(int movieNo);
	
	/**
	 * 내가 작성한 리뷰를 불러오기
	 * @param map (영화번호, 유저아이디)
	 * @return 유저 아이디가 작성한 리뷰
	 */
	Review getReviewByUserId(Map<String, Object> map);
}
