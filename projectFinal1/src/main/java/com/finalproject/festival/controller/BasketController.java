package com.finalproject.festival.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finalproject.festival.domain.Basket;
import com.finalproject.festival.service.BasketService;

@Controller
public class BasketController {
	
	@Autowired
	private BasketService bs;
	
	
	public void setBasketService (BasketService bs) {
		this.bs = bs;
	}
	
	@RequestMapping("/basketRedirect")
	public String basketRedirect () {
		
		return "basketRedirect";
		
	}
	
	// 장바구니 목록 보여지는 것 - 1월 3일 ) 회원 아이디로 - 장바구니에 목록이 비었다면 비었다는 메세지도 같이 보여줘야함 => 안그러면 오류메세지뜸 => 그거 처리해줘야함.
	@PostMapping(value = {"/basket"})
	public String basketList (Model m,  String id) {
		System.out.println("id : " + id);
		m.addAllAttributes(bs.basketList(id));

		return "basket";
	}
	
	// @@@@@@@@@@ 장바구니에 담기 @@@@@@@@@@
	////// 여기서부터는 장바구니에 1) productno가 이미 존재하면  수량만 증가(update)시켜주기 2) productno가 존재하지 않으면 productno와 수량 둘다 insert하기/////
	
		// productno가 중복되면 productno랑 수량만 증가시켜주기 update 쿼리문 -1월 6일
	//Service에서 if문으로 처리해줘서 Controller에서는 그냥 insert만 시켜줘도 될듯??????? - 1월 7일
		@RequestMapping(value = "/addBasket", method = RequestMethod.POST)
		public String InsertBasket (
				HttpServletRequest request, 
				 @RequestParam(value = "basketProductCount")  int basketProductCount, 
				 @RequestParam(value = "productNo") int productNo,
				 @RequestParam(value = "productPrice") int productPrice, 
				 @RequestParam(value = "id") String id) 	throws IOException {	
			
			Basket b = new Basket();
			b.setId(id);
			b.setProductNo(productNo);
			b.setProductPrice(productPrice);
			b.setBasketProductCount(basketProductCount);
			
			bs.insertBasket(b);
			
			return "redirect:basketRedirect";
		}
	
//////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 결제로 넘겨지는 1월 5일
	@RequestMapping(value = {"/priceOrder"}, method= RequestMethod.POST)
	public String priceOrder (Model m, String id	) {

		Map<String, Object> modelMap = bs.basketList(id);	
		
		m.addAllAttributes(modelMap);
		return "priceOrder";
	}	


	// 다른데로 거쳐서 가는 ajax로 보내기 때문에 GET 방식으로 보낸다 => 아닌가?
	@PostMapping(value = "/updateDeleteForm")
	@ResponseBody
	public Map<String, Object> updateDeleteForm ( Model m, HttpSession session,
			@RequestParam(value = "basketProductCount")  int basketProductCount,
			@RequestParam(value = "basketNo") int basketNo,
			@RequestParam(value = "productNo") int productNo) {	
		
		String id = (String) session.getAttribute("id");
		
		// 응답 데이터
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		// 수량을 변경할 수 있는지 - 주문 가능 수량
		int remainCnt = bs.getProductRemainingAmount(productNo);
		if(remainCnt < basketProductCount) {
			resultMap.put("result", false);
			resultMap.put("remainCnt", remainCnt);
			resultMap.put("msg", "주문 가능 수량을 초과하였습니다.");
			
			return resultMap;
		}
		
		// DB 테이블에서 장바구니 수정
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("id", id);		
		param.put("basketProductCount", basketProductCount);
		param.put("basketNo", basketNo);
		
		bs.updateBasketProductNoCount(param);
		
		// 응답 데이터 생성
		resultMap.put("result", true);
		resultMap.put("remainCnt", remainCnt);
		resultMap.put("msg", "주문 수량을 변경하였습니다.");
		resultMap.put("basketList", bs.basketList(id));
		
		return resultMap ;
	 }	
	
	///////////////// 장바구니에 있는 제품 하나하나 삭제하기  ////////////////////////////////////
	@PostMapping(value = "/deleteBasketProductNo")
	@ResponseBody
	public Map<String, Object>  deleteBasketProductNo ( Model m, HttpSession session,
			@RequestParam(value = "productNo") int productNo) {	
		
		String id = (String) session.getAttribute("id");
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("id", id);
		param.put("productNo", productNo);
		
		bs.deleteBasketProductno(productNo, id);
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("basketList", bs.basketList(id));
	
		return result ;
	 }	
	/////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////  그냥 장바구니에 있는 전체 상품 삭제하기
	@RequestMapping(value = "/deleteBasketAll", method= RequestMethod.POST)
	public String deleteProduct (
			@RequestParam(value = "id") String id) throws Exception {
		
		bs.deleteBasketAll(id);
	
		return "basketRedirect" ;
	}
	
}
