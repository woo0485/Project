package com.finalproject.festival.dao;

import java.util.List;
import java.util.Map;

import com.finalproject.festival.domain.Admin;
import com.finalproject.festival.domain.Member;

public interface MemberDao {

	public int userLoginCount(String id);
	
	public Map<String, Object> loginCheck (String id);
	
	public int joinIdCheck (String id);
	
	public int emailUserCount (String email); 
	
	public void joinMember(Member m);
	
	public String userFindId (Map<String, Object> userfind);
	
	public int userFindPassword (Map<String, Object> map);
	
	public int userNewPassword(Map<String, Object> newPassword);
	
	/**********************Admin***************************/
	
	public void adminUserAdd (Map<String, Object>adminUserAdd);
	public List<Admin> adminUserSelect ();
}
