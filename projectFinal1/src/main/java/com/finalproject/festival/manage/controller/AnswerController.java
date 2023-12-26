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
import com.finalproject.festival.manage.service.AnswerService;

@Controller
public class AnswerController {
	
	@Autowired
	private AnswerService answerService;
	
	// 관리페이지 상품 문의 답장 
	@RequestMapping("/individualtMailWrite")
	public String individualtAnswer(Manage manage) {
		
		answerService.insertAnswer(manage);
		
		return "redirect:manageMain";
	}
	
	// 관리페이지 상품 문의 답장 
	@RequestMapping("/productMailWrite")
	public String productAnswer(Manage manage) {
		
		answerService.insertAnswer(manage);
		
		return "redirect:manageMain";
	}
	
	
	
}
