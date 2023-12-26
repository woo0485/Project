package com.finalproject.festival.manage.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.finalproject.festival.domain.Manage;
import com.finalproject.festival.manage.service.InquiryService;
import com.finalproject.festival.manage.service.NoticeService;

@Controller
public class InquiryController {
	
	@Autowired
	private InquiryService inquiryService;
	

	// 관리페이지 1:1 문의 디테일
	@RequestMapping("/manageIndividualDetail")
	public String manageIndividualDetail(Model model, int questionNo) {
		
		Manage m = inquiryService.getInquiry(questionNo);
		
		model.addAttribute("question", m);
		
		return "manage/manageIndividualDetail";
	}	
		
	// 관리페이지 1:1 문의 페이지
	@RequestMapping("/manageIndividual")
	public String manageIndividual(Model model,
			@RequestParam(value="qestionCategory", required=false,defaultValue="null")String qestionCategory, 
			@RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum) {
		
		Map<String, Object> modelMap = 
				inquiryService.inquiry(qestionCategory, pageNum);
		
		model.addAllAttributes(modelMap);
		model.addAttribute("qestionCategory", qestionCategory);
		
		return "manage/manageIndividual";
	}
	
	
	
	// 관리페이지 상품 문의 디테일
	@RequestMapping("/manageProductDetail")
	public String manageProductDetail(Model model, int questionNo) {
		
		Manage m = inquiryService.getInquiry(questionNo);
		
		model.addAttribute("question", m);
		
		return "manage/manageProductDetail";
	}
	
	// 관리페이지 상품 문의 페이지
	@RequestMapping("/manageProduct")
	public String manageProduct(Model model,
			@RequestParam(value="qestionCategory", required=false,defaultValue="null")String qestionCategory, 
			@RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum){
		
		Map<String, Object> modelMap = inquiryService.inquiry(qestionCategory, pageNum);
		
		model.addAllAttributes(modelMap);
		model.addAttribute("qestionCategory", qestionCategory);
		
		return "manage/manageProduct";
	}
	
	
	// 문의 하기
	@RequestMapping("/inquiryWriteProcess")
	public String inquiryWrite(Manage manage){
		
		inquiryService.insertInquiry(manage);
		
		return "redirect:customerMain";
	}
	
}
