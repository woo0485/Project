package com.finalproject.festival.manage.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalproject.festival.domain.Reservation;

@Repository
public class ManageReservationDaoImpl implements ManageReservationDao {
	
	private static final String NAME_SPACE = "com.finalproject.festival.mapper.ManageReservationMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public int getBoardCount(String type, String keyword) {
		
		Map<String, String> params = new HashMap<>();
		params.put("type", type);
		params.put("keyword", keyword);	
		
		return sqlSession.selectOne(NAME_SPACE + ".getBoardCount", params);
	}

	@Override
	public List<Reservation> manageReservation(int start, int num, String type, String keyword) {
		
		Map<String, Object> params = new HashMap<>();
		params.put("start", start);
		params.put("num", num);
		params.put("type", type);
		params.put("keyword", keyword);
		
		return sqlSession.selectList(NAME_SPACE + ".manageReservation", params);
	}

	@Override
	public Reservation getManageReservation(int reservationno) {
		
		return sqlSession.selectOne(NAME_SPACE + ".getManageReservation", reservationno);
	}

	@Override
	public void updateManageReservation(Reservation reservation) {
		
		sqlSession.update(NAME_SPACE + ".updateManageReservation", reservation);
	}

	@Override
	public void deleteManageReservation(int reservationno) {
		
		sqlSession.delete(NAME_SPACE + ".deleteManageReservation", reservationno);
	}

}
