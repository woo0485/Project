package com.finalproject.festival.manage.service;

import java.util.Map;

import com.finalproject.festival.domain.Member;

public interface ManageMemberService {
	
	public abstract Map<String, Object> manageMember(int pageNum, String type, String keyword);
	
	public abstract Member getManageMember (String id);
	
	public abstract void updateManageMember (Member festival);
	
	public abstract void deleteManageMember (String id);

}
