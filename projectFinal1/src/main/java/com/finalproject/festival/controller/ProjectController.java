package com.finalproject.festival.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class ProjectController {
	
	
	
	@RequestMapping("/main")//메인페이지로 이동
	public String main () {
		return "main";
	}
	
	@RequestMapping("/login")//로그인 페이지로 이동
	public String loginFrom (){
		return "login";
	}

	
	@RequestMapping("/memberJoin")//가입 정보동의약관
	public String memberJoin(){
		return"memberJoinConfirm";
	}
	
	@RequestMapping("/memberJoinForm")//회원가입페이지
	public String memberJoinForm(){
		return"memberJoinForm";
	}
	
}
