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
import com.finalproject.festival.domain.Product;
import com.finalproject.festival.domain.Reservation;
import com.finalproject.festival.service.ProductService;
import com.finalproject.festival.service.ReservtionService;

@Controller
public class ReservationController {
	
	@Autowired
	private ReservtionService rs;
	
	public void setReservationService (ReservtionService rs) {
		this.rs = rs;
	}
	
	@Autowired
	private ProductService sv;
	
	public void setProductService(ProductService sv) {
		this.sv = sv;
	}
	
	// @@@@@@@@ 결제가 완료되면서 예약 테이블에 장바구니에 들어간 정보 insert 해주기 -1월 8일 @@@@@@@@@@@
	// insert와 동시에 select가 이루어지기 => 컨트롤러에서틑 ajax 매핑 1개로 하고 service에서 처리해주기
	// 3) Product 테이블 남은 티켓 수- 결제된 티켓 수 => 이건 컨트롤러에서 처리해주자~~!!!!!!
	// 1월 10일 수정함
	 @RequestMapping(value = "/insertReservation", method = RequestMethod.POST)
	 @ResponseBody
	public String InsertReservation (
			HttpServletRequest request, 
			 @RequestParam(value = "id") String id,
			 // 여기서부터는 (( productno에 해당하는 productremainticketcount )) - basketproductcount 해준다.
			 @RequestParam(value = "productNo") int productNo,
			 @RequestParam(value = "productremainticketcount") int productremainticketcount
			) throws IOException {	

		 try {
			 Reservation re = new Reservation();
			 re.setId(id);
		
			 // 1) Reservation에 insert
			 // 2) ShoppingBasket에 delete
			 // 3) Reservation에서 select
			 rs.BasketListByIdByProductno(id, re);

			 /////////////////////////////////////////////////////////////////////////////////////////
			 // 여기서부터는 결제되면서 product의 남은 티켓 수에서  장바구니의 티켓수만큼 빼주는 것
		 Product p = new Product();
		 p.setProductno(productNo);
		 p.setProductremainticketcount(productremainticketcount);
		 System.out.println("담고나서 productno: " + productNo );
		 System.out.println("담고 나서 남은 티켓 수: " + productremainticketcount);
			 
		 sv.updateProductRemainTicketCount(productNo, productremainticketcount);
	
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
					@RequestParam(value = "productNo") int productNo) {
				
				List<Map<String, Object>> reservationList = rs.reservationList(id, productNo);
				
				System.out.println("reservationSuccess 에서 priceRedirect로 보낼 때 : " +reservationList.get(0).get(""));
				m.addAttribute("reservationList", reservationList);
			
				return "priceRedirect";
			}
			
}
	 
