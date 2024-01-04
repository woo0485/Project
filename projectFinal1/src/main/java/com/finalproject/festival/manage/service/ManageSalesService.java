package com.finalproject.festival.manage.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.finalproject.festival.domain.Reservation;
import com.finalproject.festival.domain.Sales;

public interface ManageSalesService {
	
	public abstract void deleteSalesTotalPrice(int salesNo);
	
	public abstract void salesTotalPriceWrite(Sales sales);

	public abstract Map<String, Object> manageSales(int pageNum, String type, String keyword);

	public abstract List<Sales> salesList();
	
	public abstract List<Sales> lastYearSalesList();
	
	public abstract List<Sales> yearBeforeLastSalesList2();
}
