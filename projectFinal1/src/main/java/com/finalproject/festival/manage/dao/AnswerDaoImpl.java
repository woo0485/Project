package com.finalproject.festival.manage.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalproject.festival.domain.Manage;

@Repository
public class AnswerDaoImpl implements AnswerDao {
	
	private static final String NAME_SPACE = "com.finalproject.festival.mapper.AnswerMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	@Override
	public void insertAnswer(Manage manage) {
		
		sqlSession.insert(NAME_SPACE + ".insertAnswer", manage);
	}

}
