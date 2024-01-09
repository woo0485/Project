package com.finalproject.festival.manage.service;

import java.util.List;
import java.util.Map;

import com.finalproject.festival.domain.Product;

public interface ManageFestivalProductService {

	public abstract Map<String, Object> manageFestivalProduct(int pageNum, String type, String keyword);
	
	public abstract void deleteManageFestivalProduct(int productno);
	
}
