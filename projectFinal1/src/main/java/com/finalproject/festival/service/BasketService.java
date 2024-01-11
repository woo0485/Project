package com.finalproject.festival.service;

import java.util.List;
import java.util.Map;

import com.finalproject.festival.domain.Basket;

public interface BasketService {
	
	// 장바구니 목록 보기 - 1월 3일
		public abstract List<Map<String,Object>> basketList(String id, int productno);
		
		/*
	// 장바구니 확인 - 1월 3일
		public Basket checkBasket(Basket b); */
		
/////////////// 여기서부터는 productDetail에서 basket으로 갈 때 장바구니에 담을 때~~~ /////////////////////////////
		//회원 장바구니 추가) productno가 존재하거나 존재하지 않을 시 insert 하기 - 1월 7일 => 2가지 경우 둘다
		public void insertBasket(Basket b);
		
		// 장바구니에 productno가 존재할 경우 수량만 증가시키기- 1월 7일
//		public void updateBasketProductCount(Basket b, int incrementcount);
////////////////////여기서부터는 장바구니 수량 변경 및 삭제 하고 장바구니에 아무것도 없으면 텅 비었다고 보여주는 것/////////////////////////////////////////////////		
	
		// 장바구니 수량 업데이트 테스트
	//	public int updateBasketProductnoCount(int basketproductcount);
		public void updateBasketProductnoCount ( Map<String, Object> param);
		
	// 장바구니에 있는 상품 전체 삭제
		public void deleteBasketAll(String id);
}
