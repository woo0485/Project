package com.finalproject.festival.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.finalproject.festival.domain.Basket;
import com.finalproject.festival.service.BasketService;
import com.finalproject.festival.service.ProductService;

@Controller
public class basketController {
	
	@Autowired
	private BasketService bs;
	
	public void setBasketService (BasketService bs) {
		this.bs = bs;
	}
	
	// 회원 장바구니
	@RequestMapping(value = {"/basket"}, method= RequestMethod.GET)
	public String basketList (Model m, 
			@RequestParam(value = "basketno", required=false, defaultValue="1") int basketno, 
			@RequestParam(value = "productno", required=false, defaultValue="1") int productno,   
			@RequestParam(value = "basketproductcount", required=false, defaultValue="1") int basketproductcount,
			@RequestParam(value =  "id") String id) { 
		
		Map<String, Object> modelMap = bs.basketList(id, productno, basketno, basketproductcount) ;
		m.addAttribute(modelMap);
		return "basket";
	}
	
}
