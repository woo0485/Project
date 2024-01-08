package com.finalproject.festival.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalproject.festival.domain.Product;

@Repository
public class FestivalMapDaoImpl implements FestivalMapDao {

    private final String NAME_SPACE = "com.finalproject.festival.mapper.FestivalMapMapper";
	
	@Autowired
	private SqlSessionTemplate st;
	
	@Override
	public List<Product> productList() {
		
		return st.selectList(NAME_SPACE + ".productList");
	}

	@Override
	public Map<String, Object> productArea() {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("seoul", st.selectList(NAME_SPACE + ".seoulList"));
		map.put("incheon", st.selectList(NAME_SPACE + ".incheonList"));
		map.put("gangwon", st.selectList(NAME_SPACE + ".gangwonList"));
		map.put("daejeon", st.selectList(NAME_SPACE + ".daejeonList"));
		map.put("daegu", st.selectList(NAME_SPACE + ".daeguList"));
		map.put("gwangju", st.selectList(NAME_SPACE + ".gwangjuList"));
		map.put("busan", st.selectList(NAME_SPACE + ".busanList"));
		map.put("jeju", st.selectList(NAME_SPACE + ".jejuList"));
		
		return map;
	}

}
