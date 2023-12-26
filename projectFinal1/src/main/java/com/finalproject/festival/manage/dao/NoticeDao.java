package com.finalproject.festival.manage.dao;

import java.util.List;

import com.finalproject.festival.domain.Manage;

public interface NoticeDao {
	
	// 고객센터 공지사항
	public abstract List<Manage> customerNotice();
	
	public abstract int getBoardCount();
	
	public abstract List<Manage> notice(int startRow, int num);
	
	public abstract Manage getNotice(int noticeNo);
	
	public abstract void insertNotice(Manage manage);

	public abstract void updateNotice(Manage manage);

	public abstract void deleteNotice(int noticeNo);

}
