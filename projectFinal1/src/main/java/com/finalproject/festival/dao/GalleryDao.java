package com.finalproject.festival.dao;

import java.util.List;

import com.finalproject.festival.domain.Gallery;

public interface GalleryDao {
	
	public abstract void insertGallery(Gallery gallery);
	
	public abstract List<Gallery> gallery();

}
