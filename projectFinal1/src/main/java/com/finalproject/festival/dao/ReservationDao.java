package com.finalproject.festival.dao;

import java.util.List;
import java.util.Map;

import com.finalproject.festival.domain.Basket;
import com.finalproject.festival.domain.Reservation;

public interface ReservationDao {
	
	// Reservation 테이블에서 id에 해당하는 productno를 가져오고 product에서 price를 가져와서 장바구니의 product의 개수랑 곱해줘서 넣어주는 거까지 가져오는 거
	public List<Reservation> BasketListByIdByProductno(String id);
	
//	public List<Basket> BasketLisitByIdUsingReservationInsert (String id);
	
	public void insertReservation(String id);
	//public void insertReservation(String id, int productno, int reservationprice, int reservationticketcount);
	
	
	
	
	
	
	
	
	
	
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	/*
	public abstract List<Basket> BasketListById (String id);
	
	public abstract List<Basket> BasketListByProductno (int productno);
	*/
	/////////////////////////////////////////////////////////////////////////////////////////////
	
//	public abstract Map<K, V>
	
	//public abstract Map<String, Object> RreservationList();
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	public List<Map<String, Object>> reservationList(String id, int productno);
	

}
