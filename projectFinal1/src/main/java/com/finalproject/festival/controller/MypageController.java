package com.finalproject.festival.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {
	
	// 마이페이지 메인 및 회원정보
	@RequestMapping("/myPageMain")
	public String myPageMain() {
		return "myPageMain";
	}
	
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
	
	
}
