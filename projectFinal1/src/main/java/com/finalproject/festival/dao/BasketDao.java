package com.finalproject.festival.dao;

import java.util.List;

import com.finalproject.festival.domain.Basket;

public interface BasketDao {
	
	//회원 장바구니
	public abstract List<Basket> basketList (int productno, int basketno, int basketproductcount, String id);

}
