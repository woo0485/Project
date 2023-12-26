package com.finalproject.festival.domain;

public class Reservation {

	private int reservationno;
	private String id;
	private int productno;
	private int reservationprice;
	private int reservationticketcount;
	private String reservationdate;
	
	public Reservation() {}

	public Reservation(int reservationno, String id, int productno, int reservationprice, int reservationticketcount,
			String reservationdate) {
		super();
		this.reservationno = reservationno;
		this.id = id;
		this.productno = productno;
		this.reservationprice = reservationprice;
		this.reservationticketcount = reservationticketcount;
		this.reservationdate = reservationdate;
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

	public String getReservationdate() {
		return reservationdate;
	}

	public void setReservationdate(String reservationdate) {
		this.reservationdate = reservationdate;
	}
	
	
	
	
}
