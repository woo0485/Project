package com.finalproject.festival.manage.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finalproject.festival.domain.Reservation;
import com.finalproject.festival.manage.service.ManageReservationService;

@Controller
public class ManageReservationController {
	
	@Autowired
	private ManageReservationService manageReservationService;
	
	
	// 예약 관리 페이지 예약정보 삭제
	@RequestMapping("/deleteManageReservation.ajax")
	public String deleteManageReservation2(int reservationno) {
		
		manageReservationService.deleteManageReservation(reservationno);
		
		return "manage/manageReservationUpdate";
	}
		
	// 예약 관리 페이지 예약정보 삭제
	@RequestMapping("/deleteManageReservation")
	public String deleteManageReservation(int reservationno) {
		
		manageReservationService.deleteManageReservation(reservationno);
		
		return "redirect:manageReservation";
	}	
	
	// 예약 관리 페이지 예약정보 수정
	@RequestMapping(value={"/updateManageReservationProcess"}, method = RequestMethod.POST)
	public String updateManageReservation (Reservation reservation) {
		
		manageReservationService.updateManageReservation(reservation); 
	
		return "redirect:manageReservation";
	}
	
	// 예약 관리 페이지 예약정보 수정
	@RequestMapping("/updateManageReservation")
	public String updateManageReservation(Model model, int reservationno) {
		
		Reservation reservation = manageReservationService.getManageReservation(reservationno);
		
		model.addAttribute("reservation", reservation);		
		
		return "manage/manageReservationUpdate";
	}
	
	// 예약 관리 페이지  
	@RequestMapping("/manageReservation")
	public String manageReservation(Model model, 
			@RequestParam(value="pageNum", 
				required=false, defaultValue="1") int pageNum,
			@RequestParam(value="type",
				required=false, defaultValue="null") String type,
			@RequestParam(value="keyword",
				required=false, defaultValue="null") String keyword) {
		
		Map<String, Object> modelMap = 
				manageReservationService.manageReservation(pageNum, type, keyword);
		
		model.addAllAttributes(modelMap);
				
		return "manage/manageReservation";
	}
	
}
