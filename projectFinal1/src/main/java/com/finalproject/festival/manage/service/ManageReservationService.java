package com.finalproject.festival.manage.service;

import java.util.List;
import java.util.Map;

import com.finalproject.festival.domain.Reservation;

public interface ManageReservationService {
	
	public abstract Map<String, Object> manageReservation(int pageNum, String type, String keyword);
	
	public abstract Reservation getManageReservation(int reservationno);
	
	public abstract void updateManageReservation (Reservation reservation);
	
	public abstract void deleteManageReservation (int reservationno);

}
