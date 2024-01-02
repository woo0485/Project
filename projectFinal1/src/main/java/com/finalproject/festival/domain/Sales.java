package com.finalproject.festival.domain;

public class Sales {


	private String salesDate;
	private int salesTotalPrice;
	
	public Sales() {
		
	}

	public Sales(int salesNo, String salesYear, String salesDate, int salesTotalPrice) {
		super();
		this.salesDate = salesDate;
		this.salesTotalPrice = salesTotalPrice;
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