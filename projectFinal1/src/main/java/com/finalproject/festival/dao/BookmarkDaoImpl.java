package com.finalproject.festival.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalproject.festival.domain.Bookmark;
import com.finalproject.festival.domain.Product;

@Repository
public class BookmarkDaoImpl implements BookmarkDao {

	private static final String NAME_SPACE ="com.finalproject.festival.mapper.MemberMapper";
	@Autowired
	private SqlSessionTemplate st;

/**************************bookmark******************************/
	
	@Override
	public int selectBookmarkCount(String id, int productno) {
		System.out.println(id+"-----dao-co-----"+productno);
		
		Bookmark bookmark = new Bookmark();
		bookmark.setId(id);
		bookmark.setProductno(productno);
		
		return st.selectOne(NAME_SPACE+".selectBookmarkCount", bookmark);
	}

	@Override
	public void productBookmarkCount(int productno) {
		st.update(NAME_SPACE+".productBookmarkCount", productno);
		
	}

	@Override
	public void bookmarkInsert(String id, int productno) {
		System.out.println(id+"-----dao-in-----"+productno);
		
		Bookmark bookmark = new Bookmark();
		bookmark.setId(id);
		bookmark.setProductno(productno);
		
		st.insert(NAME_SPACE+".bookmarkInsert", bookmark);
		
	}

	@Override
	public void productBookmarkCountDelete(int productno) {
		st.update(NAME_SPACE+".productBookmarkCountDelete", productno);
		
	}

	@Override
	public void bookmarkDelete(String id, int productno) {
		System.out.println(id+"-----dao-de-----"+productno);
		
		Bookmark bookmark = new Bookmark();
		bookmark.setId(id);
		bookmark.setProductno(productno);
		
		st.delete(NAME_SPACE+".bookmarkDelete", bookmark);
		
	}

	@Override
	public List<Product> ProductListBookmark() {
		
		return st.selectList(NAME_SPACE+".productList");
	}

	
}
