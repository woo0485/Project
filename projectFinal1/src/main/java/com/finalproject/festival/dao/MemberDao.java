package com.finalproject.festival.dao;

import com.finalproject.festival.domain.Member;

public interface MemberDao {

	public Member loginCheck (String id);
	public int joinIdCheck (String id);
	public int joinEmailCheck (String email); 
	
}
