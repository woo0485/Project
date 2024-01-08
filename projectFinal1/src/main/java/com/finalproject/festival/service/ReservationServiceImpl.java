package com.finalproject.festival.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.festival.dao.ReservationDao;
import com.finalproject.festival.domain.Reservation;

@Service
public class ReservationServiceImpl implements ReservtionService {
	
	@Autowired
	private ReservationDao RD;
	
	public void setReservationDao(ReservationDao rd) {
		this.RD = rd;
	}

	@Override
	public List<Map<String, Object>> reservationList(String id, int productno) {	
		return RD.reservationList(id, productno);
	}

	/*
	@Override
	public void insertReservation(Reservation r) {
		System.out.println("reservationservice에서 :  productno는 -" + r.getProductno());
		RD.insertReservation(r);
	}
	*/
		
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// id에 해당하는 예약 테이블 정보 전부 조회 - 1월 7일
	/*
	@Override
	public List<Integer> reservationList(String id) {
		return RD.reservationList(id);
	}
	*/

	/*
	// 장바구니에 담긴 정보를 예약 테이블에 저장 -1월 6일
	@Override
	public void insertReservations(String id, List<Integer> productnos, int reservationprice,
			int reservationticketcount, int totalReservationPrice, int salesTotalPrice) {
		RD.insertReservation(id);
	}
	*/
}
