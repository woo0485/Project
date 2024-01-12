package com.finalproject.festival.service;

import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.festival.dao.ProductDao;
import com.finalproject.festival.dao.ReservationDao;
import com.finalproject.festival.domain.Reservation;

@Service
public class ReservationServiceImpl implements ReservtionService {
	
	@Autowired
	private ReservationDao RD;
	
	public void setReservationDao(ReservationDao rd) {
		this.RD = rd;
	}
	
	@Autowired
	private ProductDao PD;

	public void setProductDao(ProductDao pd) {
		this.PD = pd;
	}


/////////////////////     결제 진행되면서 동시에 실행되어야할 것들      ////////////////////////////
	// Reservation 테이블에서 id에 해당하는 productno를 가져오고 product에서 price를 가져와서 장바구니의 product의 개수랑 곱해줘서 넣어주는 거까지 가져오는 거
	@Override
	public List<Reservation> BasketListByIdByProductno (String id, Reservation r) {
		System.out.println("reservationService에서 Reservation" + r);
		
		// 1) insert reservation 테이블 하기
		// 시간 조정하기
		//LocalDateTime reservationDate = LocalDateTime.now(ZoneOffset.UTC).plusHours(9);
	//	r.setReservationdate(reservationDate);
		RD.insertReservation(id);
		
		// 2) delete basket 하기 
		RD.deleteBasket(id);
		
		// 3) Product 테이블 남은 티켓 수- 결제된 티켓 수 => 이건 컨트롤러에서 처리해주자~~!!!!!!

		//4) Reservation 테이블에서 id에 해당하는 정보 전부 select 하기
		return RD.myReservation(id);

	}
	

	/////////////////////////////////////////////////////////////////////////////////////////////////////////

	@Override
	public List<Map<String, Object>> reservationList(String id, int productno) {
		return RD.reservationList(id, productno);
	}

	/*
	@Override
	public List<Reservation> reservationList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> RreservationList() {
		// TODO Auto-generated method stub
		return null;
	}
*/
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// id에 해당하는 예약 테이블 정보 전부 조회 - 1월 7일
	/*
	@Override
	public List<Integer> reservationList(String id) {
		return RD.reservationList(id);
	}
	*/

	/*
	// 장바구니에 담긴 정보를 예약 테이블에 저장 -1월 6일
	@Override
	public void insertReservations(String id, List<Integer> productnos, int reservationprice,
			int reservationticketcount, int totalReservationPrice, int salesTotalPrice) {
		RD.insertReservation(id);
	}
	*/
}
