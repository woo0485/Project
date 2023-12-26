package com.finalproject.festival.manage.service;

import java.util.List;
import java.util.Map;

import com.finalproject.festival.domain.Festival;

public interface ManageMemberService {
	
	public abstract Map<String, Object> manageMember(int pageNum, String type, String keyword);
	
	public abstract Festival getManageMember (String id);
	
	public abstract void updateManageMember (Festival festival);
	
	public abstract void deleteManageMember (String id);

}
