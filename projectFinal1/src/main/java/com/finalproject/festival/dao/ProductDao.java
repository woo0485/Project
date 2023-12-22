package com.finalproject.festival.dao;

import java.util.List;

import com.finalproject.festival.domain.Product;

public interface ProductDao {
	
	public abstract List<Product> productList(
			int startRow, int num, String type, String keyword);
	
	// 상세보기
	public abstract Product getProduct(int productno); 	
	
	public abstract void readCount(int productno);
	
	// 게시 글 수 계산 => 페이징 처리
	public abstract int getProductCount(String type, String keyword);
	
	public abstract void insertProduct(Product p);
	
	// 수정, 삭제
	public boolean isPassCheck(int productno, String adminpassword);
	
	public abstract void updateProduct(Product p);
	
	public abstract void deleteProduct(int productno);
	
	
	
}
