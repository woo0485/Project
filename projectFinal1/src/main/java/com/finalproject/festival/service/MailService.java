package com.finalproject.festival.service;

public interface MailService {
	
	
	
	public void makeRandomNumber();
	
	public String joinEmail(String email);
	
	public void mailSend(String setFrom, String toMail, String title, String content);
	
	public String findeMailCheck(String email);

}
