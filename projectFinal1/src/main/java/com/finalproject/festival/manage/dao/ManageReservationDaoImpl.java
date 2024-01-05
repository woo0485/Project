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
	

	
	// 12월 매출
	@Override
	public List<Reservation> saleTotalPrice12(){
		
		return sqlSession.selectList(NAME_SPACE + ".saleTotalPrice12");
	}
	
	// 11월 매출
	@Override
	public List<Reservation> saleTotalPrice11(){
		
		return sqlSession.selectList(NAME_SPACE + ".saleTotalPrice11");
	}
	
	// 10월 매출
	@Override
	public List<Reservation> saleTotalPrice10(){
		
		return sqlSession.selectList(NAME_SPACE + ".saleTotalPrice10");
	}
	
	// 9월 매출
	@Override
	public List<Reservation> saleTotalPrice9(){
		
		return sqlSession.selectList(NAME_SPACE + ".saleTotalPrice9");
	}
	
	// 8월 매출
	@Override
	public List<Reservation> saleTotalPrice8(){
		
		return sqlSession.selectList(NAME_SPACE + ".saleTotalPrice8");
	}
	
	// 7월 매출
	@Override
	public List<Reservation> saleTotalPrice7(){
		
		return sqlSession.selectList(NAME_SPACE + ".saleTotalPrice7");
	}
	
	// 6월 매출
	@Override
	public List<Reservation> saleTotalPrice6(){
		
		return sqlSession.selectList(NAME_SPACE + ".saleTotalPrice6");
	}
	
	// 5월 매출
	@Override
	public List<Reservation> saleTotalPrice5(){
		
		return sqlSession.selectList(NAME_SPACE + ".saleTotalPrice5");
	}
	
	// 4월 매출
	@Override
	public List<Reservation> saleTotalPrice4(){
		
		return sqlSession.selectList(NAME_SPACE + ".saleTotalPrice4");
	}
	
	// 3월 매출
	@Override
	public List<Reservation> saleTotalPrice3(){
		
		return sqlSession.selectList(NAME_SPACE + ".saleTotalPrice3");
	}

	// 2월 매출
	@Override
	public List<Reservation> saleTotalPrice2(){
		
		return sqlSession.selectList(NAME_SPACE + ".saleTotalPrice2");
	}
	
	// 1월 매출
	@Override
	public List<Reservation> saleTotalPrice1(){
		
		return sqlSession.selectList(NAME_SPACE + ".saleTotalPrice1");
	}
	
	//일 매출 베스트
	@Override
	public List<Reservation> bestDayManageReservation(){
		
		return sqlSession.selectList(NAME_SPACE + ".bestDayManageReservation");
	}
	
	// 일 매출 카운트
	public int getDateCount(String type, String keyword) {
		
		Map<String, String> params = new HashMap<>();
		params.put("type", type);
		params.put("keyword", keyword);	
		
		return sqlSession.selectOne(NAME_SPACE + ".getDateCount", params);
	}
	
	// 일 매출
	@Override
	public List<Reservation> manageReservation2(int start, int num, String type, String keyword){
		
		Map<String, Object> params = new HashMap<>();
		params.put("start", start);
		params.put("num", num);
		params.put("type", type);
		params.put("keyword", keyword);
		
		return sqlSession.selectList(NAME_SPACE + ".manageReservation2", params);
	}

	
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
