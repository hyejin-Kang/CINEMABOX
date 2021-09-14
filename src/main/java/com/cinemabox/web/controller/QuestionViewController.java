package com.cinemabox.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cinemabox.dto.Question.AnswerDto;
import com.cinemabox.dto.Question.QuestionDto;
import com.cinemabox.service.theater.Notice.NoticeService;
import com.cinemabox.service.theater.Question.QuestionService;
import com.cinemabox.vo.Notice;
import com.cinemabox.vo.Question;

@Controller
@RequestMapping("/customerCenter")
public class QuestionViewController {
	
	@Autowired
	QuestionService questionService;
	
	@Autowired
	NoticeService noticeService;
	
	/**
	 * 고객센터 메인페이지
	 * @param no
	 * @param redirectAttributes
	 * @return
	 */
	@GetMapping("/main")
	public String maincustomerCenter(Model model) {
		List<Notice> noticeList = noticeService.noticeMain();
		// 페이지에 공지사항 목록 전달하기
		model.addAttribute("noticeList", noticeList);
		// 뷰페이지로 내부이동하기
		return "customerCenter/questionMain";
	}
	
	/**
	 * 고객센터 문의 페이지 
	 * @param no
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping("/list")
	public String questionList(String name, String email, Model model) {
		List<Question> list = questionService.getQuestionByName(name, email);
		model.addAttribute("list", list);
		return "customerCenter/questionList";
	}
	
	/**
	 * 고객센터 문의 상세페이지
	 * @param no
	 * @param redirectAttributes
	 * @return
	 */
	@GetMapping("/detail")
	public String questionDetail(int no, Model model) {
		Question questionDetail = questionService.detailQuestion(no);
		model.addAttribute("questionDetail", questionDetail);
		System.out.println("questionDetail ===> "+questionDetail.toString());
		return "customerCenter/questionDetail";
	}
	
	/**
	 * 문의 글작성 페이지 
	 * @param no
	 * @return
	 */
	@GetMapping("/add")
	public String addQuestion() {
		
		return "customerCenter/questionWrite";
	}
	
	/**
	 * 문의 글작성 후 페이지 이동 
	 * @param no
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping("/insertQuestion")
	public String insertQuestion(QuestionDto question, RedirectAttributes redirectAttributes) {
		System.out.println("question ==> "+question.toString());
		questionService.addQuestion(question);
		return "redirect:userInfo";
	}
	
	/**
	 * 답변 글작성 페이지 
	 * @param no
	 * @return
	 */
	@GetMapping("/addAnswer")
	public String addAnswer(int questionNo, Model model) {
		Question questionDetail = questionService.detailQuestion(questionNo);
		model.addAttribute("questionDetail", questionDetail);
		return "customerCenter/answerWrite";
	}
	
	/**
	 * 답변 글작성 후 페이지 이동
	 * @param no
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping("/insertAnswer")
	public String insertAnswer(AnswerDto answer, RedirectAttributes redirectAttributes) {
		questionService.addAnswer(answer);
		return "redirect:userInfo";
	}
	
	
	/**
	 * 문의 글 작성 전 개인 정보 입력 
	 * @param no
	 * @param redirectAttributes
	 * @return
	 */
	@GetMapping("/userInfo")
	public String userform() {
		
		return "customerCenter/userInfo";
	}
	
	

	/**
	 * 문의 글 삭제  
	 * @param no
	 * @param redirectAttributes
	 * @return
	 */
	@GetMapping("/delete")
	public String questionDelete(@RequestParam int questionNo, RedirectAttributes redirectAttributes) {
		questionService.deleteQuestion(questionNo);
		redirectAttributes.addAttribute("questionNo", questionNo);	
		return "redirect:userInfo";
	}
	
	
	@RequestMapping("/list/count")
	public @ResponseBody ResponseEntity<Integer> getQuestionCountByName(QuestionDto param) {
		int count = questionService.getQuestionCountByName(param);
		return new ResponseEntity<Integer>(count, HttpStatus.OK);
	}
	

}
