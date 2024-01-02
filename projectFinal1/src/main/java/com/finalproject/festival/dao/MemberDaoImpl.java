package com.finalproject.festival.dao;


import java.util.Map;

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
		int idCheck = st.selectOne(NAME_SPACE+".userCount",id);
		return idCheck;
	}

	@Override
	public int emailUserCount(String email) {
		int emailCheck = st.selectOne(NAME_SPACE+".userCount",email);
		return emailCheck;
	}

	@Override
	public void joinMember(Member m) {
		st.insert(NAME_SPACE+".joinMember",m);
		
	}

	@Override
	public String userFindId(String email) {
		String findId ="";
		int result = st.selectOne(NAME_SPACE+".userCount",email);
		
		if(result == 1) {
			Member m = st.selectOne(NAME_SPACE+".userCheck", email);
			findId = m.getId();
		}
		return findId;
	}

	@Override
	public int userFindPassword(Map<String, Object> map) {
		
		return st.selectOne(NAME_SPACE+".userFindPassword", map);
	} 


	
}
