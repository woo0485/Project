package com.finalproject.festival.dao;

import java.util.List;

import com.finalproject.festival.domain.News;

public interface NewsDao {
	
	public abstract List<News> newslist();
	
	public abstract News newsdetail(int no);

}
