package com.finalproject.festival.dao;

import org.mybatis.spring.SqlSessionTemplate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalproject.festival.domain.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	private static final String NAME_SPACE ="com.finalproject.festival.mapper.MemberMapper";
	
	@Autowired
	private SqlSessionTemplate st;
	
	@Override
	public Member loginCheck(String id) {
			
		Member m =st.selectOne(NAME_SPACE+".userCheck", id);
		
		return m;
	}

	@Override
	public int joinIdCheck(String id) {
		int idCheck = st.selectOne(NAME_SPACE+".overlapCheck",id);
		return idCheck;
	}

	@Override
	public int joinEmailCheck(String email) {
		int emailCheck = st.selectOne(NAME_SPACE+".overlapCheck",email);
		return emailCheck;
	}

	@Override
	public void joinMember(Member m) {
		st.insert(NAME_SPACE+".joinMember",m);
		
	} 


	
}
