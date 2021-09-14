package com.cinemabox.web.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cinemabox.service.user.UserService;
import com.cinemabox.vo.User;

@Controller
@RequestMapping("/userLogin")
public class UserAjaxController {

	@Autowired
	UserService userService;
	
	
	@PostMapping("/login")
	public @ResponseBody ResponseEntity<Void> login(String id, String password) {
		try {
			userService.login(id, password);
			return new ResponseEntity<>(HttpStatus.OK);	// 200
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);	// 500
		}
	}
	
	
	@PostMapping("/kakaoLogin")
	public @ResponseBody ResponseEntity<Void> kakaoLogin(String id, String name){
		User kakaoUser = new User();
		
		kakaoUser.setId(id);
		kakaoUser.setName(name);
		
		userService.kakaoLogin(kakaoUser);
		
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	
	/*
	@PostMapping("/kakaoLogin")
	public @ResponseBody ResponseEntity<int > login(@RequestParam("id") String kakaoId, 
		   @RequestParam("name") String kakaoName, @RequestParam("birth") String kakaoBirth) {
		
		//계정이 있는지 없는지 판단 - 0: 계정 없음 1:계정있음
		int value = userService.kakaoLogin(kakaoId);
		
		
		return new ResponseEntity<int>(value, HttpStatus.OK);
	}
	
	*/
	
	
}
