package com.finalproject.festival.service;

import com.finalproject.festival.domain.Member;

public interface MemberService {
	
	public Member loginCheck(String id);
	public int joinIdCheck (String id);
	public int joinEmailCheck (String email);
	public void joinMember (Member m);

}
