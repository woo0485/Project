package com.finalproject.festival.service;

import java.util.List;
import java.util.Map;

import com.finalproject.festival.domain.Basket;

public interface BasketService {
	
	// 회원 장바구니
/*		public abstract Map<String, Object> basketList(
		 String id, int productno, int basketno, int basketproductcount); */
	
	// 장바구니 목록 보기 - 1월 3일
		public List<Basket> baskList(String id);
		
	// 장바구니 확인 - 1월 3일
		public Basket checkBasket(Basket b);
		
		//회원 장바구니 추가
		public abstract void insertBasket(Basket b);

}
