package com.finalproject.festival.manage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.finalproject.festival.domain.Product;
import com.finalproject.festival.domain.Sales;
import com.finalproject.festival.manage.service.ManageProductCountService;
import com.finalproject.festival.manage.service.ManageSalesService;

@Controller
public class ManageController {
	
	@Autowired
	private ManageSalesService manageSalesService;
	
	@Autowired
	private ManageProductCountService manageProductCountService;
	
	//관리자 메인 페이지
	@RequestMapping("/manageMain")
	public String manageMain(Model model){
		
		List<Sales> salesList = manageSalesService.salesList();
		List<Sales> lastYearSalesList = manageSalesService.lastYearSalesList();
		List<Sales> yearBeforeLastSalesList2 = manageSalesService.yearBeforeLastSalesList2();
		List<Product> manageProductCountList = manageProductCountService.manageProductCount5();
		
		model.addAttribute("salesList", salesList);
		model.addAttribute("lastYearSalesList", lastYearSalesList);
		model.addAttribute("yearBeforeLastSalesList2", yearBeforeLastSalesList2);
		model.addAttribute("manageProductCountList", manageProductCountList);
		
		return "manage/manageMain";
	}
	

}