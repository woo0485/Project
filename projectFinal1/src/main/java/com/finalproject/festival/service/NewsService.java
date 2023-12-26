package com.finalproject.festival.service;

import java.util.List;

import com.finalproject.festival.domain.News;

public interface NewsService {
	
	public abstract List<News> newslist();
	
	public abstract News newsdetail(int no);

}
