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
	
	// 회원 장바구니 목록 보여지는 것
/*	@RequestMapping(value = {"/basket"}, method= RequestMethod.POST)
	public String basketList (Model m, 
			@RequestParam(value = "basketno", required=false, defaultValue="1") int basketno, 
			@RequestParam(value = "productno", required=false, defaultValue="1") int productno,   
			@RequestParam(value = "basketproductcount", required=false, defaultValue="1") int basketproductcount,
			@RequestParam(value =  "id") String id) { 
		
		Map<String, Object> modelMap = bs.basketList(id, productno, basketno, basketproductcount) ;
		m.addAttribute(modelMap);
		return "basket";
	} */
	
	// 장바구니 목록 보여지는 것 - 1월 3일 ) 회원 아이디로
	@RequestMapping(value = {"/basket"}, method= RequestMethod.POST)
	public String basketList (Model m, String id, int productno	) {
	//	System.out.println("장바구니컨트롤러 세션 아이디" + session.getAttribute("id"));
		
		List<Map<String,Object>> basketList = bs.basketList(id, productno);
			
		System.out.println(basketList.get(0).get(""));
		
		m.addAttribute("basketList",basketList);
		
		return "basket";
	}
	
	//회원 장바구니 추가"redirect:productList"; - 1월 5일 수정함
	@RequestMapping(value = "/basketForm", method = RequestMethod.POST)
	public String insertBasket(
			HttpServletRequest request, 
			int basketproductcount, int basketno, int productprice, String id) 	throws IOException {	
		
		Basket b = new Basket();
		b.setBasketproductcount(basketproductcount);
		b.setBasketno(basketno);
		b.setProductprice(productprice);
		b.setId(id);
		System.out.println("basketcontroller에서 티켓 수량 입력 숫자:" + b.getBasketproductcount());
		//System.out.println("basketcontroller에서 가격:" +	b.setProductprice());
		
		bs.insertBasket(b);
		System.out.println("basket insert에서 basketno: " + b.getBasketno());
		
		return "redirect:basket";
	}
	
	// 회원 장바구니 삭제 - 1월 5일
	@RequestMapping("/checkBasketForm")
	public String deleteBasket (HttpServletResponse response,
			PrintWriter out, int basketno) {
		
			bs.deletdBasket(basketno);
		
		return "redirect:basket";
	}
	
	// 결제로 넘겨지는 1월 5일
	@RequestMapping(value = {"/priceOrder"}, method= RequestMethod.POST)
	public String priceOrder (Model m, String id, int productno	) {
	//	System.out.println("장바구니컨트롤러 세션 아이디" + session.getAttribute("id"));
		
		List<Map<String,Object>> priceOrder = bs.basketList(id, productno);
			
		System.out.println(priceOrder.get(0).get(""));
		
		m.addAttribute("priceOrder",priceOrder);
		
		return "priceOrder";
	}
	
}
