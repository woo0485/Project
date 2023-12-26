package com.finalproject.festival.manage.dao;

import java.util.List;

import com.finalproject.festival.domain.Festival;

public interface ManageMemberDao {
	
	public abstract int getBoardCount(String type, String keyword);

	public abstract List<Festival> manageMember(int start, int num, String type, String keyword);
	
	public abstract Festival getManageMember (String id);
	
	public abstract void updateManageMember (Festival festival);
	
	public abstract void deleteManageMember (String id);
	
}
