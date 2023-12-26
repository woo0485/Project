package com.finalproject.festival.manage.service;

import java.util.Map;

import com.finalproject.festival.domain.Manage;

public interface InformationUseService {
	
	public abstract Map<String, Object> informationUse(int pageNum);
	
	public abstract Manage getInformationUse(int informationUseNo);
	
	public abstract void insertInformationUse(Manage manage);

	public abstract void updateInformationUse(Manage manage);

	public abstract void deleteInformationUse(int informationUseNo);


}
