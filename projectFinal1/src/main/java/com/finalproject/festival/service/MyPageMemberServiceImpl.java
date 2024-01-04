package com.finalproject.festival.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.festival.dao.MyPageMemberDao;
import com.finalproject.festival.domain.Member;
import com.finalproject.festival.domain.MemberCoupon;
import com.finalproject.festival.domain.Coupon;

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
	
	
}
