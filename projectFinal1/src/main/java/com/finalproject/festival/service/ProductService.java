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
	
	// 북마크 기능 - 1월 4일) 북마크 정보 업데이트하고 갱신된 북마크를 가져오는 메서드
		public Map<String, Integer> Bookmark (int productno, int productbookmarkcount );
		
///// ############ 여기서부터는 결제 진행되면서 Product 테이블의 남은 티켓수에서 결제된 티켓 수만큼 빼주는 것.	
		public void productnoCheckRemainticketcount(int productno);
		
		
		public void updateProductRemainTicketCount (int productno, int productremainticketcount);

}
