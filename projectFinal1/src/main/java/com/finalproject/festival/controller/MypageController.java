package com.finalproject.festival.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.finalproject.festival.service.MyPageMemberService;
import com.finalproject.festival.domain.Coupon;
import com.finalproject.festival.domain.Member;
import com.finalproject.festival.domain.MemberCoupon;
import com.finalproject.festival.domain.Question;

@Controller
public class MypageController {
	
	@Autowired
	private MyPageMemberService service;
	
	
	// 마이페이지 예약
	@RequestMapping("/myPageReservation")
	public String myPageReservation() {
		return "myPageReservation";
	}
	
	// 마이페이지 문의
	@RequestMapping("/myPageInquiry")
	public String myPageInquiry(@RequestParam("id")String id, Model model) {
		List<Question> Question = service.Question(id);
		
		model.addAttribute("Question",Question);

		
		return "myPageInquiry";
	}
	
	// 마이페이지 즐겨찾기
	@RequestMapping("/myPageFavorite")
	public String myPageFavorite() {
		return "myPageFavorite";
	}
	
	// 마이페이지 쿠폰
	@RequestMapping("/myPageCoupon")
	public String myPageCoupon(@RequestParam("id")String id, Model model) {
		MemberCoupon membercoupon = service.MyCoupon(id);
		model.addAttribute("membercoupon", membercoupon);
		return "myPageCoupon";
	}
	
	
	// 마이페이지 혜택
	@RequestMapping("/myPageBenefit")
	public String myPageBenefit(@RequestParam("id")String id, Model model) {
		Member member = service.MyInfo(id);
		int totalpay = member.getTotalpay();
		int mp = 0;
		
		DecimalFormat decimalFormat = new DecimalFormat("###,###");
		String formattedNumber = decimalFormat.format(totalpay);
		
		if(member.getGrade() == 0) {
			mp = 500000 - totalpay;
		} else if (member.getGrade() == 1) {
			mp = 799999 - totalpay;
		} else if (member.getGrade() == 2) {
			mp = 2999999 - totalpay;
		} else if (member.getGrade() == 3) {
			mp = 4999999 - totalpay;
		}
		
		String fmp = decimalFormat.format(mp);
		model.addAttribute("member" ,member);
		model.addAttribute("formattedNumber", formattedNumber);
		model.addAttribute("fmp", fmp);
		return "myPageBenefit";
	}
	
	
	// 마이페이지 회원정보
	@RequestMapping("/myPageMain")
	public String MyInfo(@RequestParam("id")String id, Model model) {
		Member member = service.MyInfo(id);
		
		model.addAttribute("member", member);
		return "myPageMain";
	}
	
	
}
