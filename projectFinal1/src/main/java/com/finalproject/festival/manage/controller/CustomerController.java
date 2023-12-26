package com.finalproject.festival.manage.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.finalproject.festival.manage.dao.InformationUseDao;
import com.finalproject.festival.manage.service.InformationUseService;
import com.finalproject.festival.manage.service.NoticeService;

@Controller
public class CustomerController {
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired 
	private InformationUseService informationUseService;
	
	
	// 고객센터 메인
	@RequestMapping("/customerMain")
	public String customerMain(Model model,
			@RequestParam(value="pageNum", required=false,
			defaultValue="1") int pageNum) {
		
		Map<String, Object> modelMap1 = noticeService.notice(pageNum);
		Map<String, Object> modelMap2 = informationUseService.informationUse(pageNum);

		model.addAllAttributes(modelMap1);
		model.addAllAttributes(modelMap2);
		
		return "manage/customer/customerMain";
	}
	
	
}
