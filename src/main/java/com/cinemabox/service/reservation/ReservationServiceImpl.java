package com.cinemabox.service.reservation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cinemabox.dao.reservation.ReservationDao;
import com.cinemabox.vo.Reservation;
import com.cinemabox.vo.ReservationTicket;

@Service
@Transactional
public class ReservationServiceImpl implements ReservationService{
	
	@Autowired ReservationDao reservationDao;
	
	@Override
	public void inserPayInfo(Reservation reservation) {
		reservationDao.inserPayInfo(reservation);
	}
	
	@Override
	public int getReservationNoByTicketNo(String ticketNo) {
		return reservationDao.getReservationNoByTicketNo(ticketNo);
	}
	
	@Override
	public void insertTicketNoAndReservationNo(ReservationTicket rt) {
		reservationDao.insertTicketNoAndReservationNo(rt);
	}
	
	@Override
	public int getReservationNoByTicketNos(String ticketNumber) {
		return reservationDao.getReservationNoByTicketNo(ticketNumber);
	}
	
	@Override
	public Reservation getReservedInfoByRno(int rNo) {
		return reservationDao.getReservedInfoByRno(rNo);
	}
}
