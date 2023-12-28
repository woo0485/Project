package com.finalproject.festival.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class GalleryController {
	
	@RequestMapping("/gallery")
	public String gallery () {
		
		return "gallery";
	}
	
	@RequestMapping("/galleryWriteForm")
	public String galleryWritrForm() {
		
		return "galleryWriteForm";
	}
	
	@RequestMapping(value = "/galleryUpload", method = RequestMethod.POST)
	public String galleryUpload(@RequestPart("images") MultipartFile[] images, @RequestParam("title") String title, @RequestParam("content") String content) {
		
		System.out.println(title);
		System.out.println(content);
		
		for (MultipartFile image : images) {
            
            System.out.println("Image Name: " + image.getOriginalFilename());

        }
		
		return "main";
	}

}
