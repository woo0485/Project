package com.finalproject.festival.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.finalproject.festival.domain.Gallery;
import com.finalproject.festival.service.GalleryService;

@Controller
public class GalleryController {
	
	@Autowired
	GalleryService gs;
	
	@RequestMapping("/gallery")
	public String gallery () {
		
		return "gallery";
	}
	
	@RequestMapping("/galleryWriteForm")
	public String galleryWritrForm() {
		
		return "galleryWriteForm";
	}
	
	@RequestMapping(value = "/galleryUpload", method = RequestMethod.POST)
	public String galleryUpload(@RequestPart("images") MultipartFile[] images, Gallery gallery) {
		
		List<String> imageNames = new ArrayList<>();
		
		for (MultipartFile image : images) {
	        // 이미지를 저장할려면 저장하는 로직 추가 

	        imageNames.add(image.getOriginalFilename());
	    }

	    gallery.setGalleryimage(imageNames.toArray(new String[0]));
	    
	    gs.insertGallery(gallery);
	    
		return "gallery";
	}
	
}
