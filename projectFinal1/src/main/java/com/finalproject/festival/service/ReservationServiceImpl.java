package com.finalproject.festival.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.festival.dao.ReservationDao;
import com.finalproject.festival.domain.Reservation;

@Service
public class ReservationServiceImpl implements ReservtionService {
	
	@Autowired
	private ReservationDao RD;
	
	public void setReservationDao(ReservationDao rd) {
		this.RD = rd;
	}


	// Reservation 테이블에서 id에 해당하는 productno를 가져오고 product에서 price를 가져와서 장바구니의 product의 개수랑 곱해줘서 넣어주는 거까지 가져오는 거
	@Override
	public List<Reservation> BasketListByIdByProductno (String id, Reservation r) {
		System.out.println("reservationService에서 Reservation" + r);
		
	//	RD.insertReservation();
		
		// Basket에서 id에 해당하는 product 정보 가져오기
	List<Reservation> reservationDATA = RD.BasketListByIdByProductno(id);
			
		
		// 1) insert하기
	/*
		for (int i=0; i < reservationDATA.size() ;  i++) {
			//Reservation rr = reservationDATA.get(i);
			//reservationDATA.set(i, r.getId());
		//	insertReservations.set(i, r);
			reservationDATA.set(i, r);
		//	RD.insertReservation(r);
			
		System.out.println("BasketListByIdByProductno에서의 insert :" + r);
		}
		*/
		//2) select 하기
		List<Reservation> reservationList01 = RD.BasketListByIdByProductno(id);
		System.out.println("BasketListByIdByProductno에서의 select" + reservationList01.get(0));
		return RD.BasketListByIdByProductno(id);

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
