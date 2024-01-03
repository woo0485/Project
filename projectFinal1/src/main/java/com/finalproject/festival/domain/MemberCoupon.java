package com.finalproject.festival.domain;

import java.sql.Date;

public class MemberCoupon {

	private int membercouponno;
	private int couponno;
	private String id;
	private String couponopendate;
	private String couponclosedate;
	
	
	public MemberCoupon() {}


	public MemberCoupon(int membercouponno, int couponno, String id, String couponopendate, String couponclosedate) {
		super();
		this.membercouponno = membercouponno;
		this.couponno = couponno;
		this.id = id;
		this.couponopendate = couponopendate;
		this.couponclosedate = couponclosedate;
	}


	public int getMembercouponno() {
		return membercouponno;
	}


	public void setMembercouponno(int membercouponno) {
		this.membercouponno = membercouponno;
	}


	public int getCouponno() {
		return couponno;
	}


	public void setCouponno(int couponno) {
		this.couponno = couponno;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getCouponopendate() {
		return couponopendate;
	}


	public void setCouponopendate(String couponopendate) {
		this.couponopendate = couponopendate;
	}


	public String getCouponclosedate() {
		return couponclosedate;
	}


	public void setCouponclosedate(String couponclosedate) {
		this.couponclosedate = couponclosedate;
	}
	
	
	
	
}

