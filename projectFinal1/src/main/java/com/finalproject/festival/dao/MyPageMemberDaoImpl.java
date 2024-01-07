package com.finalproject.festival.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalproject.festival.domain.Member;
import com.finalproject.festival.domain.MemberCoupon;
import com.finalproject.festival.domain.Coupon;
import com.finalproject.festival.domain.Question;
import com.finalproject.festival.domain.Reservation;
import com.finalproject.festival.domain.Gallery;
import com.finalproject.festival.domain.GalleryBookMark;
import com.finalproject.festival.domain.Bookmark;
import com.finalproject.festival.domain.Product;



@Repository
public class MyPageMemberDaoImpl implements MyPageMemberDao {

	private static final String NAME_SPACE = "com.finalproject.festival.mapper.MyPageMemberMapper";
	
	@Autowired
	private SqlSessionTemplate st;
	
	@Override
	public Member MyInfo (String id) {
		
		return st.selectOne(NAME_SPACE + ".MyInfo", id);
	}
	
	@Override
	public MemberCoupon MyCoupon (String id) {
		
		return st.selectOne(NAME_SPACE + ".MyCoupon", id);
	}
	
	@Override
	public Coupon Coupon (String id) {
		
		return st.selectOne(NAME_SPACE + ".Coupon", id);
	}
	
	@Override
	public List<Question> Question (String id) {
	
		return st.selectList(NAME_SPACE + ".Question", id); 
	}
	
	@Override
	public Member MyGrade (String id, int grade, int totalpay) {
		System.out.println(totalpay);
		Map<String, Object> map = new HashMap<>();
		
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
		
		map.put("id", id);
		map.put("grade", grade);
		return st.selectOne(NAME_SPACE + ".MyGrade", map);
	}
	
	@Override
	public List <GalleryBookMark> GalleryBookMark (String id) {
		return st.selectList(NAME_SPACE + ".GalleryBookMark", id);
	}
	
	@Override
	public List<Gallery> Gallery (List<GalleryBookMark> GalleryBookMark) {
		List<Gallery> Gallery = new ArrayList<Gallery>();

		for(GalleryBookMark gallerybookmark : GalleryBookMark) {
			int galleryno = gallerybookmark.getGalleryno();
			Gallery g = st.selectOne(NAME_SPACE + ".GalleryInfo", galleryno);
			Gallery.add(g);
		}
		
		return Gallery;
	}
	
	@Override
	public List<Bookmark> Bookmark (String id) {
		return st.selectList(NAME_SPACE + ".Bookmark", id); 
	}
	
	@Override
	public List<Product> Product (List<Bookmark> Bookmark) {
		List<Product> Product = new ArrayList<Product>();
		
		for(Bookmark bookmark : Bookmark) {
			int productno = bookmark.getProductno();
			Product p = st.selectOne(NAME_SPACE + ".Product", productno);
			Product.add(p);
		}
		
		return Product;
	}
	
	@Override
	public List<Reservation> Reservation (String id) {
		return st.selectList(NAME_SPACE + ".Reservation", id);
	}
	
	@Override
	public List<Product> ReProduct (List<Reservation> Reservation) {
		List<Product> Product = new ArrayList<Product>();
		
		for(Reservation reservation : Reservation) {
			int productno = reservation.getProductno();
			Product rp = st.selectOne(NAME_SPACE + ".ReProduct", productno);
			Product.add(rp);
		}
		
		return Product;
	}
	
	
	
	
}
