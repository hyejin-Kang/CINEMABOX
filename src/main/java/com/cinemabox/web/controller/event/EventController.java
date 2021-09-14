package com.cinemabox.web.controller.event;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cinemabox.dto.Event.EventDto;
import com.cinemabox.dto.Question.QuestionDto;
import com.cinemabox.service.event.EventService;
import com.cinemabox.service.event.ProductService;
import com.cinemabox.vo.Discount;
import com.cinemabox.vo.Event;
import com.cinemabox.vo.Product;




@Controller
@RequestMapping("/event")
public class EventController {
	
	@Autowired
	EventService eventService;	
	@Autowired
	ProductService productService;
	
	/**
	 * 이벤트 홈화면 
	 * @param model
	 * @return
	 */
	@GetMapping("/main")
	public String mainEvent(Model model) {
		List<Event> main = eventService.getAllEvent();
		model.addAttribute("main", main);
		return "event/eventMain";
	}
	
	/**
	 * 이벤트 할인 화면
	 * @param model
	 * @return
	 */
	@GetMapping("/discount")
	public String discountEvent(Model model) {
		return "event/discountMain";
	}
	
	/**
	 * 이벤트 할인 상세화면
	 * @param model
	 * @return
	 */
	@GetMapping("/discountDetail")
	public String discountDetail(int no, Model model) {
		Discount discount =	eventService.detailDiscount(no);
		model.addAttribute("discount", discount);
		return "event/discountDetail";
	}
	
	
	/**
	 * 뽑기 이벤트 화면
	 * @param model
	 * @return
	 */
	@GetMapping("/lotto")
	public String lotto(Model model) {
		List<Product> productName = productService.getProductName();
		model.addAttribute("productName", productName);
		
		// 당첨자 리스트 조회
		List<EventDto> winnerList = productService.getWinnerList();
		model.addAttribute("winnerList",winnerList);
		
		return "event/lotto";
	}
	
	/**
	 * 뽑기
	 * @param model
	 * @return
	 */
	@RequestMapping("/lotto/start")
	public @ResponseBody ResponseEntity<String> getQuestionCountByName(String email) {
		String product = productService.getAllProduct(email);
		return new ResponseEntity<String>(product, HttpStatus.OK);
	}
	
	
	/**
	 * 이벤트 상세 화면
	 * @param model
	 * @return
	 */
	@GetMapping("/detail")
	public String detail(int no, Model model) {
		Event eventDetail = eventService.detailEvent(no);
		model.addAttribute("eventDetail", eventDetail);
		return "event/detailEvent";
	}

}
