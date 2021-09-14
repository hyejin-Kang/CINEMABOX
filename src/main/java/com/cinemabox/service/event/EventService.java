package com.cinemabox.service.event;

import java.util.List;

import com.cinemabox.vo.Discount;
import com.cinemabox.vo.Event;

public interface EventService {

	List<Event> getAllEvent();
	// 이벤트 모든 정보 조회
	Event detailEvent(int no);
	// 이벤트 종류별 상세조회
	Discount detailDiscount(int no);
	// 제휴할인 상세조회
}
