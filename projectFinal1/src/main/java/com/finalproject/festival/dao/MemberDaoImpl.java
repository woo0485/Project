package com.finalproject.festival.dao;


import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalproject.festival.domain.Admin;
import com.finalproject.festival.domain.Gallery;
import com.finalproject.festival.domain.Main;
import com.finalproject.festival.domain.Member;
import com.finalproject.festival.domain.News;
import com.finalproject.festival.domain.Product;
import com.finalproject.festival.domain.Search;

@Repository
public class MemberDaoImpl implements MemberDao {

	private static final String NAME_SPACE ="com.finalproject.festival.mapper.MemberMapper";
	
	@Autowired
	private SqlSessionTemplate st;
	
	
	@Override
	public int userLoginCount(String id) {
		
		return st.selectOne(NAME_SPACE+".userLoginCount",id);
	} 
	
	@Override
	public Map<String, Object> loginCheck(String id) {
		
		return st.selectOne(NAME_SPACE+".userLogin", id);
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
	public void newMemberCoupon(String id) {
		
		st.insert(NAME_SPACE+".newMemberCoupon", id);
	}


	@Override
	public String userFindId(Map<String, Object> userfind) {
		String findId ="";
		int result = st.selectOne(NAME_SPACE+".userFindId",userfind);
		
		if(result == 1) {
			Member m = st.selectOne(NAME_SPACE+".userCheck", userfind.get("email"));
			findId = m.getId();
		}
		return findId;
	}

	@Override
	public int userFindPassword(Map<String, Object> map) {
		
		return st.selectOne(NAME_SPACE+".userFindPassword", map);
	}

	@Override
	public int userNewPassword(Map<String, Object> newPassword) {
		
		return  st.update(NAME_SPACE+".userNewPassword" ,newPassword);
	}

	/****************************************************************/
	
	@Override
	public void adminUserAdd(Map<String, Object> adminUserAdd) {
		st.insert(NAME_SPACE+".adminUserAdd", adminUserAdd);
		
	}

	@Override
	public List<Admin> adminUserSelect() {
		
		return st.selectList(NAME_SPACE+".adminUserSelect");
	}
	
	/****************************************************************/


	@Override
	public List<Product> mainProductCarousel() {
		
		return st.selectList(NAME_SPACE+".mainProductCarousel");
	}

	@Override
	public List<Product> mainSearchProduct(String keyword) {
		return st.selectList(NAME_SPACE+".mainSearchProduct",keyword);
	}

	@Override
	public List<News> mainSearchNews(String keyword) {
		return st.selectList(NAME_SPACE+".mainSearchNews",keyword);
	}

	@Override
	public List<Gallery> mainSearchGallery(String keyword) {
		return st.selectList(NAME_SPACE+".mainSearchGallery",keyword);
	}
	
	/****************************************************************/
	
	@Override
	public List<Search> searchKeywordSelect() {
		
		return st.selectList(NAME_SPACE+".searchKeywordSelect");
		
	}

	@Override
	public int searchKeywordFind(String searchKeyword) {
		
		return st.selectOne(NAME_SPACE+".searchKeywordFind", searchKeyword);
	}

	@Override
	public void searchKeywordInsert(String searchKeyword) {
		st.insert(NAME_SPACE+".searchKeywordInsert", searchKeyword);
		
	}

	@Override
	public void searchKeywordCount(String searchKeyword) {
		st.update(NAME_SPACE+".searchKeywordCount", searchKeyword);
	}

	
	


	
}
