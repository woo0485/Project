package com.finalproject.festival.manage.dao;

import java.util.List;

import com.finalproject.festival.domain.Manage;

public interface InquiryDao {
	
	public abstract int getBoardCount(String questionCategory);
	
	public abstract List<Manage> inquiry(String questionCategory, int start, int num);
	
	public abstract Manage getInquiry(int questionNo);
	
	public abstract void insertInquiry(Manage manage);
}
