package com.finalproject.festival.manage.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.finalproject.festival.domain.Reservation;
import com.finalproject.festival.domain.Sales;

@Repository
public class ManageSalesDaoImpl implements ManageSalesDao {
	
	private static final String NAME_SPACE = "com.finalproject.festival.mapper.ManageSalesMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public void deleteSalesTotalPrice(String salesDate) {
		
		sqlSession.delete(NAME_SPACE + ".deleteSalesTotalPrice", salesDate);
	}
	
	@Override
	public void salesTotalPriceWrite(Sales sales) {
		
		sqlSession.insert(NAME_SPACE + ".salesTotalPriceWrite", sales);
	}
	
	@Override
	public List<Sales> salesList(){
	
		return sqlSession.selectList(NAME_SPACE + ".salesList");
	}

}
