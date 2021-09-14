package com.cinemabox.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.cinemabox.service.movie.MovieService;
import com.cinemabox.service.theater.Notice.NoticeService;
import com.cinemabox.vo.Movie;
import com.cinemabox.vo.Notice;

@Controller
public class HomeController{
	@Autowired
	NoticeService noticeService;
	@Autowired 
	MovieService movieService;
	
	@GetMapping(path = {"/", "/home"})
	public String home(Model model, String sort) {
		//박스오피스 뿌리기
		List<Movie> boxOfficeMovies = movieService.getNowMovieList(sort);
		model.addAttribute("nowMovies", boxOfficeMovies);
		
		//이벤트 뿌리기
		
		
		//스페셜 관 뿌리기
		
		
		//공지사항 뿌리기
		List<Notice> noticeList = noticeService.noticeMain();
		model.addAttribute("noticeList", noticeList);
		
		return "home";	
	}
	
	
	
}
