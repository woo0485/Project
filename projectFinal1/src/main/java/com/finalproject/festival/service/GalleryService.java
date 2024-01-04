package com.finalproject.festival.service;

import java.util.List;

import com.finalproject.festival.domain.Gallery;

public interface GalleryService {
	
	public abstract void insertGallery(Gallery gallery);
	
	public abstract List<Gallery> gallery();
	
	public abstract List<Gallery> orderGallery(String orderType);

	public abstract int galleryheart(int galleryno);
}
