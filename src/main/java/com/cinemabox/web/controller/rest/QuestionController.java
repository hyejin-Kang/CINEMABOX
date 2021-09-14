package com.cinemabox.web.controller.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.cinemabox.service.theater.Question.QuestionService;
import com.cinemabox.vo.Question;

@RestController
@RequestMapping("/question")
public class QuestionController {

	@Autowired //서비스를 매핑함 ( 컨트롤러 어디서든 서비스기능을 사용할 수 있게 )
	QuestionService questionService;
	
	@PostMapping("/satisfaction")
	public @ResponseBody void updateSatisfaction(Question question) { //프론트에서든 Question 객체에 값을 넣기
		
		// 서비스를 호출하여 만족도를 수정
		 questionService.updateSatisfaction(question);
		 System.out.println("만족도"+ question.toString());
	
	}
	
//	@PostMapping("/list/count")
//	public @ResponseBody int getQuestionCountByName(@RequestBody QuestionDto param) {
//		return questionService.getQuestionCountByName(param);
//	}
	
}
