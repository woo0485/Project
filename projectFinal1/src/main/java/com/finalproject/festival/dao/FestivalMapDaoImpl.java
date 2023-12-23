package com.finalproject.festival.dao;

import java.util.List;

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

}
