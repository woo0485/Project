package com.finalproject.festival.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalproject.festival.domain.Basket;
import com.finalproject.festival.domain.Reservation;

@Repository
public class ReservationDaoImpl implements ReservationDao {

	private final String NAME_SPACE = "com.finalproject.festival.mapper.ReservationMapper";
	
	private SqlSessionTemplate sqlSession;

	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}	
	
	@Override
	public void insertReservation(String id) {
		sqlSession.insert(NAME_SPACE + ".insertReservation", id);
	}
		
	public void updateProductRemainTicketCount(int productNo, int basketProductCount) {
		Map<String, Object> map = new HashMap<>();
		map.put("productNo", productNo);
		map.put("basketProductCount", basketProductCount);		
		sqlSession.update(NAME_SPACE + ".updateProductRemainTicketCount", map);
	}	

	// 1월 12일) 결제진행되면서 Member에 totalpay update해주는 것
	@Override
	public void updateMemberTotalPay(String id, int totalPrice) {
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("totalPrice",totalPrice);
		
		 sqlSession.update(NAME_SPACE + ".updateMemberTotalpay",map);
	}
	
	// 단순히 예약테이블에서 보여지는 것
	@Override
	public List<Reservation> reservationList(String id) {
		return  sqlSession.selectList(NAME_SPACE + ".reservationList", id);
	}

	@Override
	public List<Reservation> myReservation(String id) {
		return  sqlSession.selectList(NAME_SPACE + ".reservationList",id);
	}


}
