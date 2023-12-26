package com.finalproject.festival.manage.dao;

import java.util.List;

import com.finalproject.festival.domain.Manage;

public interface InformationUseDao {

	// 고객센터 이용 안내
	public abstract List<Manage> customerInformationUse();
	
	public abstract int getBoardCount();
	
	public abstract List<Manage> informationUse(int startRow, int num);
	
	public abstract Manage getInformationUse(int noticeNo);
	
	public abstract void insertInformationUse(Manage manage);

	public abstract void updateInformationUse(Manage manage);

	public abstract void deleteInformationUse(int noticeNo);
	
}
