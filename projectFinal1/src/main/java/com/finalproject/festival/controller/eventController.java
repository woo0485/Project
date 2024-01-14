package com.finalproject.festival.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.finalproject.festival.domain.Event;
import com.finalproject.festival.service.EventService;

@Controller
public class eventController {
	
	@Autowired
	EventService es;
	
	@RequestMapping("/event")
	public String event (String eventType, Model m) {
		
		LocalDate currentDate = LocalDate.now();
		
		List<Event> futureEvent = new ArrayList<Event>();
		List<Event> currentEvent = new ArrayList<Event>();
		List<Event> pastEvent = new ArrayList<Event>();
		
		
		for( Event event : es.event() ) {
			
			if( currentDate.isAfter(event.getEventclosedate()) ) {
				pastEvent.add(event);
			} else if( currentDate.isBefore(event.getEventopendate()) ){
				futureEvent.add(event);
			} else {
				currentEvent.add(event);
			}
	
		}
		
		m.addAttribute("currentEventList", currentEvent);
		m.addAttribute("pastEventList", pastEvent);
		m.addAttribute("eventType", eventType);
		
		return "event";
		
	}

	
	@RequestMapping("/randomBoxEvent")
	public String randomBoxEvent () {
		
		return "randomBoxEvent";
		
	}
	
	@RequestMapping("/eventWriteForm")
	public String eventWriteForm () {
		
		return "eventWriteForm";
		
	}
	
	@RequestMapping(value = "/eventUpload", method = RequestMethod.POST)
	public String eventUpload (@RequestParam("image") MultipartFile eventimage, @RequestParam("closedate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate eventclosedate, @RequestParam("opendate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate eventopendate, Event event, HttpServletRequest request) {
		
		String realPath = request.getServletContext().getRealPath("/resources/upload");
		
		String fileName = UUID.randomUUID().toString() + eventimage.getOriginalFilename().substring(eventimage.getOriginalFilename().length() - 4, eventimage.getOriginalFilename().length());;
		
		String filePath = realPath + java.io.File.separator;
		
		try {
			eventimage.transferTo(new java.io.File(filePath + fileName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		event.setEventimage(fileName);
		event.setEventclosedate(eventclosedate);
		event.setEventopendate(eventopendate);
		
		es.eventUpload(event);
		
		return "redirect:event?eventType=Proceeding";
	}
	
	@RequestMapping("/pastEvent")
	public String pastEvent (@RequestParam("eventno") int eventno, Model model) {
		
	    model.addAttribute("pastEvent",es.eventDetail(eventno));
		
		return "pastEvent";
		
	}
	
	@RequestMapping("/currentEvent")
	public String currentEvent (@RequestParam("eventno") int eventno, Model model, @RequestParam("eventtitle") String eventtitle) {
		
		if( eventtitle.equals("신규회원가입 이벤트") ) {
			model.addAttribute("currentEvent",es.eventDetail(eventno));
			
			return "newSignupEvent";
		} else if ( eventtitle.equals("복주머니를 찾아라!") ) {
			model.addAttribute("currentEvent",es.eventDetail(eventno));
			
			return "luckyBagEvent";
		} else if ( eventtitle.equals("LUCKY DRAW") ) {
			model.addAttribute("currentEvent",es.eventDetail(eventno));
			model.addAttribute("idList",es.eventPresentConditionIdList(eventno));
			return "luckyDraw";
		}
		
	    model.addAttribute("currentEvent",es.eventDetail(eventno));
		
		return "currentEvent";
		
	}
	
	@RequestMapping(value = "/eventPresentCondition", method = RequestMethod.POST)
	public String eventPresentCondition ( String id, int eventno, String eventtitle ) {
		
		es.eventPresentCondition(id, eventno);
		
		return "redirect:currentEvent?eventtitle=" + eventtitle + "&eventno=" + eventno;
	}
	
	@RequestMapping(value = "/eventCoupon", method = RequestMethod.POST)
	@ResponseBody
	public String eventCoupon (int couponno, String id) {
		
		es.eventCoupon(id, couponno);
		
		return "success";
		
	}


}
