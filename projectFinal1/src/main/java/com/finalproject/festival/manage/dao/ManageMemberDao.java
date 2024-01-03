package com.finalproject.festival.manage.dao;

import java.util.List;

import com.finalproject.festival.domain.Member;

public interface ManageMemberDao {
	
	public abstract int getBoardCount(String type, String keyword);

	public abstract List<Member> manageMember(int start, int num, String type, String keyword);
	
	public abstract Member getManageMember (String id);
	
	public abstract void updateManageMember (Member festival);
	
	public abstract void deleteManageMember (String id);
	
}
