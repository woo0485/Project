package com.finalproject.festival.manage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.festival.domain.Manage;
import com.finalproject.festival.manage.dao.NoticeDao;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeDao noticeDao;
	
	private static final int PAGE_SIZE = 10;
	private static final int PAGE_GROUP = 10;

	@Override
	public Map<String, Object> notice(int pageNum) {
		
		int currentPage = pageNum;
		
		int startRow = (currentPage - 1) * PAGE_SIZE;
		
		int listCount = noticeDao.getBoardCount();
		
		List<Manage> nList = noticeDao.notice(startRow, PAGE_SIZE);
		List<Manage> nList2 = noticeDao.customerNotice();
		
		int pageCount =
				listCount / PAGE_SIZE + (listCount % PAGE_SIZE == 0 ? 0 : 1);
		
		int startPage = (currentPage / PAGE_GROUP) * PAGE_GROUP + 1
				- (currentPage % PAGE_GROUP == 0 ? PAGE_GROUP : 0);
		
		int endPage = startPage + PAGE_GROUP - 1;
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		modelMap.put("nList", nList);
		modelMap.put("nList2", nList2);
		modelMap.put("pageCount", pageCount);
		modelMap.put("startPage", startPage);
		modelMap.put("endPage", endPage);
		modelMap.put("currentPage", currentPage);
		modelMap.put("listCount", listCount);
		modelMap.put("pageGroup", PAGE_GROUP);
		
			
		return modelMap;	
		
	}

	@Override
	public Manage getNotice(int noticeNo) {
		
		return noticeDao.getNotice(noticeNo);
	}

	@Override
	public void insertNotice(Manage manage) {
		
		noticeDao.insertNotice(manage);
	}

	@Override
	public void updateNotice(Manage manage) {
	
		noticeDao.updateNotice(manage);
	}

	@Override
	public void deleteNotice(int noticeNo) {
	
		noticeDao.deleteNotice(noticeNo);
	}

}
