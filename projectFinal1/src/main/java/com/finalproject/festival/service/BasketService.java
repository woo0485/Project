package com.finalproject.festival.service;

import java.util.Map;

public interface BasketService {
	
	// 회원 장바구니
	public abstract Map<String, Object> basketList(
	 String id, int productno, int basketno, int basketproductcount);

}
