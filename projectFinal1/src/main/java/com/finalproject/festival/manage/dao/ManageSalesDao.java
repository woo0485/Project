package com.finalproject.festival.manage.dao;

import java.util.List;

import com.finalproject.festival.domain.Reservation;
import com.finalproject.festival.domain.Sales;

public interface ManageSalesDao {
	
		public abstract void deleteSalesTotalPrice(String salesDate);
	
		public abstract void salesTotalPriceWrite(Sales sales);

		public abstract List<Sales> salesList();
	
}
