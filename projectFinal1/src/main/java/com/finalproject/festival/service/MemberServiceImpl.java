package com.finalproject.festival.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.finalproject.festival.dao.MemberDao;
import com.finalproject.festival.domain.Admin;
import com.finalproject.festival.domain.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;
	
	
	
	
	@Override//로그인확인
	public Map<String, Object> loginCheck(String id) {
		
		return memberDao.loginCheck(id);
	}


	@Override
	public int joinIdCheck(String id) {
		int idCheck = memberDao.joinIdCheck(id);
		return idCheck;
	}


	@Override
	public int joinEmailCheck(String email) {
		int emailCheck = memberDao.emailUserCount(email);
		return emailCheck;
	}


	@Override
	public void joinMember(Member m) {
		memberDao.joinMember(m);
		
	}


	@Override
	public String userFindId(Map<String, Object> userfind) {
		return memberDao.userFindId(userfind);
	}


	@Override
	public int userFindPassword(Map<String, Object> map) {
		
		return memberDao.userFindPassword(map);
	}


	@Override
	public int userNewPassword(Map<String, Object> newPassword) {
		
		return memberDao.userNewPassword(newPassword);
	}
		////////////////////////////////////////////////////////

	@Override
	public void adminUserAdd(Map<String, Object> adminUserAdd) {
		memberDao.adminUserAdd(adminUserAdd);
	}


	@Override
	public List<Admin> adminUserSelect() {
		
		return memberDao.adminUserSelect();
	};




}
