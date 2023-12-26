package com.finalproject.festival.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.festival.dao.NewsDao;
import com.finalproject.festival.domain.News;

@Service
public class NewsServiceImpl implements NewsService {

	@Autowired
	NewsDao nd;
	
	@Override
	public List<News> newslist() {
		
		return nd.newslist();
		
	}

	@Override
	public News newsdetail(int no) {
		
		return nd.newsdetail(no);
	}

}
