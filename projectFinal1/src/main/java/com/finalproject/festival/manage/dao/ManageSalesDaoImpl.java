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
	public void deleteSalesTotalPrice(int salesNo) {
		
		sqlSession.delete(NAME_SPACE + ".deleteSalesTotalPrice", salesNo);
	}
	
	@Override
	public void salesTotalPriceWrite(Sales sales) {
		
		sqlSession.insert(NAME_SPACE + ".salesTotalPriceWrite", sales);
	}
	
	@Override
	public List<Sales> salesList(){
	
		return sqlSession.selectList(NAME_SPACE + ".salesList");
	}
	
	@Override
	public List<Sales> lastYearSalesList(){
	
		return sqlSession.selectList(NAME_SPACE + ".lastYearSalesList");
	}
	
	@Override
	public List<Sales> yearBeforeLastSalesList2(){
	
		return sqlSession.selectList(NAME_SPACE + ".yearBeforeLastSalesList2");
	}
}
