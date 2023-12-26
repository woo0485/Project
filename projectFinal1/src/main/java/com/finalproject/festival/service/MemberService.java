package com.finalproject.festival.service;

import com.finalproject.festival.domain.Member;

public interface MemberService {
	
	public boolean loginCheck(String id,String password);
	public int joinIdCheck (String id);
	public int joinEmailCheck (String email);

}
