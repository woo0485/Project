package com.finalproject.festival.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.finalproject.festival.domain.Product;
import com.finalproject.festival.service.ProductService;

@Controller
public class ProductController {
	
	// 업로드한 파일 저장할 위치
	private final static String DEFAULT_PATH = "/resources/upload/";	
	
	@Autowired
	private ProductService sv;
	
	public void setProductService(ProductService sv) {
		this.sv = sv;
	}
	
	// 상품페이지 - 유로/ 무료 list 보여주기
	@RequestMapping(value = {"/productList", "/list"}, method= RequestMethod.GET)
	public String ProductList (Model m, 
			@RequestParam(value = "pageNum", required=false, defaultValue="1") int pageNum, 
			@RequestParam(value = "type", required=false, defaultValue="null")String type,
			@RequestParam(value = "keyword", required=false, defaultValue="null")String keyword) {
		
		Map<String, Object> modelMap = 
				sv.productList(pageNum, type, keyword);
		
		m.addAllAttributes(modelMap);
		
		return "productList";   
	}
	
	/*
	// 이미지 출력하기
	@RequestMapping(value = {"/productList", "/list"}, method= RequestMethod.GET)
	public String productImage (Model m) {
		
		Map<String, Object> modelMap = 
				sv.productList(pageNum, type, keyword);
		
		m.addAllAttributes(modelMap);
		
		return "productList";   
	}
	*/
	
	/* 이미지 출력하기 
	 * @GetMapping("/display")
    public ResponseEntity<byte[]> getFile(String fileName){

        ResponseEntity<byte[]> result = null;

        try{
            String srcFileName = URLDecoder.decode(fileName,"UTF-8");
            log.info("filename : "+srcFileName);
            File file = new File(uploadPath + File.separator + srcFileName);
            log.info("file : "+file);
            HttpHeaders header = new HttpHeaders();

            //MIME 타입 처리
            header.add("Content-Type", Files.probeContentType(file.toPath()));
            //File객체를 Path로 변환하여 MIME 타입을 판단하여 HTTPHeaders의 Content-Type에  값으로 들어갑니다.

            //파일 데이터 처리 *FileCopyUtils.copy 아래에 정리
            //new ResponseEntity(body,header,status)
            result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),header,HttpStatus.OK);
            
        }catch (Exception e){
            log.error(e.getMessage());
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return result;
	 * 
	 * 
	 */
	@RequestMapping("/productDetail")
	public String ProductDetail(Model m,  int productno,
			@RequestParam(value="pageNum", required=false, 
			defaultValue="1") int pageNum,
			@RequestParam(value="type", required=false,  
			defaultValue="null") String type,
			@RequestParam(value="keyword", required=false,
			defaultValue="null") String keyword) throws Exception {
		
		boolean searchOption = (type.equals("null") 
				|| keyword.equals("null")) ? false : true; 		
		
		// service productNo => productNo, isCount=> true productno에 해당하는 하나의 정보를 읽어옴.  isCount에 true를 주어 읽은 게시횟수를 1 증가시킨다.
		Product p = sv.getProduct(productno, true);
		
		m.addAttribute("product", p);	
		m.addAttribute("pageNum", pageNum);
		m.addAttribute("searchOption", searchOption);
		
		if(searchOption) {
			m.addAttribute("type", type);
			m.addAttribute("keyword", keyword);
		}
		return "productDetail";
	}
	
	// 1) 게시글 쓰기폼에서 들어오는....
	@RequestMapping(value="/writeProcess", method=RequestMethod.POST)
	public String insertProduct(
			HttpServletRequest request,
			int productprice, String productname, String productcontent, String adminpassword,
			@RequestParam(value="productimage", required=false) MultipartFile multipartFile, 
			String productlocation, Timestamp productopendate, Timestamp productclosedate,
			int productticketcount, int productremainticketcount) 
					throws IOException {	
		
		System.out.println("originName : " + multipartFile.getOriginalFilename());
		 System.out.println("name : " + multipartFile.getName());
		
		Product p = new Product();
		p.setProductprice(productprice);
		p.setProductname(productname);
		p.setProductcontent(productcontent);
		p.setAdminpassword(adminpassword);
		p.setProductlocation(productlocation);
		p.setProductopendate(productopendate);
		p.setProductclosedate(productclosedate);
		p.setProductticketcount(productticketcount);
		p.setProductremainticketcount(productremainticketcount);
		
		System.out.println("컨트롤러글쓰기 폼에서 -productticketcount : " + p.getProductticketcount());	
		System.out.println("컨트롤러글쓰기 폼에서 -productremainticketcount : " + p.getProductremainticketcount());				
		
		if(!multipartFile.isEmpty()) { // 업로드된 파일 데이터가 존재하면 Request 객체를 이용해 파일이 저장될 실제 경로를 구한다.
			String filePath = 
					request.getServletContext().getRealPath(DEFAULT_PATH);
			
			UUID uid = UUID.randomUUID();
			String saveName = 
					uid.toString() + "_" + multipartFile.getOriginalFilename();
			
			File file = new File(filePath, saveName);
			System.out.println("insertBoard - newName : " + file.getName());			
			
			multipartFile.transferTo(file);
			// 업로드된 파일 명을 Board 객체에 저장한다.
			p.setProductimage(saveName);
		}
		
		// 서비스에서 게시 글 정보를 게시 글 테이블에 추가한다.
		sv.insertProduct(p);

		System.out.println("insert productno : " + p.getProductno());		
	
		return "redirect:productList";
	}
	
