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
import com.finalproject.festival.domain.GalleryBookMark;
import com.finalproject.festival.service.GalleryService;

@Controller
public class GalleryController {

	@Autowired
	GalleryService gs;

	@RequestMapping(value = "/gallery", method = RequestMethod.POST)
	public String gallery(Model m, String id) {

		if (id == null) {
			m.addAttribute("galleryList", gs.orderGallery("galleryDateLatest"));
			m.addAttribute("galleryList2", gs.orderGallery("galleryDatePopularity"));
		} else {
			List<GalleryBookMark> g = gs.galleryBookmark(id);
			List<Integer> gno = new ArrayList<Integer>();
			for (int i = 0; i < g.size(); i++) {
				gno.add(g.get(i).getGalleryno());
			}
			m.addAttribute("gallerybookmarkListno", gno);
			m.addAttribute("galleryList", gs.orderGallery("galleryDateLatest"));
			m.addAttribute("galleryList2", gs.orderGallery("galleryDatePopularity"));
		}

		return "gallery";

	}

	@RequestMapping("/galleryWriteForm")
	public String galleryWritrForm() {

		return "galleryWriteForm";
	}

	@RequestMapping("/galleryRedirect")
	public String galleryRedirect() {
		return "galleryRedirect";
	}

	@RequestMapping(value = "/galleryUpload", method = RequestMethod.POST)
	public String galleryUpload(@RequestPart("images") MultipartFile[] images, Gallery gallery,
			HttpServletRequest request) {

		String realPath = request.getServletContext().getRealPath("/resources/upload");

		List<String> imageNames = new ArrayList<>();

		for (MultipartFile image : images) {

			String original = image.getOriginalFilename();

			String extension = original.substring(original.length() - 4, original.length());

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

		return "redirect:galleryRedirect";
	}

	@RequestMapping(value = "/galleryOrderType", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<Gallery> galleryOrderType(@RequestParam("orderType") String orderType) {

		List<Gallery> gallerylist = gs.orderGallery(orderType);

		return gallerylist;

	}

	@RequestMapping(value = "/galleryheart", method = RequestMethod.POST)
	@ResponseBody
	public int galleryheart(@RequestParam("galleryno") int galleryno, @RequestParam("id") String id) {

		return gs.galleryheart(galleryno, id);

	}

	@RequestMapping(value = "/gallerybad", method = RequestMethod.POST)
	@ResponseBody
	public int gallerybad(@RequestParam("galleryno") int galleryno, @RequestParam("id") String id) {

		return gs.gallerybad(galleryno, id);

	}
	
	@RequestMapping(value = "/galleryCheckPassword", method = RequestMethod.POST)
	@ResponseBody
	public String galleryCheckPassword(@RequestParam("userInputPassword") String userInputPassword, @RequestParam("userId") String userId) {
		
		return gs.galleryCheckPassword(userInputPassword, userId);
		
	}
	
	@RequestMapping("/galleryDelete")
	@ResponseBody
	public String galleryDelete( @RequestParam("galleryno") int galleryno ) {
		
		gs.galleryDelete(galleryno);
		
		return "success";
	}
	
	@RequestMapping("/galleryModifyFormData")
	@ResponseBody
	public Gallery galleryModifyFormData( @RequestParam("galleryNo") int galleryNo, @RequestParam("userId") String userId ) {
		
		return gs.galleryModifyFormData(galleryNo);
		
	}
	
	@RequestMapping("/galleryModifyForm")
	public String galleryModifyForm( Gallery gallery, Model m ) {
		
		m.addAttribute("gallery", gallery);
		
		return "galleryModify";
	}
	
	@RequestMapping(value = "/galleryModify", method = RequestMethod.POST)
	public String galleryModify(@RequestPart("images") MultipartFile[] images, Gallery gallery,
			HttpServletRequest request) {
		
		if( !images[0].isEmpty() ) {
			
			String realPath = request.getServletContext().getRealPath("/resources/upload");

			List<String> imageNames = new ArrayList<>();

			for (MultipartFile image : images) {

				String original = image.getOriginalFilename();

				String extension = original.substring(original.length() - 4, original.length());

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
			
		}
		
		gs.galleryModify(gallery);

		return "redirect:galleryRedirect";
	}

}
