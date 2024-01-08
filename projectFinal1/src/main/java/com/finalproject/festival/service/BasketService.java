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
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////		
		
		//////////////////////여기서부터는 장바구니 안에서 수량 변경 삭제 ///////////////////
		// 회원 장바구니 basketno에 해당하는 거 삭제함 - 1월 5일 수정함
		public abstract void deletdBasket(int basketno, String id);

}
