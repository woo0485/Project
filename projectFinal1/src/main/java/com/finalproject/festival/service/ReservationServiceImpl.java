package com.finalproject.festival.service;

import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.festival.dao.BasketDao;
import com.finalproject.festival.dao.ProductDao;
import com.finalproject.festival.dao.ReservationDao;
import com.finalproject.festival.domain.Basket;
import com.finalproject.festival.domain.Product;
import com.finalproject.festival.domain.Reservation;

@Service
public class ReservationServiceImpl implements ReservationService {
	
	@Autowired
	private ReservationDao RD;
	
	@Autowired
	private BasketDao BD;

	@Override
	public void fromBasketToReservation(HttpSession session) {
				
		// 세션에서 회원 아이디를 읽어온다.
		String id = (String) session.getAttribute("id");
		
		// 1. ShoppingBasket 테이블에서 읽어와서 Reservation 테이블에 추가한다.
		// 2. ShoppingBasket 테이블에 있는 상품의 수량 만큼 Product 테이블의 productremainticketcount에서 차감한다.
		List<Basket> basketList = BD.basketList(id);
		System.out.println("fromBasketToReservation(HttpSession session)");
		System.out.println("basketList.size() : " + basketList.size());
		
		// 장바구니 테이블의 데이터를 주문 테이블에 추가
		RD.insertReservation(id);
		for(Basket basket : basketList) {
			// 상품의 남은 수량을 주문한 수량 만큼 차감해 업데이트
			RD.updateProductRemainTicketCount(basket.getProductNo(), basket.getBasketProductCount());
		}
		
		// 3. Member 테이블의 totalpay 컬럼에 현재 주문한 전체 금액을 누적한다.
		int totalPay = BD.getBasketTotalPrice(id);
		RD.updateMemberTotalPay(id, totalPay);
		
		// 4. 임시로 장바구니 데이터를 세션에 저장 - 현재 주문 내용을 DB 테이블이 가져와서
		// 		주문 완료 화면에 출력해야 하지만 가져올 수 없기 때문에 임시 방편으로 세션에 저장해 사용한다.
		//      서비스에서  처리하기 위해서 HttpSession 객체를 넘겨 받아서 필요한 데이터를 세션에 저장한다.
		session.setAttribute("basketList", basketList);
		session.setAttribute("basketTotalPrice", BD.getBasketTotalPrice(id));
				
		// 5. ShoppingBasket 테이블에서 id에 해당하는 상품을 삭제한다.
		BD.deleteBasketAll(id);
	}
	/////////////////////////////////////////////////////////////////////////////////////////////////////////

	@Override
	public List<Reservation> reservationList(String id) {
		return RD.reservationList(id);
	}
}
