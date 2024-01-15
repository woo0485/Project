package com.finalproject.festival.controller;

import java.io.IOException;
import java.util.HashMap;
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
		//return "priceOrderFinish"; // 주문완료 테스트 화면
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
	public String priceOrder (Model model, HttpSession session) {

		// 세션에서 회원 아이디를 읽어온다.
		String id = (String) session.getAttribute("id");

		// 응답 데이터 생성		
		model.addAllAttributes(bs.basketList(id));
		return "priceOrder";
	}	


	// 장바구니에 있는 제품 수량 변경하기
	@PostMapping(value = "/updateDeleteForm")
	@ResponseBody
	public Map<String, Object> updateDeleteForm (HttpSession session,
			@RequestParam(value = "basketProductCount")  int basketProductCount,
			@RequestParam(value = "basketNo") int basketNo,
			@RequestParam(value = "productNo") int productNo) {	
		
		// 세션에서 회원 아이디를 읽어온다.
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
		resultMap.put("msg", "의 수량을 변경하였습니다.");
		resultMap.put("basketTotalPrice", bs.getBasketTotalPrice(id));
		resultMap.put("basketList", bs.basketList(id));
		
		return resultMap ;
	 }	
	
	// 장바구니에 있는 제품 하나씩 삭제하기
	@PostMapping(value="/deleteBasketNo")
	@ResponseBody
	public Map<String, Object> deleteBasketNo(HttpSession session,			
			@RequestParam(value = "basketNo") int basketNo) {	
		
		// 세션에서 회원 아이디를 읽어온다.
		String id = (String) session.getAttribute("id");
		
		// DB 테이블에서 장바구니 삭제		
		bs.deleteBasketNo(basketNo);
		
		// 응답 데이터 생성
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", true);		
		resultMap.put("msg", "을 삭제하였습니다.");
		resultMap.put("basketTotalPrice", bs.getBasketTotalPrice(id));
		resultMap.put("basketList", bs.basketList(id));
		
		return resultMap ;
	}
	
	// 장바구니 비우기 - 장바구니 전체 상품 삭제하기
	@RequestMapping(value = "/deleteBasketAll", method= RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteProduct(HttpSession session) throws Exception {		
		// 세션에서 회원 아이디를 읽어온다.
		String id = (String) session.getAttribute("id");
		
		// DB 테이블에서 장바구니를 비운다.
		bs.deleteBasketAll(id);	
		
		// 응답 데이터 생성
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", true);		
		resultMap.put("msg", "장바구니의 모든 상품을 삭제하였습니다.");		
		resultMap.put("basketList", bs.basketList(id));
		
		return resultMap ;
	}
	
	
}
