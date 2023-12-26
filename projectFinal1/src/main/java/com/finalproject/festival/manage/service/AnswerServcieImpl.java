package com.finalproject.festival.manage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.festival.domain.Manage;
import com.finalproject.festival.manage.dao.AnswerDao;

@Service
public class AnswerServcieImpl implements AnswerService {
	
	@Autowired
	private AnswerDao answerDao;

	@Override
	public void insertAnswer(Manage manage) {
		
		answerDao.insertAnswer(manage);
	}

}
