package com.finalproject.festival.dao;

import java.util.List;
import java.util.Map;

import com.finalproject.festival.domain.Bookmark;
import com.finalproject.festival.domain.Product;

public interface BookmarkDao {


	public int selectBookmarkCount(String id, int productno);
	
	public void productBookmarkCount(int productno);
	
	public void bookmarkInsert(String id, int productno);
	
	public void productBookmarkCountDelete(int productno);
	
	public void bookmarkDelete(String id, int productno);
	
	public List<Product> ProductListBookmark();
	
	public int productBookmarkSelect(int productno); 

}
