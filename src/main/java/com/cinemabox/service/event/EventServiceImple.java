package com.cinemabox.service.event;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinemabox.dao.event.EventDao;
import com.cinemabox.vo.Discount;
import com.cinemabox.vo.Event;

@Service
public class EventServiceImple implements EventService{
	
	@Autowired EventDao eventDao;
	
	@Override
	public List<Event> getAllEvent(){
		// 이벤트 모든 정보 조회
		return eventDao.getAllEvent();
	}
	
	@Override
	public Event detailEvent(int no) {
		// 이벤트 종류별 상세조회
		return eventDao.detailEvent(no);
	}

	@Override
	public Discount detailDiscount(int no) {
		// 제휴 할인 상세 조회
		return eventDao.detailDiscount(no);
	}

}
