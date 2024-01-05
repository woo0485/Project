package com.finalproject.festival.manage.service;

import java.util.List;
import java.util.Map;

import com.finalproject.festival.domain.Manage;

public interface InquiryService {

	public abstract Map<String, Object> inquiry(String questionCategory, int pageNum);
	
	public abstract Manage getInquiry(int questionNo);
	
	public abstract void insertInquiry(Manage manage);

}
