package com.finalproject.festival.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.festival.dao.BasketDao;
import com.finalproject.festival.domain.Basket;

@Service
public class BasketServiceImpl implements BasketService {
	
	@Autowired
	private BasketDao BD;
	
	public void setBasketDao (BasketDao bd) {
		this.BD = bd;
	}

	@Override
	public Map<String, Object>  basketList(String id) {		
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("basketList", BD.basketList(id));
		resultMap.put("basketTotalPrice", this.getBasketTotalPrice(id));
		
		return resultMap;
	}
	
	// 장바구니의 전체 금액을 반환하는 메서드
	@Override
	public int getBasketTotalPrice(String id) {
		int basketTotalPrice = 0;
		if(BD.getBasketTotalPrice(id) != null) {
			basketTotalPrice = BD.getBasketTotalPrice(id).intValue();
		}
		return basketTotalPrice;
	}
	
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	@Override
	public void insertBasket(Basket basket) {
		
		boolean isExist = BD.isDupBasketCheck(basket.getProductNo(), basket.getId());
		System.out.println("basketdao에서 service로 넘어가는 productno 전부 카운트한 갯수의 boolean "+isExist );
		  // DAO에서=> productno가 존재하면 >0 이고 true 없으면 false

        if (isExist) { // 장바구니에 이미 있으면            
        	BD.updateBasketProductCount(basket);
       
        } else { // 신규로 장바구니에 추가        	
            BD.insertBasket(basket);        	
        } 
        
	}

	@Override
	public void updateBasketProductNoCount(Map<String, Object> param) {
		BD.updateBasketProductNoCount(param);		
	}

//////////////////// 여기서부터는 장바구니 수량 업데이트랑 삭제 ////////////////////////////////
	// 주문 가능 수량 가져오기
	public int getProductRemainingAmount(int productNo) {		
		return BD.getProductRemainingAmount(productNo);
	}

	// 장바구니 상품 수량 업데이트
	
	// 장바구니에 있는 모든 제품 삭제
	@Override
	public void deleteBasketAll(String id) {
		BD.deleteBasketAll(id);
	}

	
	// 장바구니에 있는 basketNo에 해당하는 상품을 삭제
	@Override
	public void deleteBasketNo(int basketNo) {
		BD.deleteBasketNo(basketNo);	
	}

	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
}