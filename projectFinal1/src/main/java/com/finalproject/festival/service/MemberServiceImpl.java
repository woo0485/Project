package com.finalproject.festival.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.finalproject.festival.dao.MemberDao;
import com.finalproject.festival.domain.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Override
	public boolean loginCheck(String id, String password) {
		boolean result = false;
		
		
		Member member =  memberDao.loginCheck(id);
		System.out.println("매개변수 "+id+password);
		System.out.println("service - loginCheck"+member.getId()+passwordEncoder.matches(password, member.getPassword()));
		
		if(member.getId().equals(id) && passwordEncoder.matches(password, member.getPassword())) {
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
	}


	@Override
	public void joinMember(Member m) {
		memberDao.joinMember(m);
		
	};




}
