package com.finalproject.festival.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.festival.dao.MyPageMemberDao;
import com.finalproject.festival.domain.Member;

@Service
public class MyPageMemberServiceImpl implements MyPageMemberService {

	@Autowired
	private MyPageMemberDao dao;
	
	@Override
	public Member MyInfo(String id) {
		Member member = dao.MyInfo(id);
		return member;
	}
	
	
}
