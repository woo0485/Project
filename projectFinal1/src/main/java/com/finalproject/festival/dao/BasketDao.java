package com.finalproject.festival.dao;

import java.util.List;

import com.finalproject.festival.domain.Basket;

public interface BasketDao {
	
	//회원 장바구니 - 1월 3일) 회원 아이디로 가져오게 변경함 어떤회원인지 알아야하기 때문에 ... 반환은 한개 이상의 장바구니 데이터를 반환받아야한다
		//public abstract List<Basket> basketList (int productno, int basketno, int basketproductcount, String id);
		public List<Basket> basketList(String id);
		
	// 장바구니 확인 - 1월 3일
		public Basket checkBasket(Basket b);
	
	// 회원 장바구니 추가
		public abstract void insertBasket(Basket b);
		
		

}
