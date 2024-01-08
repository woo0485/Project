package com.finalproject.festival.dao;

import java.util.ArrayList;
import java.util.List;

import com.finalproject.festival.domain.Coupon;
import com.finalproject.festival.domain.Member;
import com.finalproject.festival.domain.MemberCoupon;
import com.finalproject.festival.domain.Question;
import com.finalproject.festival.domain.Gallery;
import com.finalproject.festival.domain.GalleryBookMark;
import com.finalproject.festival.domain.Bookmark;
import com.finalproject.festival.domain.Product;
import com.finalproject.festival.domain.Reservation;



public interface MyPageMemberDao {
	
	// 회원정보 
	public abstract Member MyInfo(String id);
	
	// 회원쿠폰
	public abstract List<MemberCoupon> MemberCoupon(String id);

	// 기존쿠폰
	public abstract List<Coupon> Coupon(List<MemberCoupon> MemberCoupon);

	// 회원문의
	public abstract List<Question> Question (String id);
	
	// 회원등급
	public abstract Member MyGrade (String id, int grade, int totalpay);

	// 회원즐찾 - 갤러리
	public abstract List<GalleryBookMark> GalleryBookMark (String id);
	
	// 회원즐찾 - 갤러리
	public abstract List<Gallery> Gallery (List<GalleryBookMark> GalleryBookMark);
	
	// 회원즐찾 - 상품
	public abstract List<Bookmark> Bookmark (String id);
	
	// 회원즐찾 - 상품
	public abstract List<Product> Product (List<Bookmark> Bookmark);
	
	// 회원예약 - 조회
	public abstract List<Reservation> Reservation (String id);
	
	// 회원예약 - 조회
	public abstract List<Product> ReProduct (List<Reservation> Reservation);
	
	// 회원예약 - 취소
	public abstract Reservation MyReservation (String id, int productno);
	
	
	// 회원예약 - 취소 후 반환 
	public abstract Reservation MyCancleTicket (int reservationticketcount, int productno, String id);
	 
	// 회원주소변경
	public abstract void myupdate(Member Member);
	 
}
