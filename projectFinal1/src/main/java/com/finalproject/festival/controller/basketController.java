package com.finalproject.festival.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.finalproject.festival.domain.Basket;
import com.finalproject.festival.service.ProductService;

@Controller
public class basketController {
	
	@Autowired
	private ProductService pv;
	
	public void setProductService(ProductService pv) {
		this.pv = pv;
	}
	
	//@RequestMapping(value = {"/basket"}, method= RequestMethod.GET)
//	public String basketList (Model m, int basketno, int productno)  throws Exception { 
		
	//	Basket b = pv.getBasket(basketno);
	//	m.addAttribute("basket",b);
	//	return "basket";
	//}
}
