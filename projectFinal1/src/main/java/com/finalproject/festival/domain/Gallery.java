package com.finalproject.festival.domain;

import java.time.LocalDate;
import java.time.LocalDateTime;

import com.google.protobuf.Timestamp;

public class Gallery {
	
	private int galleryno;
	private String id;
	private String gallerytitle;
	private String gallerycontent;
	private String gallerywriter;
	private String[] galleryimage;
	private int gallerygoodcount;
	private LocalDate galleryuploaddate;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getGallerytitle() {
		return gallerytitle;
	}
	public void setGallerytitle(String gallerytitle) {
		this.gallerytitle = gallerytitle;
	}
	public String getGallerycontent() {
		return gallerycontent;
	}
	public void setGallerycontent(String gallerycontent) {
		this.gallerycontent = gallerycontent;
	}
	public String getGallerywriter() {
		return gallerywriter;
	}
	public void setGallerywriter(String gallerywriter) {
		this.gallerywriter = gallerywriter;
	}
	public String[] getGalleryimage() {
		return galleryimage;
	}
	public void setGalleryimage(String[] galleryimage) {
		this.galleryimage = galleryimage;
	}
	public int getGalleryno() {
		return galleryno;
	}
	public void setGalleryno(int galleryno) {
		this.galleryno = galleryno;
	}
	public int getGallerygoodcount() {
		return gallerygoodcount;
	}
	public void setGallerygoodcount(int gallerygoodcount) {
		this.gallerygoodcount = gallerygoodcount;
	}
	public LocalDate getGalleryuploaddate() {
		return galleryuploaddate;
	}
	public void setGalleryuploaddate(LocalDate galleryuploaddate) {
		this.galleryuploaddate = galleryuploaddate;
	}
	
	
	
	

}
