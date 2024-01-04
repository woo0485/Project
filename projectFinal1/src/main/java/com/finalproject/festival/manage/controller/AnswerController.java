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
	
	// 관리페이지 상품 메일 답장 , DB저장
	@RequestMapping("/productMailSend")
	public String execProductMail(Manage manage) {
		
		answerService.sendAnswerMail(manage);
		answerService.insertAnswer(manage);
		
		return "redirect:manageProduct?qestionCategory=product";
	}
	
	// 관리페이지 1:1 메일 답장 , DB저장
	@RequestMapping("/individualMailSend")
	public String execindividualMail(Manage manage) {
		
		answerService.sendAnswerMail(manage);
		answerService.insertAnswer(manage);
		
		return "redirect:manageIndividual?qestionCategory=individual";
	}
	
}
