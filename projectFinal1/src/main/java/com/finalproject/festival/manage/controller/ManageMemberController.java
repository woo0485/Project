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
import com.finalproject.festival.domain.Member;
import com.finalproject.festival.manage.service.ManageMemberService;

@Controller
public class ManageMemberController {
	
	@Autowired
	private ManageMemberService manageMemberService;
	
	// 회원 관리 페이지 회원정보 삭제
	@RequestMapping("/deleteManageMemberProcess.ajax")
	public String deleteManageMember2(String id) {
		
		manageMemberService.deleteManageMember(id);
		
		return "redirect:manageMember";
	}
	
	// 회원 관리 페이지 회원정보 삭제
	@RequestMapping("/deleteManageMemberProcess")
	public String deleteManageMember(String id) {
		
		manageMemberService.deleteManageMember(id);
		
		return "redirect:manageMember";
	}
	
	// 회원 관리 페이지 회원정보 수정
	@RequestMapping(value="updateManageMemberProcess", method=RequestMethod.POST)
	public String updateManageMember(Model model, Member festival) {
		
		manageMemberService.updateManageMember(festival);
		
		return "redirect:manageMember";
	}
	
	// 회원 관리 페이지 회원정보 수정
	@RequestMapping(value="/manageMemberUpdate")
	public String updateManageMember(Model model, String id) {
		
		Member m = manageMemberService.getManageMember(id);
		
		model.addAttribute("member", m);
		
		return "manage/manageMemberUpdate";
	}
	
	// 회원 관리 페이지
	@RequestMapping("/manageMember")
	public String manageMember(Model model, 
			@RequestParam(value="pageNum", 
				required=false, defaultValue="1") int pageNum,
			@RequestParam(value="type",
				required=false, defaultValue="null") String type,
			@RequestParam(value="keyword",
				required=false, defaultValue="null") String keyword){
		
		Map<String, Object> modelMap = 
				manageMemberService.manageMember(pageNum, type, keyword);
		
	
		model.addAllAttributes(modelMap);
		
		return "manage/manageMember";
	}

}
