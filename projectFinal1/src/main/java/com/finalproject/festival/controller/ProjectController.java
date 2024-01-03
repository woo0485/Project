package com.finalproject.festival.controller;


import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	
	
	private static final int HashMap = 0;
	@Autowired
	private MemberService memberService;
	@Autowired
	private MailService mailService;
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	
	@RequestMapping("/main")//메인페이지로 이동
	public String main () {
		return "main";
	}
	
	@RequestMapping("/login")//로그인 페이지로 이동
	public String loginFrom (){
		return "login";
	}

	
	@RequestMapping("/memberJoinPage")//가입 정보동의약관
	public String memberJoinPage(){
		return"memberJoinConfirm";
	}
	
	@RequestMapping("/memberJoinForm")//회원가입페이지
	public String memberJoinForm(){
		return"memberJoinForm";
	}
	
	@RequestMapping("/privacyPolicyPage")//정보처리방침
	public String privacyPolicyPage() {
		return "privacyPolicyPage";
	}
	
	@RequestMapping("/termsOfUse")//정보처리방침
	public String termsOfUsePage() {
		return "termsOfUsePage";
	}
	
	@RequestMapping("/copyrightPolicy")//정보처리방침
	public String copyrightPolicyPage() {
		return "copyrightPolicyPage";
	}
	
	@RequestMapping("/idPasswordFind")//아이디비번찾기페이지
	public String idAndPasswordFindPage() {
		return "idPasswordFindPage";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("id");
		return "main";
	}
	
	
	//로그인 
	@ResponseBody
	@RequestMapping(value = "/loginForm", method = RequestMethod.POST, consumes = "application/json")
	public int loginCheck(HttpSession session, @RequestBody Map<String, String> param)
				throws ServletException, IOException{
		
		
		String id = (String)param.get("id");
		String password = (String)param.get("password");
		Map<String, Object> user = new  HashMap<>();
		user = memberService.loginCheck(id);
		boolean result = false;
		
		System.out.println("login-map:::::"+user);
		
		if(user.get("id").equals(id) && passwordEncoder.matches(password, (String)user.get("password"))) {
			result = true;
		}
		
		
		try {
			if(result) {
				session.setAttribute("id", id);
				session.setAttribute("name", (String)user.get("name"));
				session.setAttribute("userType", (String)user.get("userType"));
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
	    
	    System.out.println("아이디 중복확인 controller-id-"+ id);
   
	    int idCheck = memberService.joinIdCheck(id);
	    
	    System.out.println("idCheck"+idCheck);
	    return idCheck;
	};
	//이메일 중복확인
	/* String email = (String)param.get("email"); */
	@ResponseBody
	@RequestMapping(value = "/joinEmailCheck",method = RequestMethod.POST)
	public int joinEmailCheck(String email) {
		int result = 0;
		result =memberService.joinEmailCheck(email);
		return result;
	}
	

	//이메일 인증
	@ResponseBody
	@RequestMapping(value = "/mailCheck", method = RequestMethod.POST)
	public String mailCheck(String email) {
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("이메일 인증 이메일 : " + email);
		return mailService.joinEmail(email);
	}
		
		
	//회원가입 
	@ResponseBody
	@RequestMapping("/memberJoin")
	public String memberJoin(@RequestParam("joinName")String name,@RequestParam("joinId")String id,@RequestParam("phoneNumber")String phonenumber,
							 @RequestParam("joinPasswordCheck")String password,@RequestParam("zipcode")String zipcode,
							 @RequestParam("address1")String address1,@RequestParam("address2")String address2,
							 @RequestParam("eMailId")String eMailId,@RequestParam("eMailDomain")String eMailDomain){
		
					String email = eMailId +"@"+eMailDomain;
					String passEncode = passwordEncoder.encode(password);
					
						Member member =new Member();
						member.setName(name);
						member.setId(id);
						member.setPassword(passEncode);
						member.setZipcode(zipcode);
						member.setAddress1(address1);
						member.setAddress2(address2);
						member.setEmail(email);
						
						memberService.joinMember(member);
		
		
		return "joinSuccess";
	}
	

	//아이디 찾기
	@ResponseBody
	@RequestMapping(value = "/userFindId", method = RequestMethod.POST)
	public String userFindId (@RequestBody Map<String, Object>param) {
		Map<String, Object> userfind = new HashMap<>();
		userfind.put("email", (String)param.get("email"));
		userfind.put("name", (String)param.get("name"));
	
	String findId =	memberService.userFindId(userfind);
	
	return findId;
	}
	
	//인증번호만
	@ResponseBody
	@RequestMapping(value = "/userFindCoed" ,method = RequestMethod.POST)
	public String userFindCoed(@RequestBody Map<String, Object> param){
	return 	mailService.findeMailCheck((String)param.get("email"));
	}
	
	
	//비밀번호 찾기
	@ResponseBody
	@RequestMapping(value = "/userFindPassword" ,method = RequestMethod.POST)
	public String userFindPassword(@RequestBody Map<String, Object> param) {
		String findEmailCheckCode ="";
		Map< String , Object> map =new HashMap<>();
		map.put("id", param.get("id"));
		map.put("email", param.get("email"));
		
		int memberCherck = memberService.userFindPassword(map);
		
		if(memberCherck == 1) {
			findEmailCheckCode = mailService.findeMailCheck((String) param.get("email"));
		}
		return findEmailCheckCode;
	}
	
	
	//새로운비밀번호
	@ResponseBody
	@RequestMapping(value = "/UserNewPassword",method = RequestMethod.POST)
	public int UserNewPassword(@RequestBody Map<String, Object> param) {
		Map<String, Object>newPassword = new HashMap<String, Object>();
		String password = passwordEncoder.encode((String)param.get("password"));
		newPassword.put("password", password);
		newPassword.put("id", param.get("id"));
	
		
		return memberService.userNewPassword(newPassword);
	}
	
	
}
