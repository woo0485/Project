package com.finalproject.festival.dao;

import java.util.ArrayList;
import java.util.List;

import com.finalproject.festival.domain.Coupon;
import com.finalproject.festival.domain.Member;
import com.finalproject.festival.domain.MemberCoupon;
import com.finalproject.festival.domain.Question;

public interface MyPageMemberDao {
	
	// 회원정보 
	public abstract Member MyInfo(String id);
	
	// 회원쿠폰
	public abstract MemberCoupon MyCoupon(String id);

	// 기존쿠폰
	public abstract Coupon Coupon(int couponno);

	// 회원문의
	public abstract List<Question> Question (String id);
	
	
}
