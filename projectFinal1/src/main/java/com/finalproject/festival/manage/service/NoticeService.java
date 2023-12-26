package com.finalproject.festival.manage.service;

import java.util.List;
import java.util.Map;

import com.finalproject.festival.domain.Manage;

public interface NoticeService {
		
	
	public abstract Map<String, Object> notice(int pageNum);
	
	public abstract Manage getNotice(int noticeNo);
	
	public abstract void insertNotice(Manage manage);

	public abstract void updateNotice(Manage manage);

	public abstract void deleteNotice(int noticeNo);


}
