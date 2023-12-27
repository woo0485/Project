package com.finalproject.festival.controller;


import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finalproject.festival.domain.Member;
import com.finalproject.festival.service.MailService;
import com.finalproject.festival.service.MemberService;



@Controller
public class ProjectController {
	
	
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private MailService mailService;
	
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
	
	//로그인 
	@ResponseBody
	@RequestMapping(value = "/loginForm", method = RequestMethod.POST, consumes = "application/json")
	public int loginCheck(HttpSession session, @RequestBody Map<String, String> param) {
		
		String id = (String)param.get("id");
		String password = (String)param.get("password");
		
		System.out.println("id"+id+"password"+password);
		
		boolean result = memberService.loginCheck(id, password);
		
		try {
			if(result) {
				session.setAttribute("id", id);
				return 1;
			}
			else {
				return 0;
			}
			
		 } catch (Exception e) {
				return -1;
		 }
		
		};
	
	// 아이디 중복확인 
	@ResponseBody
	@RequestMapping(value = "/joinIdCheck", method = RequestMethod.POST)
	public int joinIdCheck(String id) {
	    
	    System.out.println("controller-id- "+ id);
   
	    int idCheck = memberService.joinIdCheck(id);
	    
	    System.out.println("idCheck"+idCheck);
	    return idCheck;
	};

	//이메일 인증
		@ResponseBody
		@RequestMapping(value = "/mailCheck", method = RequestMethod.POST)
		public String mailCheck(String email) {
			System.out.println("이메일 인증 요청이 들어옴!");
			System.out.println("이메일 인증 이메일 : " + email);
			return mailService.joinEmail(email);
		}
	
	
}
