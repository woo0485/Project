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
	public Map<String, Object> basketList (String id, int productno, int basketno, int basketproductcount) {
		
		List<Basket> basketList = BD.basketList(productno, basketno, basketproductcount, id);
		Map<String, Object> modelMap = new HashMap<String, Object>();
		modelMap.put("basketList", basketList);
	return modelMap;
	}

}
