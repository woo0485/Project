package com.finalproject.festival.domain;

public class Basket {
	
	// 장바구니 테이블
	private int basketno;
	private int productno;
	private String id;
	private int basketproductcount;
	// 가격
	private int productprice;
	
	public Basket() {}
	
	public Basket(int basketno,  int productno, String id, int basketproductcount, String productname, int productprice) {
		this.basketno = basketno;
		this.productno = productno;
		this.id = id;
		this.basketproductcount = basketproductcount;
		this.productprice = productprice;
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

	public int getProductprice() {
		return productprice;
	}

	public void setProductprice(int productprice) {
		this.productprice = productprice;
	}

}
