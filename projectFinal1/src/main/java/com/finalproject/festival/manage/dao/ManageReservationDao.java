package com.finalproject.festival.manage.dao;

import java.util.List;

import com.finalproject.festival.domain.Reservation;

public interface ManageReservationDao {
	
	public abstract int getBoardCount(String type, String keyword);
	
	public abstract List<Reservation> manageReservation(int start, int num, String type, String keyword);
	
	public abstract Reservation getManageReservation(int reservationno);
	
	public abstract void updateManageReservation (Reservation reservation);
	
	public abstract void deleteManageReservation (int reservationno);

}
