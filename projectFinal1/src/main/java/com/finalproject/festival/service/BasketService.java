package com.finalproject.festival.service;

import java.util.List;
import java.util.Map;

import com.finalproject.festival.domain.Basket;

public interface BasketService {
	
	// 회원 장바구니
/*		public abstract Map<String, Object> basketList(
		 String id, int productno, int basketno, int basketproductcount); */
	
	// 장바구니 목록 보기 - 1월 3일
		//public List<Basket> basketList(String id);
		public abstract List<Map<String,Object>> basketList(String id, int productno);
		
		/*
	// 장바구니 확인 - 1월 3일
		public Basket checkBasket(Basket b); */
		
		//회원 장바구니 추가
		public abstract void insertBasket(Basket b);
		
		//회원 장바구니 업데이트(중복) -1월 5일
		public abstract void dupUpdateBasket(Basket b);
		
		// 회원 장바구니에서 productno가 중복되었는지 확인한다. -1월 5일
		public boolean isDupBasketCheck(int productno, String id);
		
		// 회원 장바구니 basketno에 해당하는 거 삭제함 - 1월 5일 수정함
		public abstract void deletdBasket(int basketno, String id);

}
