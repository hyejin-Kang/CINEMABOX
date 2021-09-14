package com.cinemabox.service.event;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinemabox.dao.event.ProductDao;
import com.cinemabox.dto.Event.EventDto;
import com.cinemabox.vo.Product;

@Service
public class ProductServiceImple implements ProductService{
	
	@Autowired ProductDao productDao;

	/**
	 * 선물상품 고르기 
	 */
	@Override
	public String getAllProduct(String email) {
		
		// 이미 응모한 사용자인지 체크
		int queryResult = productDao.getProductResultByEmail(email);
		if(queryResult > 0) {
			return "existEmail";
		}
		
		// 뽑기 로직
		List<Product> productList = productDao.getAllProduct();
		int prizeProductNo =  (int) (Math.random() * productList.size()) ;
		 
		String prizeProductName = productList.get(prizeProductNo).getGoods();
		
		// DB에 결과값 저장
		HashMap<String,Object> param = new HashMap<String, Object>();
		param.put("email", email);
		param.put("productNo", prizeProductNo+1);
		productDao.insertProductResult(param);
		
		return prizeProductName;
	}

	@Override
	public List<Product> getProductName() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<EventDto> getWinnerList() { // 당첨자 조회
		List<EventDto> winnerList = productDao.getWinnerList();
		
		return winnerList;
	}

}
