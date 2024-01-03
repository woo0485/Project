package com.finalproject.festival.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.finalproject.festival.service.MyPageMemberService;
import com.finalproject.festival.domain.Member;

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
	public String myPageInquiry() {
		return "myPageInquiry";
	}
	
	// 마이페이지 즐겨찾기
	@RequestMapping("/myPageFavorite")
	public String myPageFavorite() {
		return "myPageFavorite";
	}
	
	// 마이페이지 쿠폰
	@RequestMapping("/myPageCoupon")
	public String myPageCoupon() {
		return "myPageCoupon";
	}
	
	// 마이페이지 혜택
	@RequestMapping("/myPageBenefit")
	public String myPageBenefit() {
		return "myPageBenefit";
	}
	
	
	// 마이페이지 회원정보
	@RequestMapping("/myPageMain")
	public String MyInfo(@RequestParam("id")String id, Model model) {
		Member member = service.MyInfo(id);
		
		System.out.print("ddd"+member.getGrade());
		
		model.addAttribute("member", member);
		return "myPageMain";
		
		
	}
	
	
}
