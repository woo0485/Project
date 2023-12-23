package com.finalproject.festival.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.festival.dao.FestivalMapDao;
import com.finalproject.festival.domain.Product;

@Service
public class FestivalMapServiceImpl implements FestivalMapService {

	@Autowired
	FestivalMapDao fd;
	
	@Override
	public List<Product> productList() {
		
		return fd.productList();
	}

}
