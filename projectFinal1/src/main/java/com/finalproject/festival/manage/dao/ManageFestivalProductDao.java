package com.finalproject.festival.manage.dao;

import java.util.List;

import com.finalproject.festival.domain.Product;

public interface ManageFestivalProductDao {
	
	public abstract int getBoardCount(String type, String keyword);

	public abstract List<Product> manageFestivalProduct(int start, int num, String type, String keyword);
	
	public abstract Product getManageFestivalProduct(int productno);
	
	public abstract void updateManageFestivalProduct(Product product);
	
	public abstract void deleteManageFestivalProduct(int productno);

}
