package com.finalproject.festival.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalproject.festival.domain.Member;

@Repository
public class MyPageMemberDaoImpl implements MyPageMemberDao {

	private static final String NAME_SPACE = "com.finalproject.festival.mapper.MyPageMemberMapper";
	
	@Autowired
	private SqlSessionTemplate st;
	
	@Override
	public Member MyInfo (String id) {
		
		return st.selectOne(NAME_SPACE + ".MyInfo", id);
	}
	
	
}
