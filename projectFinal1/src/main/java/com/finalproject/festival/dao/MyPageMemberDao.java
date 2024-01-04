package com.finalproject.festival.dao;

import com.finalproject.festival.domain.Coupon;
import com.finalproject.festival.domain.Member;
import com.finalproject.festival.domain.MemberCoupon;

public interface MyPageMemberDao {
	
	// 회원정보 
	public abstract Member MyInfo(String id);
	
	// 회원쿠폰
	public abstract MemberCoupon MyCoupon(String id);

	// 기존쿠폰
	public abstract Coupon Coupon( int couponno);


}
