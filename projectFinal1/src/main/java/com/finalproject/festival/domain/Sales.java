package com.finalproject.festival.domain;

public class Sales {

<<<<<<< HEAD
	private int salesNo;
	private String salesDate;
	private int salesTotalPrice;
	private int salesYear;
=======

	private String salesDate;
	private int salesTotalPrice;
>>>>>>> 4b390fdf7ef23691660228e7b763ab4b85e79921
	
	public Sales() {
		
	}

<<<<<<< HEAD
	public Sales(int salesNo, String salesDate, int salesTotalPrice, int salesYear) {
		super();
		this.salesNo = salesNo;
		this.salesDate = salesDate;
		this.salesTotalPrice = salesTotalPrice;
		this.salesYear = salesYear;
	}

	public int getSalesNo() {
		return salesNo;
	}

	public void setSalesNo(int salesNo) {
		this.salesNo = salesNo;
=======
	public Sales(int salesNo, String salesYear, String salesDate, int salesTotalPrice) {
		super();
		this.salesDate = salesDate;
		this.salesTotalPrice = salesTotalPrice;
>>>>>>> 4b390fdf7ef23691660228e7b763ab4b85e79921
	}

	public String getSalesDate() {
		return salesDate;
	}

	public void setSalesDate(String salesDate) {
		this.salesDate = salesDate;
	}

	public int getSalesTotalPrice() {
		return salesTotalPrice;
	}

	public void setSalesTotalPrice(int salesTotalPrice) {
		this.salesTotalPrice = salesTotalPrice;
	}

<<<<<<< HEAD
	public int getSalesYear() {
		return salesYear;
	}

	public void setSalesYear(int salesYear) {
		this.salesYear = salesYear;
	}

	
	
=======
>>>>>>> 4b390fdf7ef23691660228e7b763ab4b85e79921
	
	
	
	
}