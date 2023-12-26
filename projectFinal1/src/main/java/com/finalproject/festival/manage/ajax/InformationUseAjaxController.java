package com.finalproject.festival.manage.ajax;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.finalproject.festival.manage.service.InformationUseService;
import com.finalproject.festival.manage.service.NoticeService;


@Controller
public class InformationUseAjaxController {
	
	private final static String DEFAULT_PATH = "/resources/img/";

	@Autowired
	private InformationUseService informationUseService;
	
	
	@RequestMapping("/imgUpload2.ajax")
	@ResponseBody
	public Map<String,String> imgUpload(@RequestParam(value="informationUseImage") 
		MultipartFile multipartFile,HttpServletRequest request) 
			throws IOException {

		
		Map<String,String> result = new HashMap<>();
		
		
		if(!multipartFile.isEmpty()) { 
			
			String filePath = request.getServletContext().getRealPath(DEFAULT_PATH);

			UUID uid = UUID.randomUUID();
			String saveName = 
					uid.toString() + "_" + multipartFile.getOriginalFilename();
			
			File file = new File(filePath, saveName);
			
			multipartFile.transferTo(file);
			
			result.put("fileName",saveName);
			
		}
		
			System.out.println(result);
	
		return result;

	}
	
	
	
}
