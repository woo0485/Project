package com.finalproject.festival.dao;

import java.util.List;
import java.util.Map;

import com.finalproject.festival.domain.Basket;

public interface BasketDao {

	public List<Basket> basketList(String id);
	
	public Integer getBasketTotalPrice(String id);
	
	// 회원 장바구니 추가 
	public abstract void insertBasket(Basket b);

	// 회원 장바구니 producno가 중복되었는지 확인 - 1월 7일 수정 => selectList로 해야할듯 isDupBasketCheck
	boolean isDupBasketCheck(int productno, String id);
	
	// 회원 장바구니에 productno가 이미 존재하는 경우 수량만 update 해준다.
	public void updateBasketProductCount(Basket b);

	
	// 회원 장바구니에서 productno에 해당하는 제품 수량 업데이트
	public void updateBasketProductNoCount(Map<String, Object> param);
	
	// 회원 장바구니에서 productno에 해당하는 제품 삭제하기
	public void deleteBasketProductno(int productNo, String id);
	
	// 장바구니의 모든 제품 삭제
	public void deleteBasketAll(String id);
				
	// 회원 장바구니 삭제 - 1월 5일 - id에 해당하는 basketno를 삭제한다.
//	public abstract void deleteBasket(int basketno, String id);
	
	// 주문 가능 수량 가져오기
	public Integer getProductRemainingAmount(int productNo);
		
}