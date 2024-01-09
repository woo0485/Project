package com.finalproject.festival.manage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.festival.domain.Product;
import com.finalproject.festival.manage.dao.ManageFestivalProductDao;

@Service
public class ManageFestivalProductServiceImpl implements ManageFestivalProductService {
	
	private static final int PAGE_SIZE = 10;
	private static final int PAGE_GROUP = 10;

	@Autowired
	private ManageFestivalProductDao manageFestivalProductDao;
	
	@Override
	public Map<String, Object> manageFestivalProduct(int pageNum, String type, String keyword) {
		
		int currentPage = pageNum;
		
		int start = (currentPage - 1) * PAGE_SIZE;		
		
		int listCount = manageFestivalProductDao.getBoardCount(type, keyword);
		
		List<Product> pList = manageFestivalProductDao.manageFestivalProduct(start, PAGE_SIZE, type, keyword);
		
		int pageCount = listCount / PAGE_SIZE + (listCount % PAGE_SIZE == 0? 0 : 1);
		
		int startPage = (currentPage / PAGE_GROUP) * PAGE_GROUP + 1
						-(currentPage % PAGE_GROUP == 0? PAGE_GROUP : 0);
		
		int endPage = startPage + PAGE_GROUP - 1;
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		Map<String, Object> modelMap = new HashMap<>();
		modelMap.put("pList", pList);
		modelMap.put("pageCount", pageCount);
		modelMap.put("startPage", startPage);
		modelMap.put("endPage", endPage);
		modelMap.put("currentPage", currentPage);
		modelMap.put("listCount", listCount);
		modelMap.put("pageGroup", PAGE_GROUP);
		
		boolean searchOption = (type.equals("null") 
				|| keyword.equals("null"))? false : true;
		modelMap.put("searchOption", searchOption);
		if(searchOption) {
			modelMap.put("type", type);
			modelMap.put("keyword", keyword);
		}

		return modelMap;
	}

	@Override
	public void deleteManageFestivalProduct(int productno) {
		
		manageFestivalProductDao.deleteManageFestivalProduct(productno);
	}

}
