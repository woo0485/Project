package com.finalproject.festival.domain;

public class Basket {
	
	private int basketno;
	private int productno;
	private String id;
	private int basketproductcount;
	
	public Basket() {}
	
	public Basket(int basketno,  int productno, String id, int basketproductcount) {
		this.basketno = basketno;
		this.productno = productno;
		this.id = id;
		this.basketproductcount = basketproductcount;
	}

	public int getBasketno() {
		return basketno;
	}

	public void setBasketno(int basketno) {
		this.basketno = basketno;
	}

	public int getProductno() {
		return productno;
	}

	public void setProductno(int productno) {
		this.productno = productno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getBasketproductcount() {
		return basketproductcount;
	}

	public void setBasketproductcount(int basketproductcount) {
		this.basketproductcount = basketproductcount;
	}
	
}
