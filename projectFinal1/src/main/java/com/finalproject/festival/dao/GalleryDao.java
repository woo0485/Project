package com.finalproject.festival.dao;

import java.util.List;

import com.finalproject.festival.domain.Gallery;
import com.finalproject.festival.domain.GalleryBookMark;

public interface GalleryDao {
	
	public abstract void insertGallery(Gallery gallery);
	
	public abstract List<Gallery> gallery();
	
	public abstract List<Gallery> orderGallery(String orderType);
	
	public abstract int galleryheart(int galleryno, String id);
	
	public abstract int gallerybad(int galleryno, String id);
	
	public abstract List<GalleryBookMark> galleryBookmark(String id);
	
	public abstract String galleryCheckPassword(String userInputPassword, String userId);
	
	public abstract void galleryDelete(int galleryno);
	
	public abstract Gallery galleryModifyFormData(int galleryno);
	
	public abstract void galleryModify(Gallery gallery);
}
