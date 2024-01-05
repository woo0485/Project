package com.finalproject.festival.manage.dao;

import java.util.List;

import com.finalproject.festival.domain.Reservation;
import com.finalproject.festival.domain.Sales;

public interface ManageSalesDao {
	
		//월 매출 베스트
		public abstract List<Sales> bestMonth();
	
		public abstract void deleteSalesTotalPrice(int salesNo);
	
		public abstract void salesTotalPriceWrite(Sales sales);

		public abstract List<Sales> salesList();
		
		public abstract List<Sales> lastYearSalesList();
		
		public abstract List<Sales> yearBeforeLastSalesList2();
}
