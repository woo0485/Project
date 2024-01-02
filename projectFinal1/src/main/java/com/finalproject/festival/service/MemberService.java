package com.finalproject.festival.service;


import java.util.Map;

import com.finalproject.festival.domain.Member;

public interface MemberService {
	
	public Member loginCheck(String id);
	public int joinIdCheck (String id);
	public int joinEmailCheck (String email);
	public void joinMember (Member m);
	public String userFindId (String email);
	public int userFindPassword (Map<String , Object> map);
}
