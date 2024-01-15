package com.finalproject.festival.dao;

import java.util.List;
import java.util.Map;

import com.finalproject.festival.domain.Basket;

public interface BasketDao {

	public List<Basket> basketList(String id);
	
	public Integer getBasketTotalPrice(String id);
	
	// 회원 장바구니 추가 
	public abstract void insertBasket(Basket b);

	// 회원 장바구니 producNo가 중복되었는지 확인 - 1월 7일 수정 => selectList로 해야할듯 isDupBasketCheck
	boolean isDupBasketCheck(int productNo, String id);
	
	// 회원 장바구니에 productNo가 이미 존재하는 경우 수량만 update 해준다.
	public void updateBasketProductCount(Basket b);
	
	// 회원 장바구니에서 productNo에 해당하는 제품 수량 업데이트
	public void updateBasketProductNoCount(Map<String, Object> param);
	
	// 장바구니에 있는 basketNo에 해당하는 상품을 삭제
	public void deleteBasketNo(int basketNo);
	
	// 장바구니의 모든 제품 삭제
	public void deleteBasketAll(String id);
	
	// 주문 가능 수량 가져오기
	public Integer getProductRemainingAmount(int productNo);
		
}