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
	
	// 북마크 기능 - 1월 4일 ) 해당 productno에 해당하는 북마크 몇개인지 불러오기
		public abstract Product getBookmark(int productno);
		
	// 북마크 업데이트- 1월 4일) productno에 해당하는 북마크 수를 업데이트한다.
	public abstract void updateBookmark(int productno, int productbookmarkcount);
		
 /////@@@@@@@@ 여기서부터는 결제될 때 product 테이블의 남은 티켓 수 -  장바구니 티켓 배준다. @@@@@@@@@@@@@@@@@@
	// productno에 해당하는 Product 테이블의 남은 티켓 수를 조회해온다.
	public void productnoCheckRemainticketcount(int productno);
	
	// 결제되면서 상품 수량에서 결제한 수량만큼 빼주기
	public void updateProductRemainTicketCount(int productno, int productremainticketcount );
		
	
	
}
