package com.finalproject.festival.manage.service;

import java.time.LocalDateTime;
import java.time.ZoneOffset;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

import com.finalproject.festival.domain.Manage;
import com.finalproject.festival.manage.dao.AnswerDao;

@Service
public class AnswerServiceImpl implements AnswerService {
	
	@Autowired
	private AnswerDao answerDao;
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	@Override
	public void sendAnswerMail(Manage manage) {
		
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(manage.getToEmail());
		message.setFrom("GALAGO@gmail.com");
		message.setSubject(manage.getAnswerTitle());
		message.setText(manage.getAnswerContent());
		
		mailSender.send(message);
	}
	

	@Override
	public void insertAnswer(Manage manage) {
		LocalDateTime answerDate = LocalDateTime.now(ZoneOffset.UTC).plusHours(9);
	    manage.setAnswerDate(answerDate);
		
		answerDao.insertAnswer(manage);
	}

}
