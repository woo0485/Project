package com.finalproject.festival.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.festival.dao.MyPageMemberDao;
import com.finalproject.festival.domain.Member;
import com.finalproject.festival.domain.MemberCoupon;
import com.finalproject.festival.domain.Coupon;
import com.finalproject.festival.domain.Question;
import com.finalproject.festival.domain.GalleryBookMark;
import com.finalproject.festival.domain.Gallery;
import com.finalproject.festival.domain.Bookmark;
import com.finalproject.festival.domain.Product;
import com.finalproject.festival.domain.Reservation;

@Service
public class MyPageMemberServiceImpl implements MyPageMemberService {

	@Autowired
	private MyPageMemberDao dao;
	
	@Override
	public Member MyInfo(String id) {
		Member member = dao.MyInfo(id);
		return member;
	}
	
	@Override
	public List<MemberCoupon> MemberCoupon (String id) {
		List<MemberCoupon> MemberCoupon = dao.MemberCoupon(id);
		return MemberCoupon;
	}
	
	@Override
	public List<Coupon> Coupon(List<MemberCoupon> MemberCoupon) {
		List<Coupon> coupon = dao.Coupon(MemberCoupon);
		return coupon;
	}
	
	@Override
	public List<Question> Question (String id) {
		List<Question> Question = dao.Question(id);
		
		return Question;
	}
	
	
	@Override
	public Member MyGrade (String id, int grade, int totalpay) {
		Member MyGrade = dao.MyGrade(id, grade, totalpay);
		
		return MyGrade;
	}
	 
	@Override
	public List<GalleryBookMark> GalleryBookMark (String id) {
		System.out.println("id = " + id);
		List<GalleryBookMark> GalleryBookMark = dao.GalleryBookMark(id);
		return GalleryBookMark;
	}
	
	@Override
	public List<Gallery> Gallery (List<GalleryBookMark> GalleryBookMark) {
		List<Gallery> Gallery = dao.Gallery(GalleryBookMark);
		return Gallery;
	}
	
	@Override
	public List<Bookmark> Bookmark (String id) {
		List<Bookmark> Bookmark = dao.Bookmark(id);
		return Bookmark;
	}
	
	@Override
	public List<Product> Product (List<Bookmark> Bookmark) {
		List<Product> Product = dao.Product(Bookmark);
		return Product;
	}
	
	@Override
	public List<Reservation> Reservation (String id) {
		List<Reservation> Reservation = dao.Reservation(id);
		return Reservation;
	}
	
	@Override
	public List<Product> ReProduct (List<Reservation> Reservation) {
		List<Product> Product = dao.ReProduct(Reservation);
		return Product;
	}
	
	@Override
	public Reservation MyReservation (String id, int productno, int reservationno) {
		
		Reservation MyReservation = dao.MyReservation(id, productno, reservationno);
		
		return MyReservation;
	}
	
	
	 @Override 
	 public Reservation MyCancleTicket (int reservationticketcount, int productno, String id) { 
		 
		 Reservation MyCancleTicket = dao.MyCancleTicket(reservationticketcount, productno, id);
	 
	 	 return MyCancleTicket; 
	 }

	@Override
	public void myupdate(Member Member) {
		dao.myupdate(Member);
	}
	 
	
}
