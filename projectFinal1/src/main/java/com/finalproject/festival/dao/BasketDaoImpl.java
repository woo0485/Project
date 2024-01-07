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

////////////////////// 여기서부터는 productno 중복되는지 확인해서 장바구니에 넣기 ////////////////////////
@Override
public void insertBasket(Basket b) {
	sqlSession.insert(NAME_SPACE + ".insertBasket", b);
}

// 회원 장바구니에 productno가 중복되었는지 확인함 - 1월 5일
/*
@Override
public boolean isDupBasketCheck(int productno, String id) {
	
	boolean result = true;
	
	// isDupBasketCheck 맵핑 구문을 호출하면서 productno를 파라미터로 지정한다.
	String dbProductNO = sqlSession.selectOne(NAME_SPACE + ".isDupBasketCheck",productno);
	
	// productno가 존재한다면 false를 반환한다. => 새로 담기
	// productno가 존재하지 않으면 true를 반환해서 basketproductcount를 증가시킨다.
	if(!dbProductNO.isEmpty()) {  //  productno가 존재하면 수량만 증가하기
		result = false;
	} else { //  productno가 존재하지 않으면 새로 담기
		result = true;
	}
	return result;
	}
*/

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

@Override
public void updateBasketProductCount(Basket b) {
	Map<String, Object> map = new HashMap<String, Object>();
	map.put("id", b.getId());
	map.put("productno", b.getProductno());
	map.put("basketproductcount", b.getBasketproductcount());
	
	System.out.println("basketdao 에서 updateBasketProductCount-  id : " +b.getId() );
	System.out.println("basketdao 에서 updateBasketProductCount- productno : " + b.getProductno());
	System.out.println("basketdao 에서 updateBasketProductCount - basketproductcount : " + b.getBasketproductcount());
	
	sqlSession.update(NAME_SPACE + ".updateBasketProductCount",map);
	
}
//////////////////여기서부터는 productno 중복되는지 확인해서 장바구니에 넣기 끝 ////////////////






//장바구니 삭제 - 1월 5일
@Override
public void deleteBasket(int basketno, String id) {
	
	Map<String, Object> map = new HashMap<String, Object>();
	map.put("id", id);
	map.put("basketno", basketno);
	
	sqlSession.insert(NAME_SPACE + ".deleteBasket", map);
	}
}