package com.finalproject.festival.manage.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalproject.festival.domain.Manage;

@Repository
public class InquiryDaoImpl implements InquiryDao {

	private static final String NAME_SPACE = "com.finalproject.festival.mapper.InquiryMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public int getBoardCount(String questionCategory) {
		
		Map<String,Object> params = new HashMap<String,Object>();
		params.put("questionCategory", questionCategory);
		
		return sqlSession.selectOne(NAME_SPACE + ".getBoardCount", params);
	}
	
	@Override
	public List<Manage> inquiry(String questionCategory, int start, int num) {
		
		Map<String,Object> params = new HashMap<String,Object>();
		params.put("questionCategory", questionCategory);
		params.put("start", start);
		params.put("num", num);
		
		return sqlSession.selectList(NAME_SPACE + ".inquiry", params);
	}

	@Override
	public Manage getInquiry(int questionNo) {

		return sqlSession.selectOne(NAME_SPACE +".getInquiry", questionNo);
	}

	@Override
	public void insertInquiry(Manage manage) {
		
		sqlSession.insert(NAME_SPACE + ".insertInquiry", manage);
	}

	@Override
	public void updateInquiry(Manage manage) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteInquiry(int questionNo) {
		// TODO Auto-generated method stub

	}

}
