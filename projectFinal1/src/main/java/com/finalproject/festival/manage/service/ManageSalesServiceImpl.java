package com.finalproject.festival.manage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.finalproject.festival.domain.Reservation;
import com.finalproject.festival.domain.Sales;
import com.finalproject.festival.manage.dao.ManageReservationDao;
import com.finalproject.festival.manage.dao.ManageSalesDao;

@Service
public class ManageSalesServiceImpl implements ManageSalesService {
	
	private static final int PAGE_SIZE = 10;
	private static final int PAGE_GROUP = 10;

	@Autowired
	private ManageSalesDao manageSalesDao;
	
	@Autowired
	private ManageReservationDao managerReservationDao;
	
	@Override
	public void deleteSalesTotalPrice(int salesNo) {
		
		manageSalesDao.deleteSalesTotalPrice(salesNo);
	}
	
	@Override
	public void salesTotalPriceWrite(Sales sales) {
		
		manageSalesDao.salesTotalPriceWrite(sales);
	}

	@Override
	public Map<String, Object> manageSales(int pageNum, String type, String keyword) {
		
		int currentPage = pageNum;
		
		int start = (currentPage - 1) * PAGE_SIZE;		
		
		int listCount = managerReservationDao.getDateCount(type, keyword);
		
		//DB Sales 매출 삭제할 떄
		List<Sales> dbSalesTotalPrice = manageSalesDao.salesList();
		
		//일매출
		List <Reservation> rList = managerReservationDao.manageReservation2(start, PAGE_SIZE, type, keyword);
		
		//월 매출
		List <Reservation> salesTotalPrice1 = managerReservationDao.saleTotalPrice1();
		List <Reservation> salesTotalPrice2 = managerReservationDao.saleTotalPrice2();
		List <Reservation> salesTotalPrice3 = managerReservationDao.saleTotalPrice3();
		List <Reservation> salesTotalPrice4 = managerReservationDao.saleTotalPrice4();
		List <Reservation> salesTotalPrice5 = managerReservationDao.saleTotalPrice5();
		List <Reservation> salesTotalPrice6 = managerReservationDao.saleTotalPrice6();
		List <Reservation> salesTotalPrice7 = managerReservationDao.saleTotalPrice7();
		List <Reservation> salesTotalPrice8 = managerReservationDao.saleTotalPrice8();
		List <Reservation> salesTotalPrice9 = managerReservationDao.saleTotalPrice9();
		List <Reservation> salesTotalPrice10 = managerReservationDao.saleTotalPrice10();
		List <Reservation> salesTotalPrice11 = managerReservationDao.saleTotalPrice11();
		List <Reservation> salesTotalPrice12 = managerReservationDao.saleTotalPrice12();
			
		int pageCount = listCount / PAGE_SIZE + (listCount % PAGE_SIZE == 0? 0 : 1);
		
		int startPage = (currentPage / PAGE_GROUP) * PAGE_GROUP + 1
						-(currentPage % PAGE_GROUP == 0? PAGE_GROUP : 0);
		
		int endPage = startPage + PAGE_GROUP - 1;
		if(endPage > pageCount) {
			endPage = pageCount;
		}	
	
		Map<String, Object> modelMap = new HashMap<>();		
		// 일 매출
		modelMap.put("rList", rList);
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
	
		// 월 매출
		modelMap.put("salesTotalPrice1", salesTotalPrice1);
		modelMap.put("salesTotalPrice2", salesTotalPrice2);
		modelMap.put("salesTotalPrice3", salesTotalPrice3);
		modelMap.put("salesTotalPrice4", salesTotalPrice4);
		modelMap.put("salesTotalPrice5", salesTotalPrice5);
		modelMap.put("salesTotalPrice6", salesTotalPrice6);
		modelMap.put("salesTotalPrice7", salesTotalPrice7);
		modelMap.put("salesTotalPrice8", salesTotalPrice8);
		modelMap.put("salesTotalPrice9", salesTotalPrice9);
		modelMap.put("salesTotalPrice10", salesTotalPrice10);
		modelMap.put("salesTotalPrice11", salesTotalPrice11);
		modelMap.put("salesTotalPrice12", salesTotalPrice12);
		
		// Sales DB 매출 삭제
		modelMap.put("dbSalesTotalPrice", dbSalesTotalPrice);

		return modelMap;
	}

	@Override
	public List<Sales> salesList(){
		
		return manageSalesDao.salesList();
	}
	
	@Override
	public List<Sales> lastYearSalesList(){
		
		return manageSalesDao.lastYearSalesList();
	}
	
	@Override
	public List<Sales> yearBeforeLastSalesList2(){
		
		return manageSalesDao.yearBeforeLastSalesList2();
	}
	
	
}
