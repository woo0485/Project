package com.finalproject.festival.manage.controller;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.finalproject.festival.domain.Manage;
import com.finalproject.festival.manage.service.InformationUseService;
import com.finalproject.festival.manage.service.NoticeService;

@Controller
public class InformationUseController {
	
	@Autowired
	private InformationUseService informationUseService;
	

	// 이용안내 삭제
	@RequestMapping("/informationUseDeleteProcess")
	public String deleteInformationUse(int informationUseNo) {
	
		informationUseService.deleteInformationUse(informationUseNo);
		
		return "redirect:informationUseMain";
	}
	
	
	// 이용안내 수정
	@RequestMapping(value="/informationUseUpdateProcess", method=RequestMethod.POST)
	public String updateInformationUse(Model model, Manage manage){

		informationUseService.updateInformationUse(manage);

		return "redirect:informationUseMain";		
	}
	
	// 이용안내 수정
	@RequestMapping(value="/informationUseUpdateProcess", method=RequestMethod.GET)
	public String updateInformationUse(Model model, int informationUseNo,
			@RequestParam(required=false, defaultValue="1")
			int pageNum){
		
		
		Manage m = informationUseService.getInformationUse(informationUseNo);
		
		model.addAttribute("informationUse" , m );
		
		return "manage/informationUse/informationUseUpdate";		
	}
	
	// 이용안내 글쓰기
	@RequestMapping(value="/informationUseWriteProcess" , method=RequestMethod.POST)
	public String insertInformationUse (Manage manage){
		
		informationUseService.insertInformationUse(manage);
		
		return "redirect:informationUseMain";
	}
	
	// 이용안내 디테일
	@RequestMapping("/informationUseDetail")
	public String getInformationUse (Model model, int informationUseNo ) {
		
		Manage m = informationUseService.getInformationUse(informationUseNo);
		
		model.addAttribute("informationUse" , m);
		
		return "manage/informationUse/informationUseDetail";
	}
	
	// 이용안내 메인
	@RequestMapping("/informationUseMain")
	public String informationUseMain(Model model,
			@RequestParam(value="pageNum", required=false,
			defaultValue="1") int pageNum) {
		
		Map<String, Object> modelMap = informationUseService.informationUse(pageNum);

		model.addAllAttributes(modelMap);
		
		return "manage/informationUse/informationUseMain";
	}
	
}
