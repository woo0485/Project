package com.finalproject.festival.service;

import java.util.List;
import java.util.Map;

import com.finalproject.festival.domain.Product;

public interface FestivalMapService {
	
	public abstract List<Product> productList();
	
	public abstract Map<String, Object> productArea();

}
