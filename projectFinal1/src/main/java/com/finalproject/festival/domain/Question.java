package com.finalproject.festival.domain;

import java.sql.Timestamp;

public class Question {

	private int questionNo;
	private String id;
	private String questionTitle;
	private String questionContent;
	private Timestamp questionDate;
	private String questionCategory;
	private String email;
	private String answerProgress;
	private String answerTitle;
	private String answerContent;
	private Timestamp answerDate;	
	private String toEmail;
	
	public Question () {}

	public Question(int questionNo, String id, String questionTitle, String questionContent, Timestamp questionDate,
			String questionCategory, String email, String answerProgress, String answerTitle, String answerContent,
			Timestamp answerDate, String toEmail) {
		super();
		this.questionNo = questionNo;
		this.id = id;
		this.questionTitle = questionTitle;
		this.questionContent = questionContent;
		this.questionDate = questionDate;
		this.questionCategory = questionCategory;
		this.email = email;
		this.answerProgress = answerProgress;
		this.answerTitle = answerTitle;
		this.answerContent = answerContent;
		this.answerDate = answerDate;
		this.toEmail = toEmail;
	}

	public int getQuestionNo() {
		return questionNo;
	}

	public void setQuestionNo(int questionNo) {
		this.questionNo = questionNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getQuestionTitle() {
		return questionTitle;
	}

	public void setQuestionTitle(String questionTitle) {
		this.questionTitle = questionTitle;
	}

	public String getQuestionContent() {
		return questionContent;
	}

	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}

	public Timestamp getQuestionDate() {
		return questionDate;
	}

	public void setQuestionDate(Timestamp questionDate) {
		this.questionDate = questionDate;
	}

	public String getQuestionCategory() {
		return questionCategory;
	}

	public void setQuestionCategory(String questionCategory) {
		this.questionCategory = questionCategory;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAnswerProgress() {
		return answerProgress;
	}

	public void setAnswerProgress(String answerProgress) {
		this.answerProgress = answerProgress;
	}

	public String getAnswerTitle() {
		return answerTitle;
	}

	public void setAnswerTitle(String answerTitle) {
		this.answerTitle = answerTitle;
	}

	public String getAnswerContent() {
		return answerContent;
	}

	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}

	public Timestamp getAnswerDate() {
		return answerDate;
	}

	public void setAnswerDate(Timestamp answerDate) {
		this.answerDate = answerDate;
	}

	public String getToEmail() {
		return toEmail;
	}

	public void setToEmail(String toEmail) {
		this.toEmail = toEmail;
	}
	
	
	
}
