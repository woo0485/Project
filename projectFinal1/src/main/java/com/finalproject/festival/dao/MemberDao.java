package com.finalproject.festival.dao;

import java.util.HashMap;
import java.util.Map;

import com.finalproject.festival.domain.Member;

public interface MemberDao {

	public Member loginCheck (String id);
	public int joinIdCheck (String id);
	public int emailUserCount (String email); 
	public void joinMember(Member m);
	public String userFindId (String email);
	public int userFindPassword (Map<String, Object> map);
	
}
