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
import com.finalproject.festival.manage.service.NoticeService;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	//공지사항 삭제
	@RequestMapping("/noticeDeleteProcess")
	public String deleteNotice(int noticeNo) {
	
		noticeService.deleteNotice(noticeNo);
		
		return "redirect:noticeMain";
	}
	
	
	//공지사항 수정
	@RequestMapping(value="/noticeUpdateProcess", method=RequestMethod.POST)
	public String updateNotice(Model model, Manage manage){

		noticeService.updateNotice(manage);

		return "redirect:noticeMain";		
	}
	
	//공지사항 수정
	@RequestMapping(value="/noticeUpdateProcess", method=RequestMethod.GET)
	public String updateNotice(Model model, int noticeNo,
			@RequestParam(required=false, defaultValue="1")
			int pageNum){
		
		
		Manage m = noticeService.getNotice(noticeNo);
		
		model.addAttribute("notice" , m );
		
		return "manage/notice/noticeUpdate";		
	}
	
	//공지사항 글쓰기
	@RequestMapping(value="/noticeWriteProcess" , method=RequestMethod.POST)
	public String noticeWrite (Manage m){
		
		noticeService.insertNotice(m);		
		
		return "redirect:noticeMain";
	}
	
	//공지사항 디테일
	@RequestMapping("/noticeDetail")
	public String getNotice (Model model, int noticeNo ) {
		
		Manage m = noticeService.getNotice(noticeNo);
		
		model.addAttribute("notice" , m);
		
		return "manage/notice/noticeDetail";
	}
	
	
	//공지사항 메인
	@RequestMapping (value="/noticeMain", method=RequestMethod.GET)
	public String noticeMain(Model model,
			@RequestParam(value="pageNum", required=false,
			defaultValue="1") int pageNum) {
		
		Map<String, Object> modelMap = noticeService.notice(pageNum);

		model.addAllAttributes(modelMap);
		
		return "manage/notice/noticeMain";
	}
		

}
