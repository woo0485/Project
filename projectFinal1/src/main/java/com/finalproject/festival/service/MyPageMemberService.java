package com.finalproject.festival.service;

import com.finalproject.festival.domain.Member;
import com.finalproject.festival.domain.MemberCoupon;

import java.util.List;

import com.finalproject.festival.domain.Coupon;
import com.finalproject.festival.domain.Gallery;
import com.finalproject.festival.domain.Question;
import com.finalproject.festival.domain.GalleryBookMark;
import com.finalproject.festival.domain.Bookmark;
import com.finalproject.festival.domain.Product;
import com.finalproject.festival.domain.Reservation;

public interface MyPageMemberService {

	public Member MyInfo(String id);
	
	public List<MemberCoupon> MemberCoupon (String id);
	
	public List<Coupon> Coupon(List<MemberCoupon> MemberCoupon);
	
	public List<Question> Question(String id);
	
	public Member MyGrade (String id, int grade, int totalpay);
	
	public List<GalleryBookMark> GalleryBookMark (String id);
	
	public List<Gallery> Gallery (List<GalleryBookMark> GalleryBookMark);
	
	public List<Bookmark> Bookmark (String id);
	
	public List<Product> Product (List<Bookmark> Bookmark);
	
	public List<Reservation> Reservation (String id);
	
	public List<Product> ReProduct (List<Reservation> Reservation);
	
	public Reservation MyReservation (String id, int productno, int reservationno);
	
	public Reservation MyCancleTicket (int reservationticketcount, int productno, String id);
	
	public abstract void myupdate(Member Member);
	 
}
