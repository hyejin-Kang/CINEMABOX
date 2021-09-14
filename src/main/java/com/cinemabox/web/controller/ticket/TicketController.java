package com.cinemabox.web.controller.ticket;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.HttpSessionRequiredException;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.cinemabox.dao.coupon.CouponDao;
import com.cinemabox.dao.ticket.TicketDao;
import com.cinemabox.dao.user.UserDao;
import com.cinemabox.dto.ticket.TicketDto;
import com.cinemabox.service.Ticket.TicketService;
import com.cinemabox.service.coupon.CouponService;
import com.cinemabox.service.reservation.ReservationService;
import com.cinemabox.service.user.UserService;
import com.cinemabox.vo.Coupon;
import com.cinemabox.vo.Reservation;
import com.cinemabox.vo.ReservationTicket;
import com.cinemabox.vo.User;
import com.cinemabox.web.utils.SessionUtils;

@Controller
@SessionAttributes({"ticketDto"})
public class TicketController{
	@Autowired TicketService ticketService;
	@Autowired ReservationService reservationService;
	@Autowired UserService userService;
	@Autowired CouponService couponService;
	@Autowired UserDao userDao;
	@Autowired TicketDao ticketDao;
	@Autowired CouponDao couponDao;
	
	@GetMapping(path = {"/ticket"})
	public String ticket(Model model) {
		TicketDto ticketDto = new TicketDto();
		model.addAttribute("ticketDto", ticketDto);
		return "ticket/ticket";	
	}
	
	@GetMapping(path = {"/schedule"})
	public String schedule(Model model) {
		return "ticket/schedule";	
	}
	
	@PostMapping(path = {"/seat"})
	public String seat(Model model, @ModelAttribute("ticketDto") TicketDto ticketDto) throws HttpSessionRequiredException{
		List<TicketDto> seats = ticketService.getAllSeat(ticketDto.getScreeningNo());
		model.addAttribute("tickets", ticketDto);
		model.addAttribute("seats", seats);
		return "ticket/seat";	
	}
	
	@PostMapping(path = {"/payment"})
	public String payment(Model model, @ModelAttribute("ticketDto") TicketDto ticketDto) {
		// 좌석 행, 열 표시하기
		String[] cols = ticketDto.getSeatCol().split(" ");
		String[] rows = ticketDto.getSeatRow().split(" ");
		String seat = "";
		for(int i=0;i < cols.length; i++ ) {
			seat += cols[i];
			seat += rows[i];
			seat += " ";
		}
		model.addAttribute("seat", seat);
		// 쿠폰 표시하기
		User loginUser = (User) SessionUtils.getAttribute("LOGINED_USER");
		List<Coupon> coupons = couponDao.getAllMyCoupon(loginUser.getId());
		model.addAttribute("coupons", coupons);
		// 포인트 표시하기
		User user = userDao.getUserById(loginUser.getId());
		model.addAttribute("user", user);
		model.addAttribute("tickets", ticketDto);
		return "ticket/payment";
	}
	
