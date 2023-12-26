package com.finalproject.festival.manage.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalproject.festival.domain.Manage;

@Repository
public class InformationUseDaoImpl implements InformationUseDao {
	
	private static final String NAME_SPACE = "com.finalproject.festival.mapper.InformationUseMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 고객센터 이용 안내
	@Override
	public List<Manage> customerInformationUse(){
		
		return sqlSession.selectList(NAME_SPACE + ".customerInformationUse");		
	}

	@Override
	public int getBoardCount() {
		
		return sqlSession.selectOne(NAME_SPACE + ".getBoardCount");
	}

	@Override
	public List<Manage> informationUse(int startRow, int num) {
		
		Map<String, Integer> params = new HashMap<String, Integer>();
		params.put("startRow", startRow);
		params.put("num", num);

		return sqlSession.selectList(NAME_SPACE + ".informationUse", params);
	}

	@Override
	public Manage getInformationUse(int informationUseNo) {
		
		return sqlSession.selectOne(NAME_SPACE + ".getInformationUse", informationUseNo);
	}

	@Override
	public void insertInformationUse(Manage manage) {
		
		sqlSession.insert(NAME_SPACE + ".insertInformationUse", manage);
	}

	@Override
	public void updateInformationUse(Manage manage) {
		
		sqlSession.update(NAME_SPACE + ".updateInformationUse", manage);
	}

	@Override
	public void deleteInformationUse(int informationUseNo) {
		
		sqlSession.delete(NAME_SPACE + ".deleteInformationUse", informationUseNo);
	}

}
