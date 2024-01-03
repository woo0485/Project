package com.finalproject.festival.manage.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalproject.festival.domain.Product;

@Repository
public class ManageProductCountDaoImpl implements ManageProductCountDao {

	private static final String NAME_SPACE = "com.finalproject.festival.mapper.ManageProductMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Product> manageProductCount5() {
		
		return sqlSession.selectList(NAME_SPACE + ".productReadCount5");
	}

}
