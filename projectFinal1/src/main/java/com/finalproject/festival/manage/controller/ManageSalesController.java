package com.finalproject.festival.manage.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.finalproject.festival.domain.Sales;
import com.finalproject.festival.manage.service.ManageReservationService;
import com.finalproject.festival.manage.service.ManageSalesService;

@Controller
public class ManageSalesController {
	
	@Autowired
	private ManageSalesService manageSalesService;
	
	// 매출 데이터 삭제
	@RequestMapping("/deleteSalesTotalPrice.ajax")
	public String deleteSalesTotalPrice(int salesNo) {
		
		manageSalesService.deleteSalesTotalPrice(salesNo);
		
		return "redirect:manageSales";
	}
	
	// 매출데이터 전송
	@RequestMapping(value="/salesWriteProcess" , method=RequestMethod.POST)
	public String salesTotalPriceWrite(Sales sales) {
		
		manageSalesService.salesTotalPriceWrite(sales);		
		
		return "redirect:manageSales";
	}

	// 매출 관리 페이지
	@RequestMapping("/manageSales")
	public String manageSales(Model model, 
			@RequestParam(value="pageNum", 
			required=false, defaultValue="1") int pageNum,
		@RequestParam(value="type",
			required=false, defaultValue="null") String type,
		@RequestParam(value="keyword",
			required=false, defaultValue="null") String keyword){
		
		Map<String, Object> modelMap = manageSalesService.manageSales(pageNum, type, keyword);
		
		model.addAllAttributes(modelMap);
		
		return "manage/manageSales";
	}


}
