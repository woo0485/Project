package com.finalproject.festival.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalproject.festival.domain.Basket;

@Repository
public class BasketDaoImpl implements BasketDao {
	
private final String NAME_SPACE = "com.finalproject.festival.mapper.BasketMapper";
	
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}	

	@Override
	public List<Basket> basketList(int productno, int basketno, int basketproductcount, String id) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("productno", productno);
		params.put("basketno", basketno);
		params.put("basketproductcount", basketproductcount);
		params.put("id", id);
		
		return sqlSession.selectList(NAME_SPACE + ".basketList", params);
	}

}
