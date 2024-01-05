package com.finalproject.festival.manage.dao;

import java.util.List;

import com.finalproject.festival.domain.Reservation;

public interface ManageReservationDao {
	
	//12 월 매출
	public abstract List<Reservation> saleTotalPrice12();
	
	//11 월 매출
	public abstract List<Reservation> saleTotalPrice11();
	
	//10 월 매출
	public abstract List<Reservation> saleTotalPrice10();
	
	//9 월 매출
	public abstract List<Reservation> saleTotalPrice9();
	
	//8 월 매출
	public abstract List<Reservation> saleTotalPrice8();
	
	//7 월 매출
	public abstract List<Reservation> saleTotalPrice7();
	
	//6 월 매출
	public abstract List<Reservation> saleTotalPrice6();
	
	//5 월 매출
	public abstract List<Reservation> saleTotalPrice5();
	
	//4 월 매출
	public abstract List<Reservation> saleTotalPrice4();
	
	//3 월 매출
	public abstract List<Reservation> saleTotalPrice3();
	
	//2 월 매출
	public abstract List<Reservation> saleTotalPrice2();
	
	//1 월 매출
	public abstract List<Reservation> saleTotalPrice1();
	
	//일 매출 베스트
	public abstract List<Reservation> bestDayManageReservation();
	
	//일 매출
	public abstract List<Reservation> manageReservation2(int start, int num, String type, String keyword);
	
	public abstract int getDateCount(String type, String keyword);
	
	public abstract int getBoardCount(String type, String keyword);
	
	public abstract List<Reservation> manageReservation(int start, int num, String type, String keyword);
	
	public abstract Reservation getManageReservation(int reservationno);
	
	public abstract void updateManageReservation (Reservation reservation);
	
	public abstract void deleteManageReservation (int reservationno);

}
