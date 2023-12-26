package com.finalproject.festival.manage.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalproject.festival.domain.Manage;

@Repository
public class NoticeDaoImpl implements NoticeDao {
	
	private static final String NAME_SPACE = "com.finalproject.festival.mapper.NoticeMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 고객센터 공지사항
	@Override
	public List<Manage> customerNotice(){
		
		return sqlSession.selectList(NAME_SPACE + ".customerNotice");
	}
	
	@Override
	public int getBoardCount() {
		
		return sqlSession.selectOne(NAME_SPACE + ".getBoardCount");
	}

	@Override
	public List<Manage>notice(int startRow, int num) {
		
		Map<String, Integer> params = new HashMap<String, Integer>();
		params.put("startRow", startRow);
		params.put("num", num);

		return sqlSession.selectList(NAME_SPACE + ".noticeList", params);
	}

	@Override
	public Manage getNotice(int noticeNo) {

		return sqlSession.selectOne(NAME_SPACE + ".getNotice", noticeNo);
	}

	@Override
	public void insertNotice(Manage manage) {
		
		sqlSession.insert(NAME_SPACE + ".insertNotice", manage);
	}

	@Override
	public void updateNotice(Manage manage) {
		
		sqlSession.update(NAME_SPACE + ".updateNotice", manage);
	}

	@Override
	public void deleteNotice(int noticeNo) {
		
		sqlSession.delete(NAME_SPACE + ".deleteNotice", noticeNo);
	}

}
