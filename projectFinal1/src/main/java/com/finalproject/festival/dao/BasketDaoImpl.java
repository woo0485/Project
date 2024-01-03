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

//@Override
/*public List<Basket> basketList(int productno, int basketno, int basketproductcount, String id) {
	Map<String, Object> params = new HashMap<String, Object>();
	params.put("productno", productno);
	params.put("basketno", basketno);
	params.put("basketproductcount", basketproductcount);
	params.put("id", id);
	
	return sqlSession.selectList(NAME_SPACE + ".basketList", params);
}
*/

// 회원 장바구니 목록보기 - 1월 3일 추가
@Override
public List<Map<String,Object>> basketList(String id, int productno) {
	
	Map<String, Object> map = new HashMap<>();
	map.put("id", id);
	map.put("productno",productno);
	
	return sqlSession.selectList(NAME_SPACE + ".basketList",map);
}

/*
//장바구니 확인 - 1월 3일
@Override
public Basket checkBasket(Basket b) {
	return sqlSession.selectOne(NAME_SPACE + ".checkBasket", b);
} */

@Override
public void insertBasket(Basket b) {
	sqlSession.insert(NAME_SPACE + ".insertBasket", b);
}

}
