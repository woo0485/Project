package com.finalproject.festival.manage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.festival.domain.Manage;
import com.finalproject.festival.manage.dao.InformationUseDao;

@Service
public class InformationUseServiceImpl implements InformationUseService {
	
	@Autowired
	private InformationUseDao informationDao;
	
	private static final int PAGE_SIZE = 10;
	private static final int PAGE_GROUP = 10;
	
	

	@Override
	public Map<String, Object> informationUse(int pageNum) {
		
		int currentPage = pageNum;
		
		int startRow = (currentPage - 1) * PAGE_SIZE;
		
		int listCount = informationDao.getBoardCount();
		
		List<Manage> iList = informationDao.informationUse(startRow, PAGE_SIZE);
		List<Manage> iList2 = informationDao.customerInformationUse();
			
		int pageCount =
				listCount / PAGE_SIZE + (listCount % PAGE_SIZE == 0 ? 0 : 1);
		
		int startPage = (currentPage / PAGE_GROUP) * PAGE_GROUP + 1
				- (currentPage % PAGE_GROUP == 0 ? PAGE_GROUP : 0);
		
		int endPage = startPage + PAGE_GROUP - 1;
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		modelMap.put("iList", iList);
		modelMap.put("iList2", iList2);
		modelMap.put("pageCount", pageCount);
		modelMap.put("startPage", startPage);
		modelMap.put("endPage", endPage);
		modelMap.put("currentPage", currentPage);
		modelMap.put("listCount", listCount);
		modelMap.put("pageGroup", PAGE_GROUP);
		
			
		return modelMap;	
	}

	@Override
	public Manage getInformationUse(int informationUseNo) {
		
		return informationDao.getInformationUse(informationUseNo);
	}

	@Override
	public void insertInformationUse(Manage manage) {
		
		informationDao.insertInformationUse(manage);
	}

	@Override
	public void updateInformationUse(Manage manage) {
		
		informationDao.updateInformationUse(manage);
	}

	@Override
	public void deleteInformationUse(int informationUseNo) {
		
		informationDao.deleteInformationUse(informationUseNo);
		
	}

}
