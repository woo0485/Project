package com.finalproject.festival.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.finalproject.festival.domain.Reservation;

public interface ReservationService {
	// Reservation 테이블에서 id에 해당하는 productno를 가져오고 product에서 price를 가져와서 장바구니의 product의 개수랑 곱해줘서 넣어주는 거까지 가져오는 거
	public void fromBasketToReservation(HttpSession session);
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// id에 해당하는 예약 테이블 조회 -1월 6일- 단순히 조회만...
	public List<Reservation> reservationList(String id);
}