	// 게시 글 쓰기 폼에서 글쓰기 요청에서 이미지파일 -multiparthttpservletrequest 이용함
	@RequestMapping(value="/addProcess", method=RequestMethod.POST)
	public String addProduct (MultipartHttpServletRequest request) 
			throws IOException {
		
		MultipartFile multipartFile = request.getFile("productimage");
		System.out.println("originName : " + multipartFile.getOriginalFilename());
		System.out.println("name : " + multipartFile.getName());
		
		Product p = new Product();
		p.setProductname(request.getParameter("productname"));
		p.setProductcontent(request.getParameter("productcontent"));
		p.setAdminpassword(request.getParameter("adminpassword"));
		p.setProductlocation(request.getParameter("productlocation"));
		p.setProductprice(Integer.parseInt(request.getParameter("productprice")));
		p.setProductticketcount(Integer.parseInt(request.getParameter("productticketcount")));
		p.setProductremainticketcount(Integer.parseInt(request.getParameter("productremainticketcount")));
	
		java.sql.Timestamp t = java.sql.Timestamp.valueOf(request.getParameter("productopendate"));
		p.setProductopendate(t);
		
		java.sql.Timestamp tt = java.sql.Timestamp.valueOf(request.getParameter("productclosedate"));
		p.setProductclosedate(tt);

		
		System.out.println("컨트롤러글쓰기 폼에서 들어오는 글쓰기 요청에서-productticketcount : " + p.getProductticketcount());	
		System.out.println("컨트롤러글쓰기 폼에서 들어오는 글쓰기 요청에서-productremainticketcount : " + p.getProductremainticketcount());			
		
		if(!multipartFile.isEmpty()) { // 업로드된 파일 데이터가 존재하면
			
			// Request 객체를 이용해 파일이 저장될 실제 경로를 구한다.
			String filePath = 
					request.getServletContext().getRealPath(DEFAULT_PATH);	
		
			UUID uid = UUID.randomUUID();
			String saveName = 
					uid.toString() + "_" + multipartFile.getOriginalFilename(); 
			
			File file = new File(filePath, saveName);
			System.out.println("addBoard - newName : " + file.getName());
			
			// 업로드한 파일을 upload 폴더로 저장한다.
			multipartFile.transferTo(file);
			
			// 업로드된 파일 명을 product 객체에 저장한다.
			p.setProductimage(saveName);
		}		
			sv.insertProduct(p);
		
		return "redirect:boardList";
	}	
	// multipart 끝
	
	/////////////////////////////  여기서부터는 수정하기  //////////////////////
	@RequestMapping(value = "/update")
	public String updateProduct(Model m, HttpServletResponse response, PrintWriter out, 
			int productno,  String adminpassword,
			@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum, 
			@RequestParam(value = "type", required = false, defaultValue = "null") String type,
			@RequestParam(value = "keyword", required = false, defaultValue = "null") String keyword) throws Exception {
		
		boolean result = sv.isPassCheck(productno, adminpassword);
		if(! result) {
			response.setContentType("text/html; charset=utf-8");				
			out.println("<script>");
			out.println("	alert('컨트롤러 get - 비밀번호가 맞지 않습니다.');");
			out.println("	history.back();");
			out.println("</script>");

			return null;
		}
		
		boolean searchOption = (type.equals("null") || keyword.equals("null")) ? false : true;
		
		// no에 해당하는 정보 글 하나를 읽어오지만, 두번째 인수로 false를 지정해서 읽은 횟수를 증가시키지는 않는다.
		Product p = sv.getProduct(productno, false);
		
		m.addAttribute("product",p);
		m.addAttribute("pageNum", pageNum);
		m.addAttribute("searchOption", searchOption);
		
		if(searchOption) {
			m.addAttribute("type", type);
			m.addAttribute("keyword", keyword);
		}
		return "updateForm";	
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updateProduct(Model m, HttpServletResponse response, PrintWriter out, 
			Product p,
			RedirectAttributes reAttrs, 
			@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum, 
			@RequestParam(value = "type", required = false, defaultValue = "null") String type,
			@RequestParam(value = "keyword", required = false, defaultValue = "null") String keyword) throws Exception {
		
		boolean result = sv.isPassCheck(p.getProductno(), p.getAdminpassword());
		
		if(! result) {
			response.setContentType("text/html; charset=utf-8");				
			out.println("<script>");
			out.println("	alert(' 컨트롤러 post -비밀번호가 맞지 않습니다.');");
			out.println("	history.back();");
			out.println("</script>");

			return null;
		}
		
		boolean searchOption = (type.equals("null") || keyword.equals("null")) ? false : true;
		
		//  productService를 이용해 수정한다.
		sv.updateProduct(p);
		
		reAttrs.addAttribute("searchOption", searchOption);
		
		if(searchOption) {
			reAttrs.addAttribute("type", type);
			reAttrs.addAttribute("keyword",keyword);
		}
		reAttrs.addAttribute("pageNum", pageNum);
		return "redirect:productList";	
	}

	@RequestMapping({"/delete", "deleteProduct"})
	public String deleteProduct (HttpServletResponse response, 
			PrintWriter out, int productno,
			RedirectAttributes reAttrs, 
			@RequestParam(value="pageNum", required=false, 
				defaultValue="1") int pageNum,
			@RequestParam(value="type", required=false,  
				defaultValue="null") String type,
			@RequestParam(value="keyword", required=false,
				defaultValue="null") String keyword) throws Exception {
	
		boolean searchOption = (type.equals("null")	|| keyword.equals("null")) ? false : true; 
		sv.deleteProduct(productno);
		
		reAttrs.addAttribute("searchOption", searchOption);
		
		if(searchOption) {
			reAttrs.addAttribute("type", type);
			reAttrs.addAttribute("keyword", keyword);			
		}
		reAttrs.addAttribute("pageNum", pageNum);
		return "redirect:productList";
	}
	
	
	
}