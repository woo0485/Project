package com.finalproject.festival.manage.dao;

import java.util.List;

import com.finalproject.festival.domain.MemberCoupon;

public interface ManageMemberCouponDao {
	
	public abstract int getBoardCount(String type, String keyword);
	
	public abstract List<MemberCoupon> manageMemberCoupon(int startRow, int num, String type, String keyword);
	
	public abstract void updateManageMemberCoupon(MemberCoupon memberCoupon);
	
	public abstract void deleteManageMemberCoupon(int membercouponno);

}
