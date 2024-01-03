package com.finalproject.festival.manage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.festival.domain.Product;
import com.finalproject.festival.manage.dao.ManageProductCountDao;

@Service
public class ManageProductCountServiceImpl implements ManageProductCountService {

	@Autowired
	private ManageProductCountDao manageProductCountDao;
	
	@Override
	public List<Product> manageProductCount5() {
 
		return manageProductCountDao.manageProductCount5();
	}

}
