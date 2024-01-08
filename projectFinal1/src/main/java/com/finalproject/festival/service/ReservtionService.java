package com.finalproject.festival.service;

import java.util.List;
import java.util.Map;

import com.finalproject.festival.domain.Reservation;

public interface ReservtionService {
	
	// id에 해당하는 예약 테이블 조회 -1월 6일
	public List<Map<String, Object>> reservationList(String id, int productno);
	
	//public void insertReservation(Reservation r);
	
	
	//public List<Map<String, Object>> reservationList(String id, List<Integer> productno);
	
	//public List<Map<String, Object>> reservationList(String id, int[] productnos);
	

	//public abstract List<Map<String, Object>> reservationList(String id);
//	public List<Integer> reservationList(String id);
	
	
	// 장바구니에 담긴 정보를 예약 테이블에 저장 -1월 6일
	//public void insertReservations(String id, List<Integer> productnos, int reservationprice, int reservationticketcount, int totalReservationPrice, int salesTotalPrice);
	

}
