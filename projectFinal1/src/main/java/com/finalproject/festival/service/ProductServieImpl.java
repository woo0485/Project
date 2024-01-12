package com.finalproject.festival.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.festival.dao.ProductDao;
import com.finalproject.festival.domain.Basket;
import com.finalproject.festival.domain.Product;

@Service
public class ProductServieImpl implements ProductService {

	private static final int PAGE_SIZE = 16;
	
	private static final int PAGE_GROUP = 3;

	@Autowired
	private ProductDao PD;

	public void setProductDao(ProductDao pd) {
		this.PD = pd;
	}

	@Override
	public Map<String, Object> productList(int pageNum, String type, String keyword) {

		int currentPage = pageNum;
		int startRow = (currentPage - 1) * PAGE_SIZE;
		int listCount = 0;

		boolean searchOption = (type.equals("null") || keyword.equals("null")) ? false : true;

		listCount = PD.getProductCount(type, keyword);
		System.out.println("listcount:" + listCount + "type:" + type + "keyword" + keyword);

		if (listCount > 0) {
			List<Product> productList = PD.productList(startRow, PAGE_SIZE, type, keyword);

			int pageCount = listCount / PAGE_SIZE + (listCount % PAGE_SIZE == 0 ? 0 : 1);

			int startPage = (currentPage / PAGE_GROUP) * PAGE_GROUP + 1
					- (currentPage % PAGE_GROUP == 0 ? PAGE_GROUP : 0);

			int endPage = startPage + PAGE_GROUP - 1;

			if (endPage > pageCount) {
				endPage = pageCount;
			}

			Map<String, Object> modelMap = new HashMap<String, Object>();

			modelMap.put("productList", productList);
			modelMap.put("pageCount", pageCount);
			modelMap.put("startPage", startPage);
			modelMap.put("endPage", endPage);
			modelMap.put("currentPage", currentPage);
			modelMap.put("listCount", listCount);
			modelMap.put("pageGroup", PAGE_GROUP);
			modelMap.put("searchOption", searchOption);

			// 검색 요청이면 type과 keyword를 모델에 저장한다.
			if (searchOption) {
				modelMap.put("type", type);
				modelMap.put("keyword", keyword);
			}

			return modelMap;
		} else {
			return null;
		}
	}

	@Override
	public Product getProduct(int productno, boolean isCount) {
		if(isCount) {
			PD.readCount(productno);
		}
		return PD.getProduct(productno);
	}

	// ajax 용 테스느?? (startRow, num, type, keyword);
	@Override
	public List<Product> productList() {
		return PD.productList(0, 10, "null", "null");
	}

	@Override
	public void insertProduct(Product p) {
		System.out.println("product서비스에서 prodcutticketcount"+p.getProductticketcount() );
		System.out.println("product서비스에서 location"+p.getProductlocation() );
		System.out.println("product서비스에서 closedate"+p.getProductclosedate() );
		PD.insertProduct(p);
	}

	@Override
	public boolean isPassCheck(int productno, String adminpassword) {
		System.out.println("서비스에서 프로덕트넘버"+productno );
		return PD.isPassCheck(productno, adminpassword);
	}

	@Override
	public void updateProduct(Product p) {
		PD.updateProduct(p);
	}

	@Override
	public void deleteProduct(int productno) {
		PD.deleteProduct(productno);
	}
	
	// 북마크 기능 - 1월 4일) 북마크 정보 업데이트하고 갱신된 북마크를 가져오는 메서드
		@Override
		public Map<String, Integer> Bookmark(int productno, int productbookmarkcount) {
			PD.updateBookmark(productno, productbookmarkcount);
			Product p = PD.getBookmark(productno);
			
			Map<String, Integer> map = new HashMap<String, Integer>(); 
			map.put("productbookmarkcount", p.getProductbookmarkcount());
		
			return map;
		}

	/////// 결제 진행되면서 product의 남은 티켓 수에서 결제된 티켓 수만큼 빼주는 것
		@Override
		public void updateProductRemainTicketCount(int productno, int productremainticketcount) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("productno", productno);
			map.put("productremainticketcount", productremainticketcount);
			
		}


}
