package com.finalproject.festival.manage.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalproject.festival.domain.MemberCoupon;

@Repository
public class ManageMemberCouponDaoImpl implements ManageMemberCouponDao {

	private static final String NAME_SPACE = "com.finalproject.festival.mapper.ManageMemberCouponMapper";
	
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
	public List<MemberCoupon> manageMemberCoupon(int startRow, int num, String type, String keyword){
		
		Map<String, Object> params = new HashMap<>();
		params.put("startRow", startRow);
		params.put("num", num);	
		params.put("type", type);
		params.put("keyword", keyword);

		return sqlSession.selectList(NAME_SPACE + ".manageMemberCoupon", params);
	}

	@Override
	public void updateManageMemberCoupon(MemberCoupon memberCoupon) {

		sqlSession.update(NAME_SPACE +".updateManageMemberCoupon", memberCoupon);
	}

	@Override
	public void deleteManageMemberCoupon(int membercouponno) {
		
		sqlSession.delete(NAME_SPACE + ".deleteManageMemberCoupon", membercouponno);
	}

}
