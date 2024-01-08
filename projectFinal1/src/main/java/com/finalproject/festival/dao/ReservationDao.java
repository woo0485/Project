package com.finalproject.festival.dao;

import java.util.List;
import java.util.Map;

import com.finalproject.festival.domain.Reservation;

public interface ReservationDao {
	
	public List<Map<String, Object>> reservationList(String id, int productno);
	
	//public void insertReservation(Reservation r);

}
