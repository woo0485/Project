package com.finalproject.festival.service;

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
/*
	@Override
	public Map<String, Object> basketList (String id, int productno, int basketno, int basketproductcount) {
		
		List<Basket> basketList = BD.basketList(productno, basketno, basketproductcount, id);
		Map<String, Object> modelMap = new HashMap<String, Object>();
		modelMap.put("basketList", basketList);
	return modelMap;
	} */
	
	// 장바구니 목록 보기 - 1월 3일
	/*@Override
	public List<Basket> basketList(String id) {
		List<Basket> basketList = BD.basketList(id);
		return basketList;
	} */
	@Override
	public 	List<Map<String,Object>> basketList(String id, int productno) {

		return BD.basketList(id, productno);
	}
	
	/*
	// 장바구니 확인 - 1월 3일
	@Override
	public Basket checkBasket(Basket b) {
		return BD.checkBasket(b);
	} */

	@Override
	public void insertBasket(Basket b) {
		BD.insertBasket(b);
	}

	// 장바구니 제품 삭제 - 1월 5일 수정함
	@Override
	public void deletdBasket(int basketno, String id) {
		
		BD.deleteBasket(basketno, id);
	}
	
	// 장바구니 중복있을 땐 수량만 증가, 장바구니에 productno가 없을 땐  아예 넣기 -1월 5일 수정
	@Override
	public void dupUpdateBasket(Basket b) {
		BD.dupUpdateBasket(b);
	}

	// 회원 장바구니에서 productno가 중복되었는지 확인한다. -1월 5일
	@Override
	public boolean isDupBasketCheck(int productno, String id) {
		return BD.isDupBasketCheck(productno, id);
	}
	
}