package com.finalproject.festival.manage.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalproject.festival.domain.Product;

@Repository
public class ManageFestivalProductDaoImpl implements ManageFestivalProductDao {
	
	private static final String NAME_SPACE = "com.finalproject.festival.mapper.ManageFestivalProductMapper";
	
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
	public List<Product> manageFestivalProduct(int start, int num, String type, String keyword) {
		
		Map<String, Object> params = new HashMap<>();
		params.put("start", start);
		params.put("num", num);
		params.put("type", type);
		params.put("keyword", keyword);

		return sqlSession.selectList(NAME_SPACE + ".manageFestivalProduct", params);
	}

	@Override
	public Product getManageFestivalProduct(int productno) {
		
		return sqlSession.selectOne(NAME_SPACE +".getManageFestivalProduct", productno);
	}

	@Override
	public void updateManageFestivalProduct(Product product) {
		
		sqlSession.update(NAME_SPACE +".updateManageFestivalProduct", product);
	}

	@Override
	public void deleteManageFestivalProduct(int productno) {
		
		sqlSession.delete(NAME_SPACE + ".deleteManageFestivalProduct", productno);
	}

}
