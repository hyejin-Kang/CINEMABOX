package com.cinemabox.web.controller.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cinemabox.service.theater.Notice.NoticeService;

@RestController //  
@RequestMapping("/notice") // 컨트롤러의 메인 url을 지정하는 부분
public class NoticeController {
	
	@Autowired
	NoticeService noticeService; // 공지사항 서비스를 연결시키는 부분

}
