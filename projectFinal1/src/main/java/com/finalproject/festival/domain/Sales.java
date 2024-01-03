package com.finalproject.festival.domain;

public class Sales {


	private int salesNo;
	private String salesDate;
	private int salesTotalPrice;
	private int salesYear;

	public Sales() {
		
	}


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


	
	
	
	
}