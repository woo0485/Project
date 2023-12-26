package com.finalproject.festival.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.festival.dao.MemberDao;
import com.finalproject.festival.domain.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;

	
	@Override
	public boolean loginCheck(String id, String password) {
		boolean result = false;
		
		
		Member member =  memberDao.loginCheck(id);
		System.out.println("매개변수 "+id+password);
		System.out.println("service - loginCheck"+member.getId()+member.getPassword());
		
		if(member.getId().equals(id) && member.getPassword().equals(password)) {
			result = true;
		}
		
		return result;
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
	};




}
