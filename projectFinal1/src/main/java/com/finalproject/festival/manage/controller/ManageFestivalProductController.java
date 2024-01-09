package com.finalproject.festival.manage.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.finalproject.festival.domain.Product;
import com.finalproject.festival.manage.service.ManageFestivalProductService;


@Controller
public class ManageFestivalProductController {

	@Autowired
	private ManageFestivalProductService manageFestivalProductService;
	
	// 상품 관리 삭제
	@RequestMapping ("/manageFestivalProductDeleteProcess.ajax")
	public String deleteManageFestivalProduct(int productno) {
		
		manageFestivalProductService.deleteManageFestivalProduct(productno);
		
		return "redirect:manageFestivalProduct";
	}
	
	// 상품 관리 페이지
	@RequestMapping (value="/manageFestivalProduct", method=RequestMethod.GET)
	public String manageFestivalProduct(Model model, 
			@RequestParam(value="pageNum", 
				required=false, defaultValue="1") int pageNum,
			@RequestParam(value="type",
				required=false, defaultValue="null") String type,
			@RequestParam(value="keyword",
				required=false, defaultValue="null") String keyword) {
		
		Map<String, Object> modelMap = 
				manageFestivalProductService.manageFestivalProduct(pageNum, type, keyword);
		
		model.addAllAttributes(modelMap);
		
		return "manage/manageFestivalProduct";
	}

}
