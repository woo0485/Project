package com.finalproject.festival.manage.service;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZoneOffset;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.festival.domain.Manage;
import com.finalproject.festival.manage.dao.InquiryDao;
import com.finalproject.festival.manage.dao.NoticeDao;

@Service
public class InquiryServiceImpl implements InquiryService {
	
	private static final int PAGE_SIZE = 10;
	private static final int PAGE_GROUP = 10;
	
	@Autowired
	private InquiryDao inquiryDao;

	@Override
	public Map<String, Object> inquiry(String questionCategory, int pageNum) {
		
		int currentPage = pageNum;
		
		int start = (currentPage - 1) * PAGE_SIZE;
		
		int listCount = 0;
		
		listCount = inquiryDao.getBoardCount(questionCategory);
		
		List<Manage> iList = inquiryDao.inquiry(questionCategory, start, PAGE_SIZE);
		
		int pageCount = listCount / PAGE_SIZE + (listCount % PAGE_SIZE == 0? 0 : 1);
		
		int startPage = (currentPage / PAGE_GROUP) * PAGE_GROUP + 1
						-(currentPage % PAGE_GROUP == 0? PAGE_GROUP : 0);
		
		int endPage = startPage + PAGE_GROUP - 1;
		if(endPage > pageCount) {
			endPage = pageCount;
		}		
		
		Map<String, Object> modelMap = new HashMap<String,Object>();
		modelMap.put("iList", iList);
		modelMap.put("pageCount", pageCount);
		modelMap.put("startPage", startPage);
		modelMap.put("endPage", endPage);
		modelMap.put("currentPage", currentPage);
		modelMap.put("listCount", listCount);
		modelMap.put("pageGroup", PAGE_GROUP);

		return modelMap;
	}

	@Override
	public Manage getInquiry(int questionNo) {
		
		return inquiryDao.getInquiry(questionNo);
	}

	@Override
	public void insertInquiry(Manage manage) {
		LocalDateTime questionDate = LocalDateTime.now(ZoneOffset.UTC).plusHours(9);
	    manage.setQuestionDate(questionDate);

		inquiryDao.insertInquiry(manage);
	}

}
