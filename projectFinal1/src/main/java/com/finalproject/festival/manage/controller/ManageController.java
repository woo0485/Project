package com.finalproject.festival.manage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.finalproject.festival.domain.Festival;
import com.finalproject.festival.manage.service.ManageMemberService;
import com.finalproject.festival.manage.service.NoticeService;

@Controller
public class ManageController {
	
	@Autowired
	private ManageMemberService manageMemberService;
	
	// 이벤트 관리 페이지
	@RequestMapping("/manageEvent")
	public String manageEvent(){
		
		return "manage/manageEvent";
	}
	
	// 축제 관리 페이지
	@RequestMapping("/manageFestival")
	public String manageFestival(){
		
		return "manage/manageFestival";
	}
	
	
	// 매출 관리 페이지
	@RequestMapping("/manageSales")
	public String manageSales(){
		
		return "manage/manageSales";
	}
	
	//관리자 메인 페이지
	@RequestMapping("/manageMain")
	public String manageMain(){
		
		return "manage/manageMain";
	}
	

}
