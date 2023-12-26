package com.finalproject.festival.manage.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalproject.festival.domain.Festival;

@Repository
public class ManageMemberDaoImpl implements ManageMemberDao {
	
	private static final String NAME_SPACE = "com.finalproject.festival.mapper.ManageMemberMapper";
	
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
	public List<Festival> manageMember(int start, int num, String type, String keyword) {
		
		Map<String, Object> params = new HashMap<>();
		params.put("start", start);
		params.put("num", num);
		params.put("type", type);
		params.put("keyword", keyword);
		
		return sqlSession.selectList(NAME_SPACE + ".manageMember", params);
	}

	@Override
	public Festival getManageMember(String id) {

		return sqlSession.selectOne(NAME_SPACE + ".getManageMember", id);
	}

	@Override
	public void updateManageMember(Festival festival) {

		sqlSession.update(NAME_SPACE + ".updateManageMember", festival);
	}

	@Override
	public void deleteManageMember(String id) {
		
		sqlSession.delete(NAME_SPACE + ".deleteManageMember", id);
	}

}
