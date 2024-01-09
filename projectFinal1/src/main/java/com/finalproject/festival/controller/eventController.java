package com.finalproject.festival.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class eventController {
	
	@RequestMapping("/event")
	public String event () {
		
		return "event";
		
	}

}
