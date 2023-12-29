package com.finalproject.festival.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.festival.dao.GalleryDao;
import com.finalproject.festival.domain.Gallery;

@Service
public class GalleryServiceImpl implements GalleryService {

	@Autowired
	GalleryDao gd;
	
	@Override
	public void insertGallery(Gallery gallery) {
		
		gd.insertGallery(gallery);

	}

}
