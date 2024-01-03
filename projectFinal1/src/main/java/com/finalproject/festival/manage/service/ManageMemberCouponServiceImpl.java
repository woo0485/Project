package com.finalproject.festival.manage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.festival.domain.MemberCoupon;
import com.finalproject.festival.manage.dao.ManageMemberCouponDao;

@Service
public class ManageMemberCouponServiceImpl implements ManageMemberCouponService {
	
	private static final int PAGE_SIZE = 10;
	private static final int PAGE_GROUP = 10;

	@Autowired
	private ManageMemberCouponDao manageMemberCouponDao;
	
	@Override
	public Map<String, Object> manageMemberCoupon(int pageNum, String type, String keyword) {
		
		int currentPage = pageNum;
		
		int startRow = (currentPage - 1) * PAGE_SIZE;
		
		int listCount = manageMemberCouponDao.getBoardCount(type, keyword);
		
		List<MemberCoupon> memberCouponList = manageMemberCouponDao.manageMemberCoupon(startRow, PAGE_SIZE, type, keyword);
				
		int pageCount =
				listCount / PAGE_SIZE + (listCount % PAGE_SIZE == 0 ? 0 : 1);
		
		int startPage = (currentPage / PAGE_GROUP) * PAGE_GROUP + 1
				- (currentPage % PAGE_GROUP == 0 ? PAGE_GROUP : 0);
		
		int endPage = startPage + PAGE_GROUP - 1;
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}
				
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		modelMap.put("memberCouponList", memberCouponList);
		modelMap.put("pageCount", pageCount);
		modelMap.put("startPage", startPage);
		modelMap.put("endPage", endPage);
		modelMap.put("currentPage", currentPage);
		modelMap.put("listCount", listCount);
		modelMap.put("pageGroup", PAGE_GROUP);
		
		boolean searchOption = (type.equals("null") 
				|| keyword.equals("null"))? false : true;
		modelMap.put("searchOption", searchOption);
		if(searchOption) {
			modelMap.put("type", type);
			modelMap.put("keyword", keyword);
		}
			
		return modelMap;	
	}

	@Override
	public void updateManageMemberCoupon(MemberCoupon memberCoupon) {

		manageMemberCouponDao.updateManageMemberCoupon(memberCoupon);
	}

	@Override
	public void deleteManageMemberCoupon(int membercouponno) {

		manageMemberCouponDao.deleteManageMemberCoupon(membercouponno);
	}

}
