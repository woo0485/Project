package com.finalproject.festival.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.print.attribute.standard.Media;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.finalproject.festival.domain.Gallery;
import com.finalproject.festival.service.GalleryService;

@Controller
public class GalleryController {
	
	@Autowired
	GalleryService gs;
	
	@RequestMapping("/gallery")
	public String gallery (Model m) {

			m.addAttribute("galleryList",gs.orderGallery("galleryDateLatest"));
			m.addAttribute("galleryList2",gs.orderGallery("galleryDatePopularity"));
			
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
	
	@RequestMapping(value = "/galleryOrderType", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<Gallery> galleryOrderType( @RequestParam("orderType") String orderType) {
		
		List<Gallery> gallerylist = gs.orderGallery(orderType);	
		
		return gallerylist;
		
	}
	
	@RequestMapping(value = "/galleryheart", method = RequestMethod.POST)
	@ResponseBody
	public int galleryheart( @RequestParam("galleryno") int galleryno) {
		
		return gs.galleryheart(galleryno);
		
	}
	
}
