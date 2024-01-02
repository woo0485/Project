package com.finalproject.festival.dao;

import java.util.List;

import com.finalproject.festival.domain.Product;
import com.finalproject.festival.domain.Basket;

public interface ProductDao {
	
	public abstract List<Product> productList(
			int startRow, int num, String type, String keyword);
	
	// 상세보기
	public abstract Product getProduct(int productno); 	
	
	public abstract void readCount(int productno);
	
	// 게시 글 수 계산 => 페이징 처리
	public abstract int getProductCount(String type, String keyword);
	
	public abstract void insertProduct(Product p);
	
	// 삭제할 때는 비번 입력
	public boolean isPassCheck(int productno, String adminpassword);
	// 수정할 때는 비번하지 않음
	
	public abstract void updateProduct(Product p);
	
	public abstract void deleteProduct(int productno);
	
	///////////// 여기서부터는 장바구니 ///////////////
	// 장바구니에서 담은 목록 보기
	//public abstract Basket basketList(int basketno);
	
	
}
