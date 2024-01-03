package com.finalproject.festival.service;


import java.util.Map;

import com.finalproject.festival.domain.Member;

public interface MemberService {
	
	public Map<String, Object> loginCheck(String id);
	public int joinIdCheck (String id);
	public int joinEmailCheck (String email);
	public void joinMember (Member m);
	public String userFindId (Map<String, Object> userfind);
	public int userFindPassword (Map<String , Object> map);
	public int userNewPassword(Map<String, Object> newPassword);
}
