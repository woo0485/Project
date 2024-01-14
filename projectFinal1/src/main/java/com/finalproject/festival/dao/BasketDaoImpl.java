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

// 장바구니 전체 금액 가져오기
public Integer getBasketTotalPrice(String id) {
	return sqlSession.selectOne(NAME_SPACE + ".getBasketTotalPrice", id);
}

// 회원 장바구니 목록보기 - 1월 3일 추가
@Override
public List<Basket>  basketList(String id) {
	
	return sqlSession.selectList(NAME_SPACE + ".basketList", id);
}

/*
//장바구니 확인 - 1월 3일
@Override
public Basket checkBasket(Basket b) {
	return sqlSession.selectOne(NAME_SPACE + ".checkBasket", b);
} */

////////////////////// 여기서부터는 productno 중복되는지 확인해서 장바구니에 넣기 ////////////////////////
@Override
public void insertBasket(Basket b) {
	sqlSession.insert(NAME_SPACE + ".insertBasket", b);
}

@Override
public boolean isDupBasketCheck(int productno, String id) {
    Map<String, Object> paramMap = new HashMap<>();
    paramMap.put("productno", productno);
    paramMap.put("id", id);

    int count = sqlSession.selectOne(NAME_SPACE + ".isDupBasketCheck", paramMap);
   // productno가 존재하면 >0 이고 true 없으면 false
    System.out.println("basketdao에서 productno가 있는지 boolean 타입으로 확인하기 count가 0 이상이면 productno가 존재하는 것 : " + count);
    return count  > 0;
}

// 장바구니 추가 할 때 기존에 장바구니에 있는 상품 수량 수정
@Override
public void updateBasketProductCount(Basket b) {
	sqlSession.update(NAME_SPACE + ".updateBasketProductCount", b);	
}
//////////////////여기서부터는 productno 중복되는지 확인해서 장바구니에 넣기 끝 ////////////////

//////////// 여기서부터는 장바구니 내에서 상품 수량 변경 및 삭제 및 전체 삭제 /////////////////////////////
@Override
public void updateBasketProductNoCount(Map<String, Object> param) {	
	sqlSession.update(NAME_SPACE + ".updateBasketProductNoCount", param);
}

//#### id에 해당하는 productno 하나하나 삭제하기
@Override
public void deleteBasketProductno (int productNo, String id) {
	Map<String, Object> map = new HashMap<String, Object>();
	map.put("productNo", productNo);
	map.put("id", id);
	
	sqlSession.delete(NAME_SPACE + ".deleteBasketProductno", map);
}

@Override
public void deleteBasketAll(String id) {
	sqlSession.delete(NAME_SPACE + ".deleteBasketAll", id);
}

//주문 가능 수량 가져오기
@Override
public Integer getProductRemainingAmount(int productNo) {
	return sqlSession.selectOne(NAME_SPACE + ".getProductRemainingAmount", productNo);
}

////////////////////////////////////////////////////////////////////////////////////////
//장바구니 삭제 - 1월 5일
/*
@Override
public void deleteBasket(int basketno, String id) {
	
	Map<String, Object> map = new HashMap<String, Object>();
	map.put("id", id);
	map.put("basketno", basketno);
	
	sqlSession.insert(NAME_SPACE + ".deleteBasket", map);
	}
	*/
}