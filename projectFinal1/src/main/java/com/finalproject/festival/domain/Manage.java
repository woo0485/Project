package com.finalproject.festival.domain;


public class Manage {
	
	private String adminId;
	private String adminPassword;
	private String adminName;
	
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private String noticeImage;
	private String noticeUploadDate;
	
	private int questionNo;
	private String id;
	private String questionTitle;
	private String questionContent;
	private String questionDate;
	private String questionCategory;
	private String email;
	private String answerProgress;
	private String answerTitle;
	private String answerContent;
	private String answerDate;
	private String answerCategory;	
	private String toEmail;
	
	private int informationUseNo;
	private String informationUseTitle;
	private String informationUseContent;
	private String informationUseDate;
	private String informationUseCategory;
	private String informationUseImage;
	
	public Manage() {}

	public Manage(String adminId, String adminPassword, String adminName, int noticeNo, String noticeTitle,
			String noticeContent, String noticeImage, String noticeUploadDate, int questionNo, String id,
			String questionTitle, String questionContent, String questionDate, String questionCategory, String email,
			String answerTitle, String answerContent, String answerDate, String answerCategory,
			String answerProgress, String toEmail, int informationUseNo, String informationUseTitle,
			String informationUseContent, String informationUseDate, String informationUseCategory,
			String informationUseImage) {
		super();
		this.adminId = adminId;
		this.adminPassword = adminPassword;
		this.adminName = adminName;
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeImage = noticeImage;
		this.noticeUploadDate = noticeUploadDate;
		this.questionNo = questionNo;
		this.id = id;
		this.questionTitle = questionTitle;
		this.questionContent = questionContent;
		this.questionDate = questionDate;
		this.questionCategory = questionCategory;
		this.email = email;
		this.answerTitle = answerTitle;
		this.answerContent = answerContent;
		this.answerDate = answerDate;
		this.answerCategory = answerCategory;
		this.answerProgress = answerProgress;
		this.toEmail = toEmail;
		this.informationUseNo = informationUseNo;
		this.informationUseTitle = informationUseTitle;
		this.informationUseContent = informationUseContent;
		this.informationUseDate = informationUseDate;
		this.informationUseCategory = informationUseCategory;
		this.informationUseImage = informationUseImage;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getAdminPassword() {
		return adminPassword;
	}

	public void setAdminPassword(String adminPassword) {
		this.adminPassword = adminPassword;
	}

	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public String getNoticeImage() {
		return noticeImage;
	}

	public void setNoticeImage(String noticeImage) {
		this.noticeImage = noticeImage;
	}

	public String getNoticeUploadDate() {
		return noticeUploadDate;
	}

	public void setNoticeUploadDate(String noticeUploadDate) {
		this.noticeUploadDate = noticeUploadDate;
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

	public String getQuestionDate() {
		return questionDate;
	}

	public void setQuestionDate(String questionDate) {
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

	public String getAnswerDate() {
		return answerDate;
	}

	public void setAnswerDate(String answerDate) {
		this.answerDate = answerDate;
	}

	public String getAnswerCategory() {
		return answerCategory;
	}

	public void setAnswerCategory(String answerCategory) {
		this.answerCategory = answerCategory;
	}

	public String getAnswerProgress() {
		return answerProgress;
	}

	public void setAnswerProgress(String answerProgress) {
		this.answerProgress = answerProgress;
	}

	public String getToEmail() {
		return toEmail;
	}

	public void setToEmail(String toEmail) {
		this.toEmail = toEmail;
	}

	public int getInformationUseNo() {
		return informationUseNo;
	}

	public void setInformationUseNo(int informationUseNo) {
		this.informationUseNo = informationUseNo;
	}

	public String getInformationUseTitle() {
		return informationUseTitle;
	}

	public void setInformationUseTitle(String informationUseTitle) {
		this.informationUseTitle = informationUseTitle;
	}

	public String getInformationUseContent() {
		return informationUseContent;
	}

	public void setInformationUseContent(String informationUseContent) {
		this.informationUseContent = informationUseContent;
	}

	public String getInformationUseDate() {
		return informationUseDate;
	}

	public void setInformationUseDate(String informationUseDate) {
		this.informationUseDate = informationUseDate;
	}

	public String getInformationUseCategory() {
		return informationUseCategory;
	}

	public void setInformationUseCategory(String informationUseCategory) {
		this.informationUseCategory = informationUseCategory;
	}

	public String getInformationUseImage() {
		return informationUseImage;
	}

	public void setInformationUseImage(String informationUseImage) {
		this.informationUseImage = informationUseImage;
	}

	
	

	

		

}