	@PostMapping(path = {"/complete"})
	public String complete(Model model, @ModelAttribute("ticketDto") TicketDto ticketDto, SessionStatus sessionStatus, Reservation reservation) {
		System.out.println("====="+ticketDto.toString());
		System.out.println("====="+reservation.toString());
		// 사용한 쿠폰 사용 완료 처리 하기 //
		if(!(reservation.getSerialNo().isEmpty())) {
			String serialNo = reservation.getSerialNo();
			couponService.updateUsedCoupon(serialNo);
		}
		
		// 시트번호로 티켓번호를 알아내고 해당 티켓상태를 예매완료로 바꿔주기 //
		String ticketNumber = "";
		String[] seats = ticketDto.getSeatNo().split(" ");
		for (String str : seats) {
			TicketDto tDto = new TicketDto();
			tDto.setSeatNo(str);
			tDto.setScreeningNo(ticketDto.getScreeningNo());
			TicketDto ticketDtoNo = ticketDao.getTicketNo(tDto);
			// 티켓 예매상태 Y로 업데이트 //
			ticketDao.updateTicketReservationStatus(ticketDtoNo.getTicketNo());
			// 티켓번호 복수의 티켓번호가 존재하면 공백을 기준으로 붙여 담아줌 //
			ticketNumber += Integer.toString(ticketDtoNo.getTicketNo()) + " ";
		}
		// 시트번호로 티켓번호를 알아내고 해당 티켓상태를 예매완료로 바꿔주기 //
		
		// 결제완료 후 예약 테이블 결제관련 정보 저장 //
		reservation.setStatus("Y");
		reservation.setPayStatus("Y");
		double point = reservation.getTotalPrice()*0.03;
		reservation.setPoint(point);
		reservation.setMovieNo(ticketDto.getMovieNo());
		reservation.setTicketNos(ticketNumber);
		reservation.setAdultCnt(ticketDto.getAdultCnt());
		reservation.setTeenagerCnt(ticketDto.getTeenagerCnt());
		reservation.setSeatNo(ticketDto.getSeatNo());
		reservation.setSeatCol(ticketDto.getSeatCol());
		reservation.setSeatRow(ticketDto.getSeatRow());
		reservation.setScreeningDate(ticketDto.getScreeningDate());
		reservation.setScreeningTime(ticketDto.getScreeningTime());
		reservation.setScreeningEndTime(ticketDto.getScreeningEndTime());
		reservation.setHallName(ticketDto.getHallName());
		reservation.setTheaterName(ticketDto.getTheaterName());
		reservation.setTitle(ticketDto.getTitle());
		reservation.setScreeningNo(ticketDto.getScreeningNo());
		reservation.setTheaterNo(ticketDto.getTheaterNo());
		reservation.setHallNo(ticketDto.getHallNo());
		reservationService.inserPayInfo(reservation);
		// 결제완료 후 예약 테이블 결제관련 정보 저장 //	
		
		// 각각의 티켓번호와 reservation번호를 reservation_ticket테이블에 저장하기 //
		String[] ticketNoSplit = ticketNumber.split(" ");
		for (String ticketNo : ticketNoSplit) {
			int reservationNo = reservationService.getReservationNoByTicketNo(ticketNo);
			ReservationTicket rt = new ReservationTicket();
			rt.setReservationNo(reservationNo);
			rt.setTicketNo(Integer.parseInt(ticketNo));
			reservationService.insertTicketNoAndReservationNo(rt);
		}
		// 각각의 티켓번호와 reservation번호를 reservation_ticket테이블에 저장하기 //
		
		// user에 포인트 적립 //
		User loginedUser = (User) SessionUtils.getAttribute("LOGINED_USER");
		User users = userDao.getUserById(loginedUser.getId());
		User user = new User();
		if(reservation.getUsedPoint() == null) {
			user.setPoint((users.getPoint() + (int) Math.round(point)));
		}else {
			user.setPoint((users.getPoint() + (int) Math.round(point))- reservation.getUsedPoint());
		}
		user.setId(reservation.getUserId());
		userService.updatePayPoint(user);
		// user에 포인트 적립 // 
		
		// model로 방금 저장한 결제 정보및 티켓dto정보를 뿌려주기 위해 값을 전달 //
			// 1. 좌석 행열 합쳐서 표시 //
			String[] cols = ticketDto.getSeatCol().split(" ");
			String[] rows = ticketDto.getSeatRow().split(" ");
			String seat = "";
			for(int i=0;i < cols.length; i++ ) {
				seat += cols[i];
				seat += rows[i];
				seat += " ";
			}
			// 3. 예매번호 표시 //
			int reservationNo = reservationService.getReservationNoByTicketNos(ticketNumber);
			String age = ticketDto.getAge();
		//이 컨트롤러의 @SessionAttributes 어노테이션으로 HttpSession객체에 저장했던 객체를 전부 지운다.
		//이 요청핸들러(컨트롤러) 내에서 사용했던 세션값만 지움
		sessionStatus.setComplete(); 
		return "redirect:complete?rNo="+reservationNo+"&seat="+seat+"&age="+age;
	}
	
	@GetMapping(path = {"/complete"})
	public String completeResult(Model model, int rNo, String seat, String age) {
		Reservation rInfo = reservationService.getReservedInfoByRno(rNo);
		model.addAttribute("rInfo", rInfo);
		model.addAttribute("age", age);
		model.addAttribute("reservationNo", rNo);
		model.addAttribute("seat", seat);
		return "ticket/complete";
	}

}
