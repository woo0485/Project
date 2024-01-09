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
public class ReservationImpl implements ReservationDao {

	private final String NAME_SPACE = "com.finalproject.festival.mapper.ReservationMapper";
	
	private SqlSessionTemplate sqlSession;

	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// Reservation 테이블에서 id에 해당하는 productno를 가져오고 product에서 price를 가져와서 장바구니의 product의 개수랑 곱해줘서 넣어주는 거까지 가져오는 거
	@Override
	public List<Reservation> BasketListByIdByProductno(String id) {
		System.out.println("ReservationDao에서 id : " + id);
		return sqlSession.selectList(NAME_SPACE + ".BasketListByIdByProductno", id);
	}
	
	@Override
	public void insertReservation(String id) {
		sqlSession.selectList(NAME_SPACE + ".insertReservation", id);
	}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
	// 단순히 예약테이블에서 보여지는 것
	@Override
	public List<Map<String, Object>> reservationList(String id, int productno) {
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("productno",productno);
		
		return sqlSession.selectList(NAME_SPACE + ".reservationList",map);
	}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*
	@Override
	public List<Reservation> reservationList(String id, int productno) {
	
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("productno", productno);
				
		return sqlSession.selectList(NAME_SPACE + ".reservationList", map);
	}
*/
}
