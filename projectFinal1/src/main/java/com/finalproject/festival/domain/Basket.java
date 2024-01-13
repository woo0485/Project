package com.finalproject.festival.domain;

public class Basket {
	
	// 장바구니 테이블
	private int basketNo;
	private int productNo;
	private String id;
	private int basketProductCount;
	private String productName;
	private int productPrice;
	private String productImage;
	private int totalPrice;

	
	public Basket() {}
	
	public Basket(int basketNo,  int productNo, String id, int basketProductCount, 
			String productName, int productPrice, String productImage,  int totalPrice) {
		this.basketNo = basketNo;
		this.productNo = productNo;
		this.id = id;
		this.basketProductCount = basketProductCount;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productImage = productImage;
		this.totalPrice = totalPrice;
	}

	public int getBasketNo() {
		return basketNo;
	}

	public void setBasketNo(int basketNo) {
		this.basketNo = basketNo;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getBasketProductCount() {
		return basketProductCount;
	}

	public void setBasketProductCount(int basketProductCount) {
		this.basketProductCount = basketProductCount;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public String getProductImage() {
		return productImage;
	}

	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
}
