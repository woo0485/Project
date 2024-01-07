package com.finalproject.festival.domain;

public class Bookmark {

	private int bookmarkno;
	private String id;
	private int productno;
	
	public Bookmark () {}

	public Bookmark(int bookmarkno, String id, int productno) {
		super();
		this.bookmarkno = bookmarkno;
		this.id = id;
		this.productno = productno;
	}

	public int getBookmarkno() {
		return bookmarkno;
	}

	public void setBookmarkno(int bookmarkno) {
		this.bookmarkno = bookmarkno;
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
	
	
}
