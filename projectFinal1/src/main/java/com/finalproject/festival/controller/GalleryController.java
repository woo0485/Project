package com.finalproject.festival.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
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
	public String gallery (Model m) {
		
		m.addAttribute("galleryList",gs.gallery());
		
		for( Gallery g : gs.gallery() ) {
			System.out.println(g.getGalleryimage());
		}
		
		return "gallery";
	}
	
	@RequestMapping("/galleryWriteForm")
	public String galleryWritrForm() {
		
		
		
		return "galleryWriteForm";
	}
	
	@RequestMapping(value = "/galleryUpload", method = RequestMethod.POST)
	public String galleryUpload(@RequestPart("images") MultipartFile[] images, Gallery gallery, HttpServletRequest request) {
		
		String realPath = request.getServletContext().getRealPath("/resources/upload");
		
		List<String> imageNames = new ArrayList<>();
		
		for (MultipartFile image : images) {
			
			String original = image.getOriginalFilename();
			
			String extension = original.substring(original.length()-4, original.length());
			
			System.out.println(extension);
			
            String fileName = UUID.randomUUID().toString() + extension; 
            
            String filePath = realPath + java.io.File.separator;
            
            try {
				image.transferTo(new java.io.File(filePath + fileName));
				System.out.println(filePath);
				System.out.println("저장완료");
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}

	        imageNames.add(fileName);
	    }
		
	    gallery.setGalleryimage(imageNames.toArray(new String[0]));
	    
	    gs.insertGallery(gallery);
	    
		return "redirect:gallery";
	}
	
}
