package com.finalproject.festival.domain;

public class Basket {
	
	// 장바구니 테이블
	private int basketno;
	private int productno;
	private String id;
	private int basketproductcount;
	
	// 상품테이블인데 장바구니에서 활용할 것
	private String productname;
	private int productprice;
	
	public Basket() {}
	
	public Basket(int basketno,  int productno, String id, int basketproductcount, String productname, int productprice) {
		this.basketno = basketno;
		this.productno = productno;
		this.id = id;
		this.basketproductcount = basketproductcount;
		this.productname = productname;
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

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public int getProductprice() {
		return productprice;
	}

	public void setProductprice(int productprice) {
		this.productprice = productprice;
	}
	
}
