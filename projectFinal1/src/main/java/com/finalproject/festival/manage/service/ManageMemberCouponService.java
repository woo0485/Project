package com.finalproject.festival.manage.service;

import java.util.List;
import java.util.Map;

import com.finalproject.festival.domain.MemberCoupon;

public interface ManageMemberCouponService {
	
	public abstract Map<String, Object> manageMemberCoupon(int pageNum, String type, String keyword);
	
	public abstract void updateManageMemberCoupon(MemberCoupon memberCoupon);
	
	public abstract void deleteManageMemberCoupon(int membercouponno);


}
