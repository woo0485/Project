package com.finalproject.festival.service;

import java.util.List;
import java.util.Map;

import org.w3c.dom.ls.LSInput;

import com.finalproject.festival.domain.Reservation;

public interface ReservtionService {
	// Reservation 테이블에서 id에 해당하는 productno를 가져오고 product에서 price를 가져와서 장바구니의 product의 개수랑 곱해줘서 넣어주는 거까지 가져오는 거
	// insert하면서 select 동시에 해준다. => 서비스에서 처리해줌
	public List<Reservation> BasketListByIdByProductno (String id, Reservation r);
	
	
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// id에 해당하는 예약 테이블 조회 -1월 6일- 단순히 조회만...
	public List<Map<String, Object>> reservationList(String id, int productno);
	//public abstract List<Reservation> reservationList();
	
//	public void insertReservation(Reservation r);
	
	
	//public List<Map<String, Object>> reservationList(String id, List<Integer> productno);
	
	//public List<Map<String, Object>> reservationList(String id, int[] productnos);
	

	//public abstract List<Map<String, Object>> reservationList(String id);
//	public List<Integer> reservationList(String id);
	
	
	// 장바구니에 담긴 정보를 예약 테이블에 저장 -1월 6일
	//public void insertReservations(String id, List<Integer> productnos, int reservationprice, int reservationticketcount, int totalReservationPrice, int salesTotalPrice);
	

}
