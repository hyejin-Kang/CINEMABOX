package com.cinemabox.service.movie;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cinemabox.vo.Movie;
import com.cinemabox.vo.Wishlist;

public interface MovieService {

	/**
	 * 사용자가 찜한 영화 추가하기
	 * @param Wishlist 찜한 영화
	 */
	void insertWishlist(Wishlist wishlist);

	/**
	 * 사용자가 찜한 영화 삭제하기
	 * @param wishlist 찜한 영화
	 */
	void deleteWishlist(Wishlist wishlist);
	
	/**
	 * 영화의 like를 갱신하기
	 * @param movie 영화정보
	 */
	void updateMovieLike(Movie movie);
	/**
	 * 사용자가 찜한 영화목록 구하기
	 * @param wishlist
	 * @return 찜한 영화목록
	 */
	Wishlist getLikeByUserId(Wishlist wishlist);

	/**
	 * 전체 영화 목록 조회하기
	 * @return 전체 영화 목록
	 */
	List<Movie> getAllmovies();

	/**
	 * 영화번호로 영화정보를 조회하기
	 * @param no 영화번호
	 * @return 영화번호로 찾은 영화정보
	 */
	Movie getMovieByNo(int no);
	
	/**
	 * 데이터베이스에 있는 영화 리스트(개봉/미개봉)를 반환
	 * @param sort
	 * @return 영화목록
	 */
	List<Movie> getNowMovieList(@Param("sort") String sort);
	List<Movie> getUnreleasedMovieList(@Param("sort") String sort);
	
	/**
	 * 키워드로 영화 검색하기
	 * @param keyword 검색어
	 * @return 검색된 영화목록
	 */
	List<Movie> getSearchResult(String keyword);
}
