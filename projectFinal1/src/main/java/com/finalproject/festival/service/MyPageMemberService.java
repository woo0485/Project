package com.finalproject.festival.service;

import com.finalproject.festival.domain.Member;
import com.finalproject.festival.domain.MemberCoupon;

import java.util.List;

import com.finalproject.festival.domain.Coupon;
import com.finalproject.festival.domain.Question;

public interface MyPageMemberService {

	public Member MyInfo(String id);
	
	public MemberCoupon MyCoupon (String id);
	
	public Coupon Coupon(int couponno);
	
	public List<Question> Question(String id);
}
