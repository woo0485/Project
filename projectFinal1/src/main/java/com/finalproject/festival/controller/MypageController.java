package com.finalproject.festival.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.finalproject.festival.service.MyPageMemberService;
import com.finalproject.festival.domain.Coupon;
import com.finalproject.festival.domain.Gallery;
import com.finalproject.festival.domain.GalleryBookMark;
import com.finalproject.festival.domain.Member;
import com.finalproject.festival.domain.MemberCoupon;
import com.finalproject.festival.domain.Question;
import com.finalproject.festival.domain.Bookmark;
import com.finalproject.festival.domain.Product;
import com.finalproject.festival.domain.Reservation;



@Controller
public class MypageController {
	
	@Autowired
	private MyPageMemberService service;
	
	// 마이페이지 예약
	@RequestMapping("/myPageReservation")
	public String myPageReservation(@RequestParam("id")String id, Model model) {
		List<Reservation> Reservation = service.Reservation(id);
		String id1 = "";
		for(Reservation reservation : Reservation) {
			int productno = reservation.getProductno();
			System.out.println(productno);
			id1 = reservation.getId();
			System.out.println(id1);
		}
		
		List<Product> ReProduct = service.ReProduct(Reservation);
		
		model.addAttribute("ReProduct", ReProduct);
		model.addAttribute("Reservation", Reservation);
		
		return "myPageReservation";
	}
	
	// 마이페이지 예약취소
	@RequestMapping("/mydelete")
	public String myPageReservationdelete(@RequestParam("id")String id, @RequestParam("productno")int productno, @RequestParam("reservationticketcount")int reservationticketcount,  Model model){
		
		Reservation MyReservation = service.MyReservation(id, productno);
		Reservation MycancleTicket = service.MyCancleTicket(reservationticketcount, productno, id);
		
		
		return "redirect:myPageReservation?id=" + id;
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
	public String myPageFavorite(@RequestParam("id")String id, Model model) {
		List<GalleryBookMark> GalleryBookMark = service.GalleryBookMark(id);
		for(GalleryBookMark gallerybookmark : GalleryBookMark) {
			int galleryno = gallerybookmark.getGalleryno();
		}
		
		List<Gallery> Gallery = service.Gallery(GalleryBookMark);
		
		
		model.addAttribute("Gallery",Gallery);
		model.addAttribute("GalleryBookMark",GalleryBookMark);
		
		List<Bookmark> Bookmark = service.Bookmark(id);
		for(Bookmark bookmark : Bookmark) {
			int productno = bookmark.getProductno();
		}
		
		List<Product> Product = service.Product(Bookmark);
		
		model.addAttribute("Product", Product);
		model.addAttribute("Bookmark",Bookmark);
		
		return "myPageFavorite";
	}
	
	// 마이페이지 쿠폰
	@RequestMapping("/myPageCoupon")
	public String myPageCoupon(@RequestParam("id")String id, Model model) {
		List<MemberCoupon> MemberCoupon = service.MemberCoupon(id);
		for(MemberCoupon membercoupon : MemberCoupon) {
			int membercouponno = membercoupon.getCouponno();
		}
		List<Coupon> Coupon = service.Coupon(MemberCoupon);
		model.addAttribute("MemberCoupon", MemberCoupon);
		model.addAttribute("Coupon",Coupon);
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
			mp = 800000 - totalpay;
		} else if (member.getGrade() == 2) {
			mp = 3000000 - totalpay;
		} else if (member.getGrade() == 3) {
			mp = 5000000 - totalpay;
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
		Member MyGrade = service.MyGrade(id, member.getGrade(), member.getTotalpay());
		int totalpay = member.getTotalpay();
		int grade = member.getGrade();
		
		
		if(totalpay >= 5000000) {
			grade = 4;
		} else if(totalpay >= 3000000) {
			grade = 3;
		} else if(totalpay >= 800000) {
			grade = 2;
		} else if(totalpay >= 500000) {
			grade = 1;
		} else {
			grade = 0;
		}
		member.setGrade(grade);
		
		model.addAttribute("member", member);
		return "myPageMain";
	}
	
	@RequestMapping("/myupdate")
	public String myupdate(Member Member) {
		
		service.myupdate(Member);
		String id = Member.getId();
		return "redirect:myPageMain?id=" + id;
	}
	
	
	 
}
	 
