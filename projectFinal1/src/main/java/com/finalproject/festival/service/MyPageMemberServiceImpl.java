package com.finalproject.festival.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.festival.dao.MyPageMemberDao;
import com.finalproject.festival.domain.Member;
import com.finalproject.festival.domain.MemberCoupon;
import com.finalproject.festival.domain.Coupon;
import com.finalproject.festival.domain.Question;

@Service
public class MyPageMemberServiceImpl implements MyPageMemberService {

	@Autowired
	private MyPageMemberDao dao;
	
	@Override
	public Member MyInfo(String id) {
		Member member = dao.MyInfo(id);
		return member;
	}
	
	@Override
	public MemberCoupon MyCoupon(String id) {
		MemberCoupon mycoupon = dao.MyCoupon(id);
		return mycoupon;
	}
	
	@Override
	public Coupon Coupon(int couponno) {
		Coupon coupon = dao.Coupon(couponno);
		return coupon;
	}
	
	@Override
	public List<Question> Question (String id) {
		List<Question> Question = dao.Question(id);
		
		return Question;
	}
	
}
