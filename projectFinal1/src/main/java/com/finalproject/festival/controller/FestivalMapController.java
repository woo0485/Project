package com.finalproject.festival.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.finalproject.festival.service.FestivalMapService;

@Controller
public class FestivalMapController {

	@Autowired
	FestivalMapService fs;

	@RequestMapping("/festivalMap")
	public String festivalMap(Model m) {

		ObjectMapper objectMapper = new ObjectMapper();
		
		String json = null;
		
		try {
			json = objectMapper.writeValueAsString(fs.productList());
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		m.addAttribute("festivalMap", json);

		m.addAttribute("festivalMapSize", fs.productList().size());
		
		m.addAttribute("festivalProduct", fs.productList());
		
		m.addAttribute("fesivalAreaProduct", fs.productArea());

		return "festivalMap";
	}

}
