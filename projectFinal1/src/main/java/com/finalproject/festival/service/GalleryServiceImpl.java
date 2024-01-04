package com.finalproject.festival.service;

import java.util.ArrayList;
import java.util.List;

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

	@Override
	public List<Gallery> gallery() {

		List<Gallery> galleryList = new ArrayList<Gallery>();

		galleryList = gd.gallery();

		return galleryList;
	}

	@Override
	public List<Gallery> orderGallery(String orderType) {

		List<Gallery> gallerylist = gd.orderGallery(orderType);

		return gallerylist;
	}

	@Override
	public int galleryheart(int galleryno) {
		
		return gd.galleryheart(galleryno);
		
		
	}

}
