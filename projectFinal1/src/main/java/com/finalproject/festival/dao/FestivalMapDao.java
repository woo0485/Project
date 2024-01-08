package com.finalproject.festival.dao;

import java.util.List;
import java.util.Map;

import com.finalproject.festival.domain.Product;

public interface FestivalMapDao {
	
	public abstract List<Product> productList();
	
	public abstract Map<String, Object> productArea();

}
