package com.finalproject.festival.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.finalproject.festival.domain.Product;
import com.finalproject.festival.service.ProductService;

@Controller
public class ProductController {
	
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
	public String insertProduct(HttpServletRequest request,
			String productprice, String productname, String productcontent, String adminpassword,
			String productimage, String productlocation, Timestamp productopendate, Timestamp productclosedate,
			String productticketcount, String productremainticketcount) 
					throws IOException {	
		
		Product p = new Product();
		p.setProductimage(productimage);
		p.setProductprice(productprice);
		p.setProductname(productname);
		p.setProductcontent(productcontent);
		p.setAdminpassword(adminpassword);
		p.setProductlocation(productlocation);
		p.setProductopendate(productopendate);
		p.setProductclosedate(productclosedate);
		p.setProductticketcount(productticketcount);
		p.setProductremainticketcount(productremainticketcount);
		
		// 서비스에서 게시 글 정보를 게시 글 테이블에 추가한다.
		sv.insertProduct(p);

		System.out.println("insert productno : " + p.getProductno());		
	
		return "redirect:productList";
	}
	
	@RequestMapping(value = "/update")
	public String updateProduct(Model m, HttpServletResponse response, PrintWriter out, int productno, String adminpassword,
			@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum, 
			@RequestParam(value = "type", required = false, defaultValue = "null") String type,
			@RequestParam(value = "keyword", required = false, defaultValue = "null") String keyword) throws Exception {
		
		boolean result = sv.isPassCheck(productno, adminpassword);
		
		if(! result) {
			response.setContentType("text/html; charset=utf-8");				
			out.println("<script>");
			out.println("	alert('비밀번호가 맞지 않습니다.');");
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
	public String updateProduct(Model m, HttpServletResponse response, PrintWriter out, Product p,
			RedirectAttributes reAttrs, 
			@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum, 
			@RequestParam(value = "type", required = false, defaultValue = "null") String type,
			@RequestParam(value = "keyword", required = false, defaultValue = "null") String keyword) throws Exception {
		
		boolean result = sv.isPassCheck(p.getProductno(), p.getAdminpassword());
		
		if(! result) {
			response.setContentType("text/html; charset=utf-8");				
			out.println("<script>");
			out.println("	alert('비밀번호가 맞지 않습니다.');");
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

	public String deleteProduct (HttpServletResponse response, 
			PrintWriter out, int productno, String adminpassword,
			RedirectAttributes reAttrs, 
			@RequestParam(value="pageNum", required=false, 
				defaultValue="1") int pageNum,
			@RequestParam(value="type", required=false,  
				defaultValue="null") String type,
			@RequestParam(value="keyword", required=false,
				defaultValue="null") String keyword) throws Exception {
		
		boolean result = sv.isPassCheck(productno, adminpassword);
		
		if(! result) {
			response.setContentType("text/html; charset=utf-8");				
			out.println("<script>");
			out.println("	alert('비밀번호가 맞지 않습니다.');");
			out.println("	history.back();");
			out.println("</script>");

			return null;
		}
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