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
	
	// 결제가 완료되면서 예약 테이블에 장바구니에 들어간 정보 insert 해주기 -1월 8일
	// insert와 동시에 select가 이루어지기 => 컨트롤러에서틑 ajax 매핑 1개로 하고 service에서 처리해주기
	 @RequestMapping(value = "/insertReservation", method = RequestMethod.POST)
	 @ResponseBody
	public String InsertReservation (
			HttpServletRequest request, 
			 @RequestParam(value = "id") String id )throws IOException {	
	
	//	 System.out.println("reservationController에서 productno" + productno);
		
		 try {
			 Reservation re = new Reservation();
			 re.setId(id);
			
			 System.out.println("insertReservation 에서 :" + re.getId());
			 System.out.println("insertReservation 에서 :" + re.getProductno());
			 System.out.println("insertReservation 에서 :" + re.getReservationprice());
			 System.out.println("insertReservation 에서 :" + re.getReservationticketcount());
			 
			 // 1) Reservation에 insert
			 // 2) ShoppingBasket에 delete
			 // 3) Reservation에서 select
			 rs.BasketListByIdByProductno(id, re);
			 
			 // insert하면서 동시에 select 하는 Service - 1월 9일
			// rs.BasketListByIdByProductno(id, re);
	
			 return "success";
			// return "redirect:/priceOrderFinish.jsp";
			 
		 } catch (Exception e) {
			e.printStackTrace();
			
		}
		 return "main" ;
	 }
		 
		 // 들어온 거 확인 다른페이지로 연동 - 거쳐서 가는 컨트롤러
			@RequestMapping(value = "/reservationSucess", method = RequestMethod.GET)
			public String reservationSucess  (Model m,  
					@RequestParam(value = "id") String id,
					@RequestParam(value = "productno") int productno) {
				
				List<Map<String, Object>> reservationList = rs.reservationList(id, productno);
				
				System.out.println("reservationSuccess 에서 priceRedirect로 보낼 때 : " +reservationList.get(0).get(""));
				m.addAttribute("reservationList", reservationList);
			
				return "priceRedirect";
			}
			
}
	 
