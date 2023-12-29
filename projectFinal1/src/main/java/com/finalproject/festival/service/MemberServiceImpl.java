package com.finalproject.festival.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.finalproject.festival.dao.MemberDao;
import com.finalproject.festival.domain.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;
	
	
	
	
	@Override//로그인확인
	public Member loginCheck(String id) {
		Member member =  memberDao.loginCheck(id);
		return member;
	}


	@Override
	public int joinIdCheck(String id) {
		int idCheck = memberDao.joinIdCheck(id);
		return idCheck;
	}


	@Override
	public int joinEmailCheck(String email) {
		int emailCheck = memberDao.joinEmailCheck(email);
		return emailCheck;
	}


	@Override
	public void joinMember(Member m) {
		memberDao.joinMember(m);
		
	};




}
