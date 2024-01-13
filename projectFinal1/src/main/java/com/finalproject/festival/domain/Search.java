package com.finalproject.festival.domain;

import java.sql.Timestamp;

public class Search {

	
	private String searchkeyword;
	private int searchkeywordcount;
	private Timestamp searchdate;

	
	public String getSearchkeyword() {
		return searchkeyword;
	}

	public void setSearchkeyword(String searchkeyword) {
		this.searchkeyword = searchkeyword;
	}

	public int getSearchkeywordcount() {
		return searchkeywordcount;
	}

	public void setSearchkeywordcount(int searchkeywordcount) {
		this.searchkeywordcount = searchkeywordcount;
	}

	public Timestamp getSearchdate() {
		return searchdate;
	}

	public void setSearchdate(Timestamp searchdate) {
		this.searchdate = searchdate;
	}
	
	
}
