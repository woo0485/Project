package com.finalproject.festival.domain;

import java.sql.Timestamp;
import java.time.LocalDateTime;

public class Reservation {

	private int reservationno;
	private String id;
	private int productno;
	private int reservationprice;
	private int reservationticketcount;
	private Timestamp reservationdate;
//	private LocalDateTime reservationdate;

	private int totalReservationPrice;
	private int salesTotalPrice;
	
	public Reservation() {}

	public Reservation(int reservationno, String id, int productno, int reservationprice, int reservationticketcount,
			Timestamp reservationdate, int totalReservationPrice, int salesTotalPrice) {
		super();
		this.reservationno = reservationno;
		this.id = id;
		this.productno = productno;
		this.reservationprice = reservationprice;
		this.reservationticketcount = reservationticketcount;
		this.reservationdate = reservationdate;
		this.totalReservationPrice = totalReservationPrice;
		this.salesTotalPrice = salesTotalPrice;
	}

	public int getReservationno() {
		return reservationno;
	}

	public void setReservationno(int reservationno) {
		this.reservationno = reservationno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getProductno() {
		return productno;
	}

	public void setProductno(int productno) {
		this.productno = productno;
	}

	public int getReservationprice() {
		return reservationprice;
	}

	public void setReservationprice(int reservationprice) {
		this.reservationprice = reservationprice;
	}

	public int getReservationticketcount() {
		return reservationticketcount;
	}

	public void setReservationticketcount(int reservationticketcount) {
		this.reservationticketcount = reservationticketcount;
	}

	public int getTotalReservationPrice() {
		return totalReservationPrice;
	}

	public void setTotalReservationPrice(int totalReservationPrice) {
		this.totalReservationPrice = totalReservationPrice;
	}

	public int getSalesTotalPrice() {
		return salesTotalPrice;
	}

	public void setSalesTotalPrice(int salesTotalPrice) {
		this.salesTotalPrice = salesTotalPrice;
	}

	public Timestamp getReservationdate() {
		return reservationdate;
	}

	public void setReservationdate(Timestamp reservationdate) {
		this.reservationdate = reservationdate;
	}
	
	

	/*
	public LocalDateTime getReservationdate() {
		return reservationdate;
	}

	public void setReservationdate(LocalDateTime reservationdate) {
		this.reservationdate = reservationdate;
	}
*/
}
