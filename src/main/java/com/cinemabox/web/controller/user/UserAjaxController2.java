package com.cinemabox.web.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cinemabox.service.user.UserService;

@Controller
@RequestMapping("/userRegister")
public class UserAjaxController2 {

	@Autowired
	UserService userService;
	
	
	@PostMapping("/idCheck")
	@ResponseBody
	public String idCheck(String id) {
		
		return userService.getUserById(id);
		
	}
	
	@PostMapping("/emailCheck")
	@ResponseBody
	public String emailCheck(String email) {
		
		return userService.getUserByEmail(email);
	}
}
