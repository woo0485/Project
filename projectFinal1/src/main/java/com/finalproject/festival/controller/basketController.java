package com.finalproject.festival.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.finalproject.festival.domain.Basket;
import com.finalproject.festival.domain.Member;
import com.finalproject.festival.service.BasketService;
import com.finalproject.festival.service.ProductService;

@Controller
public class basketController {
	
	@Autowired
	private BasketService bs;
	
	
	public void setBasketService (BasketService bs) {
		this.bs = bs;
	}
	
	@RequestMapping("/basketRedirect")
	public String basketRedirect () {
		
		return "basketRedirect";
		
	}
	
	// 장바구니 목록 보여지는 것 - 1월 3일 ) 회원 아이디로
	@RequestMapping(value = {"/basket"}, method= RequestMethod.POST)
	public String basketList (Model m, String id, int productno	) {
	//	System.out.println("장바구니컨트롤러 세션 아이디" + session.getAttribute("id"));
		
		List<Map<String,Object>> basketList = bs.basketList(id, productno);
			
		System.out.println(basketList.get(0).get(""));
		
		m.addAttribute("basketList",basketList);
		
		return "basket";
	}
	
	// @@@@@@@@@@ 장바구니에 담기 @@@@@@@@@@
	////// 여기서부터는 장바구니에 1) productno가 이미 존재하면  수량만 증가(update)시켜주기 2) productno가 존재하지 않으면 productno와 수량 둘다 insert하기/////
	
		// productno가 중복되면 productno랑 수량만 증가시켜주기 update 쿼리문 -1월 6일
	//Service에서 if문으로 처리해줘서 Controller에서는 그냥 insert만 시켜줘도 될듯??????? - 1월 7일
		@RequestMapping(value = "/addBasket", method = RequestMethod.POST)
		public String InsertBasket (
				HttpServletRequest request, 
				 @RequestParam(value = "basketproductcount")  int basketproductcount, 
				 @RequestParam(value = "productno") int productno, 
				 @RequestParam(value = "id") String id) 	throws IOException {	
			
			Basket b = new Basket();
			b.setId(id);
			b.setProductno(productno);
			b.setBasketproductcount(basketproductcount);
			System.out.println("BasketController에서 insertBasket 회원 아이디 : " + b.getId());
			System.out.println("BasketController에서 insertBasket productno : " + b.getProductno());
			System.out.println("BasketController에서 insertBasket basketproductcount : " + b.getBasketproductcount());
			
			bs.insertBasket(b);
			
			return "redirect:productList";
		}

		// @@@@@@@@@@ 장바구니에 담기 끝 @@@@@@@@@@
///////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 회원 장바구니 삭제 - 1월 5일 수정
		/*
	@RequestMapping(value = {"/deleteB"})
	public String deleteBasket (HttpServletResponse response,
			PrintWriter out, 
			int basketno, String id) {
		bs.deletdBasket(basketno, id);
		
		return "redirect:basket";
	}
	*/
	
	// 결제로 넘겨지는 1월 5일
	@RequestMapping(value = {"/priceOrder"}, method= RequestMethod.POST)
	public String priceOrder (Model m, String id, int productno	) {
	//	System.out.println("장바구니컨트롤러 세션 아이디" + session.getAttribute("id"));
		List<Map<String,Object>> priceOrder = bs.basketList(id, productno);
		System.out.println(priceOrder.get(0).get("basketno"));
		
		m.addAttribute("priceOrder",priceOrder);
		return "priceOrder";
	}
	
}
