package com.finalproject.festival.dao;

import java.util.List;

import com.finalproject.festival.domain.Basket;
import com.finalproject.festival.domain.Reservation;

public interface ReservationDao {
	
	public void insertReservation(String id);

	public void updateProductRemainTicketCount(int productNo, int basketProductCount);
	
	// Member에 totalpay update해주는 것 updateMemberTotalpay
	public void updateMemberTotalPay(String id, int totalPrice);
	
	public List<Reservation> myReservation (String id);
	
	public List<Reservation> reservationList(String id);	

	
	

}
