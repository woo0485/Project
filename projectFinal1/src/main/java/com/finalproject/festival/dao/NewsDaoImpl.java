package com.finalproject.festival.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalproject.festival.domain.News;

@Repository
public class NewsDaoImpl implements NewsDao {

	private final String NAME_SPACE = "com.finalproject.festival.mapper.NewsMapper";
	
	@Autowired
	private SqlSessionTemplate st;
	
	
	@Override
	public List<News> newslist() {
		
		return st.selectList(NAME_SPACE + ".newsList");
		
	}


	@Override
	public News newsdetail(int no) {
		
		return st.selectOne(NAME_SPACE + ".newsDetail", no);
	}

}
