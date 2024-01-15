package com.finalproject.festival.domain;

import java.sql.Timestamp;
import java.time.LocalDate;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.finalproject.typeHandler.LocalDateSerializer;

public class Product {
	
	private int productno;
	private String productname;
	private String productcontent;
	private int productprice;
	private String productimage;
	private String productlocation;
	@JsonSerialize(using = LocalDateSerializer.class)
	private LocalDate productopendate;
	@JsonSerialize(using = LocalDateSerializer.class)
	private LocalDate productclosedate;
	private int productbookmarkcount;
	private int productreadcount;
	private int productticketcount;
	private int productremainticketcount;
	private String adminpassword;
	// 결제되면서 장바구니의 결제된 수량만큼 상품의 남은 개수에서 빼주기
	private int basketproductcount;
	
	public Product() {}
	
	public Product(int productno,  String productname, String productcontent,  int productprice, String productimage, String productlocation, 
			LocalDate productopendate, LocalDate productclosedate, 
			int productbookmarkcount, int productreadcount, int productticketcount,  int productremainticketcount,
			String adminpassword,
			int basketproductcount) {
		
		this.productno = productno;
		this.productname = productname;
		this.productcontent = productcontent;
		this.productprice = productprice;
		this.productimage = productimage;
		this.productlocation = productlocation;
		this.productopendate = productopendate;
		this.productclosedate = productclosedate;
		this.productbookmarkcount = productbookmarkcount;
		this.productreadcount = productreadcount;
		this.productticketcount = productticketcount;
		this.productremainticketcount = productremainticketcount;
		this.adminpassword = adminpassword;
		this.basketproductcount = basketproductcount;
	}

	public int getProductno() {
		return productno;
	}

	public void setProductno(int productno) {
		this.productno = productno;
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public String getProductcontent() {
		return productcontent;
	}

	public void setProductcontent(String productcontent) {
		this.productcontent = productcontent;
	}

	public int getProductprice() {
		return productprice;
	}

	public void setProductprice(int productprice) {
		this.productprice = productprice;
	}

	public String getProductimage() {
		return productimage;
	}

	public void setProductimage(String productimage) {
		this.productimage = productimage;
	}

	public String getProductlocation() {
		return productlocation;
	}

	public void setProductlocation(String productlocation) {
		this.productlocation = productlocation;
	}
	
	public LocalDate getProductopendate() {
		return productopendate;
	}

	public void setProductopendate(LocalDate productopendate) {
		this.productopendate = productopendate;
	}

	public LocalDate getProductclosedate() {
		return productclosedate;
	}

	public void setProductclosedate(LocalDate productclosedate) {
		this.productclosedate = productclosedate;
	}

	public int getProductbookmarkcount() {
		return productbookmarkcount;
	}

	public void setProductbookmarkcount(int productbookmarkcount) {
		this.productbookmarkcount = productbookmarkcount;
	}

	public int getProductreadcount() {
		return productreadcount;
	}

	public void setProductreadcount(int productreadcount) {
		this.productreadcount = productreadcount;
	}

	public int getProductticketcount() {
		return productticketcount;
	}

	public void setProductticketcount(int productticketcount) {
		this.productticketcount = productticketcount;
	}

	public int getProductremainticketcount() {
		return productremainticketcount;
	}

	public void setProductremainticketcount(int productremainticketcount) {
		this.productremainticketcount = productremainticketcount;
	}

	public String getAdminpassword() {
		return adminpassword;
	}

	public void setAdminpassword(String adminpassword) {
		this.adminpassword = adminpassword;
	}

	//  결제되면서 장바구니에 담긴 수량만큼 product의 남은 티켓수에서 빼주기
	public int getBasketproductcount() {
		return basketproductcount;
	}

	public void setBasketproductcount(int basketproductcount) {
		this.basketproductcount = basketproductcount;
	}

}
