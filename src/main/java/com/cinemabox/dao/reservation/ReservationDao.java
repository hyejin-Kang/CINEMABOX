package com.cinemabox.dao.reservation;

import com.cinemabox.vo.Reservation;
import com.cinemabox.vo.ReservationTicket;

public interface ReservationDao {
	/**
	 * 예약내역 정보를 예약내역테이블에 저장
	 * @param reservation 예약내역 정보
	 */
	void inserPayInfo(Reservation reservation);
	
	/**
	 * 스트링타입의 티켓번호를 전달받아 해당하는 예매내역번호를 반환받는다.
	 * @param ticketNo 스트링타입의 티켓번호
	 * @return 예매내역번호
	 */
	int getReservationNoByTicketNo(String ticketNo);
	
	/**
	 * 예매내역티켓객체(티켓번호, 예매내역번호)를 전달받아 등록시킨다.
	 * @param rt 예매내역티켓객체(티켓번호, 예매내역번호)
	 */
	void insertTicketNoAndReservationNo(ReservationTicket rt);
	
	/**
	 * 예약번호를 전달 받아 예약정보를 반환한다.
	 * @return 예약번호
	 */
	Reservation getReservedInfoByRno(int rNo);
}
