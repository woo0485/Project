package com.finalproject.festival.product.ajax;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finalproject.festival.service.ProductService;

@Controller
public class ProductAjaxController {

	@Autowired
	ProductService sv;
	
	// 북마크기능 - 비동기 ajax 1월 4일
	/*@RequestMapping("/bookmark.ajax")
	@ResponseBody
	public Map<String, Integer> bookmark(int productno, int productbookmarkcount) {
		return sv.Bookmark(productno, productbookmarkcount);
	} */
}
