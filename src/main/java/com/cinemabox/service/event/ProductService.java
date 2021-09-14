package com.cinemabox.service.event;

import java.util.List;

import com.cinemabox.dto.Event.EventDto;
import com.cinemabox.vo.Product;

public interface ProductService {
	
	String getAllProduct(String email);
	
	List<Product> getProductName();

	List<EventDto> getWinnerList(); // 당첨자 조회

}

