package com.finalproject.festival.service;

import java.util.List;
import java.util.Map;

import com.finalproject.festival.domain.Basket;

public interface BasketService {
	
	// 장바구니 목록 보기 - 1월 3일
	public abstract Map<String, Object>  basketList(String id);
			
	//회원 장바구니 추가) productNo가 존재하거나 존재하지 않을 시 insert 하기 - 1월 7일 => 2가지 경우 둘다
	public void insertBasket(Basket b);

	public void updateBasketProductNoCount ( Map<String, Object> param);
	
	// 장바구니에 있는 상품 전체 삭제
	public void deleteBasketAll(String id);
	
	public int getProductRemainingAmount(int productNo);
	
	// 장바구니에 있는 basketNo에 해당하는 상품을 삭제
	public void deleteBasketNo(int basketNo);
	
	// 장바구니의 전체 금액을 반환하는 메서드
	public int getBasketTotalPrice(String id);
}
