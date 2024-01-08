package com.finalproject.festival.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finalproject.festival.domain.Basket;
import com.finalproject.festival.domain.Reservation;

import com.finalproject.festival.service.ReservtionService;

@Controller
public class ReservationController {
	
	@Autowired
	private ReservtionService rs;
	
	public void setReservationService (ReservtionService rs) {
		this.rs = rs;
	}
	
	// 예약 테이블 단순히 보여지는 것 -1월 7일
	@RequestMapping(value = "reservation", method = RequestMethod.POST)
	public String reservationList(Model m,  
			@RequestParam(value = "id") String id,
			@RequestParam(value = "productno") int productno) {
		
		List<Map<String, Object>> reservationList = rs.reservationList(id, productno);
		
		System.out.println(reservationList.get(0).get(""));
		m.addAttribute("reservationList", reservationList);
	
		return "priceOrderFinish";
	}

	/*
	// 결제가 완료되면서 예약 테이블에 장바구니에 들어간 정보 insert 해주기 -1월 8일
	 @RequestMapping(value = "/addReservation", method = RequestMethod.POST)
	public String InsertReservation (
			HttpServletRequest request, 
			 @RequestParam(value = "reservationticketcount")  int reservationticketcount, 
			 @RequestParam(value = "productno") int productno, 
			 @RequestParam(value = "id") String id,
			 @RequestParam(value = "reservationprice") int reservationprice,
			 @RequestParam(value = "reservationdate") Timestamp reservationdate ) 	throws IOException {	
		
		Reservation r = new Reservation();
		r.setReservationticketcount(reservationticketcount);
		r.setProductno(productno);
		r.setId(id);
		r.setReservationprice(reservationprice);
		
		java.sql.Timestamp rt = java.sql.Timestamp.valueOf(request.getParameter("reservationdate"));
		r.setReservationdate(rt);
	
		
		System.out.println("reservation컨트롤러에서 insert에서 등록시간: " + request.getParameter("reservationdate"));
		rs.insertReservation(r);
		
		return "redirect:priceOrderFinish";
	}
	*/
	/*@RequestMapping(value = "/addReservationAndRedirect", method = RequestMethod.POST)
	@ResponseBody
	public String insertReservationAndRedirect(
	        HttpServletRequest request,
	        @RequestParam(value = "reservationticketcount") int reservationticketcount,
	        @RequestParam(value = "productno") int productno,
	        @RequestParam(value = "id") String id,
	        @RequestParam(value = "reservationprice") int reservationprice,
	        @RequestParam(value = "reservationdate") Timestamp reservationdate) throws IOException {

	    Reservation r = new Reservation();
	    r.setReservationticketcount(reservationticketcount);
	    r.setProductno(productno);
	    r.setId(id);
	    r.setReservationprice(reservationprice);

	    java.sql.Timestamp rt = java.sql.Timestamp.valueOf(request.getParameter("reservationdate"));
	    r.setReservationdate(rt);

	    try {
	        // reservation 테이블에 데이터 INSERT
	        rs.insertReservation(r);

	        // 여기서 priceOrderFinish.jsp로 전달할 데이터를 저장하거나 전달하는 로직 추가
	        // ...

	        // 예약 성공시 "success" 문자열을 반환
	        return "success";
	    } catch (Exception e) {
	        e.printStackTrace();
	        // 예약 실패시 "fail" 문자열을 반환
	        return "fail";
	    }
	}
	 * 
	 */
	
}
