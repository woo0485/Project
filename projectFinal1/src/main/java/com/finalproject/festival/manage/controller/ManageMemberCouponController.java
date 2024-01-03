package com.finalproject.festival.manage.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.finalproject.festival.domain.MemberCoupon;
import com.finalproject.festival.manage.service.ManageMemberCouponService;

@Controller
public class ManageMemberCouponController {
	
	@Autowired
	private ManageMemberCouponService manageMemberCouponService;
	
	
	// 쿠폰 수정
	@RequestMapping(value="manageMemberCouponUpdate.ajax", method=RequestMethod.POST)
	public String manageMemberCouponUpdate(MemberCoupon memberCoupon) {
		
		manageMemberCouponService.updateManageMemberCoupon(memberCoupon);
		
		return "redirect:manageCoupon";
	}
	
	// 쿠폰 삭제
	@RequestMapping("/manageMemberCouponDelete.ajax")
	public String manageMemberCouponDelete(int membercouponno) {
		
		manageMemberCouponService.deleteManageMemberCoupon(membercouponno);
		
		return "redirect:manageCoupon";
	}
	
	// 쿠폰 관리 페이지
		@RequestMapping("/manageCoupon")
		public String manageEvent(Model model,
				@RequestParam(value="pageNum", 
					required=false, defaultValue="1") int pageNum,
				@RequestParam(value="type",
					required=false, defaultValue="null") String type,
				@RequestParam(value="keyword",
					required=false, defaultValue="null") String keyword){
			
			Map<String, Object> modelMap = manageMemberCouponService.manageMemberCoupon(pageNum, type, keyword);

			model.addAllAttributes(modelMap);
			
			return "manage/manageCoupon";
		}

}
