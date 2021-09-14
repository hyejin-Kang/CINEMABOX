package com.cinemabox.dao.event;

import java.util.HashMap;
import java.util.List;

import com.cinemabox.dto.Event.EventDto;
import com.cinemabox.vo.Product;

public interface ProductDao {

	List<Product> getAllProduct();
	
	List<Product> getProductName();

	int getProductResultByEmail(String email); // 이메일로 당첨결과를 조회함

	void insertProductResult(HashMap<String, Object> param); // 당첨결과를 DB에 저장

	List<EventDto> getWinnerList(); // 당첨자 리스트 조회
	
}
