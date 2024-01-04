package com.finalproject.festival.service;

import com.finalproject.festival.domain.Member;
import com.finalproject.festival.domain.MemberCoupon;
import com.finalproject.festival.domain.Coupon;

public interface MyPageMemberService {

	public Member MyInfo(String id);
	
	public MemberCoupon MyCoupon (String id);
	
	public Coupon Coupon(int couponno);
}
