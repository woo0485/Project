package com.finalproject.festival.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.festival.dao.GalleryDao;
import com.finalproject.festival.domain.Gallery;
import com.finalproject.festival.domain.GalleryBookMark;

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
	public int galleryheart(int galleryno, String id) {
		
		return gd.galleryheart(galleryno, id);
		
		
	}

	@Override
	public int gallerybad(int galleryno, String id) {
		
		return gd.gallerybad(galleryno, id);
	}

	@Override
	public List<GalleryBookMark> galleryBookmark(String id) {
		
		
		System.out.println(gd.galleryBookmark(id));
		return gd.galleryBookmark(id);
	}

}
