package com.finalproject.festival.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.finalproject.festival.domain.Basket;
import com.finalproject.festival.domain.Member;
import com.finalproject.festival.domain.Reservation;
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
	
	// 장바구니 목록 보여지는 것 - 1월 3일 ) 회원 아이디로 - 장바구니에 목록이 비었다면 비었다는 메세지도 같이 보여줘야함 => 안그러면 오류메세지뜸 => 그거 처리해줘야함.
	@RequestMapping(value = {"/basket"}, method= RequestMethod.POST)
	public String basketList (Model m, String id, int productno) {
	//	System.out.println("장바구니컨트롤러 세션 아이디" + session.getAttribute("id"));
		List<Map<String,Object>> basketList = bs.basketList(id, productno);
		
		System.out.println("(basket 뷰 페이지 장바구니 목록- basketList 컨트롤럴에서: basketList" + basketList);
		m.addAttribute("basketList",basketList);
		
		// 장바구니가 비었을 때 띄워줄 메세지
		/*
		if (basketList.isEmpty()) {
	        // 장바구니가 비어있을 때 메시지 설정
	        m.addAttribute("emptyBasketMessage", "장바구니가 텅 비었어요");
	    } else {
	        m.addAttribute("basketList", basketList);
	    }
		*/
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
	
//////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 결제로 넘겨지는 1월 5일
	@RequestMapping(value = {"/priceOrder"}, method= RequestMethod.POST)
	public String priceOrder (Model m, String id, int productno	) {
	//	System.out.println("장바구니컨트롤러 세션 아이디" + session.getAttribute("id"));
		List<Map<String,Object>> priceOrder = bs.basketList(id, productno);
		System.out.println(priceOrder.get(0).get("basketno"));
		
		m.addAttribute("priceOrder",priceOrder);
		return "priceOrder";
	}
	
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//// @@@@@@@@@ 장바구니의 상품 수량 변경 및 삭제 @@@@@@@@@@@@@@@@@
//	@RequestMapping(value = "/updateDeleteForm", method = RequestMethod.POST)
//	 @ResponseBody
//	public String updateDeleteForm (
//			HttpServletRequest request, 
//			 @RequestParam(value = "id") String id,
//			 @RequestParam(value = "productno") int productno,
//			 @RequestParam(value = "basketproductcount") int basketproductcount) throws IOException {	
//		/*
//		 try {
//			Basket b = new Basket();
//			b.setId(id);
//			b.setProductno(productno);
//		
//			 // 1) Reservation에 insert
//			 // 2) ShoppingBasket에 delete
//			 // 3) Reservation에서 select
//			 rs.BasketListByIdByProductno(id, re);
//			 
//			 // insert하면서 동시에 select 하는 Service - 1월 9일
//			// rs.BasketListByIdByProductno(id, re);
//	
//			 return "success";
//			// return "redirect:/priceOrderFinish.jsp";
//			 
//		 } catch (Exception e) {
//			e.printStackTrace();
//			
//		}
//		 return "main" ;
//		 */
//		Basket bb =  new Basket();
//		bb.setId(id);
//		bb.setProductno(productno);
//		bb.setBasketproductcount(basketproductcount);
//		
//		bs.updateBasketProductnoCount(bb);
//		
//		return "redirect:productList";
//	 }	

	// 다른데로 거쳐서 가는 ajax로 보내기 때문에 GET 방식으로 보낸다 => 아닌가?
	@RequestMapping(value = "/updateDeleteForm")
	@ResponseBody
	public Map<String, String> updateDeleteForm ( Model m,
			@RequestParam(value = "basketProductCount")  int basketProductCount, 
			@RequestParam(value = "id") String id, 
		//	@RequestParam(value = "basketProductNo") int basketProductNo,
			@RequestParam(value = "basketno") int basketno
			) {	
		
		System.out.println("수량 update하는 컨트롤러: " +basketProductCount );
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("id", id);
		//param.put("basketProductNo", basketProductNo);
		param.put("basketProductCount", basketProductCount);
		param.put("basketno", basketno);
		
		//m.addAttribute("param", param );
		
		bs.updateBasketProductnoCount(param);
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("result", "ok");
		
		
		return map ;
	 }	
	
	
	////////////////////////////  그냥 장바구니에 있는 전체 상품 삭제하기
	@RequestMapping(value = "/deleteBasketAll", method= RequestMethod.POST)
	public String deleteProduct (
			@RequestParam(value = "id") String id) throws Exception {
		
		bs.deleteBasketAll(id);
	
		return "basketRedirect" ;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
