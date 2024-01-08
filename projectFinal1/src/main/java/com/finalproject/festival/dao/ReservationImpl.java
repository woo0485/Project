package com.finalproject.festival.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReservationImpl implements ReservationDao {

	private final String NAME_SPACE = "com.finalproject.festival.mapper.ReservationMapper";
	
	private SqlSessionTemplate sqlSession;

	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<Map<String, Object>> reservationList(String id, int productno) {
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("productno",productno);
		
		return sqlSession.selectList(NAME_SPACE + ".reservationList",map);
	}

}
