package com.finalproject.festival.service;

import java.util.List;
import java.util.Map;

import com.finalproject.festival.domain.Basket;
import com.finalproject.festival.domain.Product;

public interface ProductService {
	
	// 게시판 테이블에서 한 페이지에 해당하는 게시글 리스트, 페이징 퍼리에 필요한 데이터
	public abstract Map<String, Object> productList(
			int pageNum, String type, String keyword);
	
	// dao에서 현재 페이지 해당 글 리스트 가져옴  ajax 용 테스느??
	public abstract List<Product> productList();
	
//	dao에서 productNo 에 해당하는 게시글 읽어와 반환함 => isCount == true면 상세보기, false면 게시 글 수정 폼 요청하기
	public abstract Product getProduct(int productno, boolean isCount);
	
	public abstract void insertProduct(Product p);
	
	public boolean isPassCheck(int productno, String adminpassword);
	
	public abstract void updateProduct(Product p);
	
	public abstract void deleteProduct(int productno);
	
	///////////// 여기서부터는 장바구니 ///////////////
	// 장바구니 페이지 상세보기
	//public abstract Basket basketList(int basketno);
	
	
}
