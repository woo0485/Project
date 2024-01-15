package com.finalproject.festival.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finalproject.festival.dao.ReservationDao;
import com.finalproject.festival.domain.Reservation;
import com.finalproject.festival.service.ProductService;
import com.finalproject.festival.service.ReservationService;

@Controller
public class ReservationController {
	
	@Autowired
	private ReservationService rs;
	
	public void setReservationService (ReservationService rs) {
		this.rs = rs;
	}
	
	@Autowired
	private ProductService sv;
	
	public void setProductService(ProductService sv) {
		this.sv = sv;
	}
	
	@Autowired
	private ReservationDao RD;
	
	public void setReservationDao(ReservationDao rd) {
		this.RD = rd;
	}
	
	// 부트페이 결제가 완료되면 Ajax로 요청이 들어오는 메서드
	@RequestMapping(value = "/insertReservation", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> InsertReservation (HttpSession session, 
			@RequestParam(value="basketTotalPrice") int basketTotalPrice) throws IOException {
		 
		// 아래에서 호출한 서비스 메서드에서 다음 작업 진행
		// 1. ShoppingBasket 테이블에서 읽어와서 Reservation 테이블에 추가한다.
		// 2. ShoppingBasket 테이블에 있는 상품의 수량 만큼 Product 테이블의 productremainticketcount에서 차감한다.
		// 3. Member 테이블의 totalpay 컬럼에 현재 주문한 전체 금액을 누적한다.
		// 4. 임시로 장바구니 데이터를 세션에 저장 - 현재 주문 내용을 DB 테이블이 가져와서
		// 		주문 완료 화면에 출력해야 하지만 가져올 수 없기 때문에 임시 방편으로 세션에 저장해 사용한다.
		//      서비스에서  처리하기 위해서 HttpSession 객체를 넘겨 준다.
		// 5. ShoppingBasket 테이블에서 id에 해당하는 상품을 삭제한다.
		rs.fromBasketToReservation(session);

		// 응답 데이터
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", true);

		return resultMap;
	}
		 
	 
	 // 위쪽의 부트페이 주문 결제가 완료되면 이쪽으로 요청이 들어온다.
	@RequestMapping(value = "/reservationSucess", method = RequestMethod.GET)
	public String reservationSucess  () {
		// 필요한 데이터는 이미 세션에 저장되어 있으므로 모델은 필요 없음
		return "priceOrderFinish";
	}
}
	 
