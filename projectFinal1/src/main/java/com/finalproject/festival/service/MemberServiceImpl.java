package com.finalproject.festival.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.finalproject.festival.dao.MemberDao;
import com.finalproject.festival.domain.Admin;
import com.finalproject.festival.domain.Main;
import com.finalproject.festival.domain.Member;
import com.finalproject.festival.domain.Product;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;
	

	@Override
	public int userLoginCount(String id) {
		
		return memberDao.userLoginCount(id);
	}

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
	public void newMemberCoupon(String id) {
		memberDao.newMemberCoupon(id);
		
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
	}

		////////////////////////////////////////////////////////
	@Override
	public List<Main> mainSearchPage(String keyword) {
		
		return memberDao.mainSearchPage(keyword);
	}

	@Override
	public List<Product> mainProductCarousel() {
		
		return memberDao.mainProductCarousel();
	}

	


	




}
