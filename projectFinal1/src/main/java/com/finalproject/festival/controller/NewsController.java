package com.finalproject.festival.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.finalproject.festival.service.NewsService;

@Controller
public class NewsController {
	
	@Autowired
	NewsService ns;
	
	@RequestMapping("/news")//기사페이지
	public String news(Model m) {
		
		m.addAttribute("newsList",ns.newslist());
		
		return "news";
	}
	
	@RequestMapping("/newsdetail")
	public String newsdatail(@RequestParam("no") int no, Model m) {
		
		m.addAttribute("newsdetail", ns.newsdetail(no));
		
		return "newsdetail";
	}

}
