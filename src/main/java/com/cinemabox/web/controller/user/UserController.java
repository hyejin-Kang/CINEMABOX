package com.cinemabox.web.controller.user;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cinemabox.dao.user.UserDao;
import com.cinemabox.dto.user.UserDto;
import com.cinemabox.form.user.UserRegisterForm;

import com.cinemabox.service.user.UserService;

import com.cinemabox.vo.User;
import com.cinemabox.web.utils.SessionUtils;

@Controller
public class UserController {

	@Autowired UserService userService;
	@Autowired UserDao userDao;
	
	@GetMapping(path = {"/register"})
	public String register() {
		return "user/registerForm";	
	}
	
	@PostMapping("/register")
	public String register(UserRegisterForm userRegisterForm) {
		// User객체를 생성하고, UserRegisterForm의 값을 User객체로 복사한다.
		User user = new User();
		
		BeanUtils.copyProperties(userRegisterForm, user);
		
		user.setAddress(userRegisterForm.getAddress1() + " " + userRegisterForm.getAddress2());
		// UserService의 registerUser(user)를 호출해서 업무로직을 수행한다. 
		userService.registerUser(user);
				
		return "redirect:register";
	}
	
	@RequestMapping("/myPage")
	public String myPage(Model model) {
		User user = (User) SessionUtils.getAttribute("LOGINED_USER");
		
		
		if(user == null) {
			
			return "redirect:/home?error=login";
		}
		
		
		//구매내역
		List<UserDto> orders = userService.getOrderlistById(user.getId());
		
		//예매내역(티켓)
		List<UserDto> tickets = userService.getMovieReservationsById(user.getId());
		
		//쿠폰함
		List<UserDto> coupons = userService.getCouponsById(user.getId());
		
		//찜한 영화
		List<UserDto> wishlists = userService.getwishListById(user.getId());
		
		//보유 쿠폰 개수 가져오기
		int countCoupon = userService.countCoupon(user.getId()); 
		
		//찜한 영화 개수 가져오기
		int countWishlist = userService.countWishlists(user.getId());
		
		//포인트 가져오기
		 User user2 = userDao.getUserById(user.getId());
	     model.addAttribute("user2", user2);
	     
		//무비노트
		
		model.addAttribute("orders", orders);
		model.addAttribute("tickets", tickets);
		model.addAttribute("coupons", coupons);
		model.addAttribute("wishlists", wishlists);
		model.addAttribute("countCoupon", countCoupon);
		model.addAttribute("countWish", countWishlist);
		
		return "user/myPage";	
	}
	
	
	
	@GetMapping("/logout")
	public String logout() {
		SessionUtils.destroySession();

		return "redirect:home";
	}
}
