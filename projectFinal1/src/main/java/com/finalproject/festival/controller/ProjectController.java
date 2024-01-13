package com.finalproject.festival.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finalproject.festival.domain.Gallery;
import com.finalproject.festival.domain.Member;
import com.finalproject.festival.domain.News;
import com.finalproject.festival.domain.Product;
import com.finalproject.festival.domain.Search;
import com.finalproject.festival.service.GalleryService;
import com.finalproject.festival.service.MailService;
import com.finalproject.festival.service.MemberService;
import com.finalproject.festival.service.MessageServiceImpl;
import com.finalproject.festival.service.NewsService;



@Controller
public class ProjectController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private MailService mailService;
	@Autowired
	private MessageServiceImpl phoneMessageService;
	@Autowired
	private PasswordEncoder passwordEncoder;
	@Autowired
	private GalleryService galleryService;
	@Autowired
	private NewsService newsService;
	
	
	
	@RequestMapping("/login")//로그인 페이지로 이동
	public String loginFrom (){
		return "login";
	}
	
	@RequestMapping("/logout")//로그아웃
	public String logout(HttpSession session) {
		session.removeAttribute("id");
		session.removeAttribute("userType");
		return "redirect:main";
	}
	
	@ResponseBody
	@RequestMapping(value = "/headerKeyword", method = RequestMethod.GET, produces = "application/json")
    public List<Search> headerKeyword() {
        return memberService.mainSearchSelect();
    }
	
	
	
	
	@RequestMapping("/main")//메인페이지로 이동
	public String main (Model model) {
		List<Gallery>galleryList = galleryService.gallery();
		List<News>newsList =  newsService.newslist();
		List<Product>productList = memberService.mainProductCarousel();
		
		System.out.println(productList);
		model.addAttribute("galleryList",galleryList);
		model.addAttribute("newsList",newsList);
		model.addAttribute("productList", productList);
		
		return "main";
	}
	
	@RequestMapping("/mainSearch")
	public String mainSearchPage(String searchWord, Model model) {
		
		
		memberService.searchKeyword(searchWord);
		
		String keyword = searchWord.replaceAll("\\s", "");//정규식으로 공백제거
		
		List<Product> mainSearchProduct = memberService.mainSearchProduct(keyword);
		
		List<News> mainSearchNews = memberService.mainSearchNews(keyword);
		
		List<Gallery> mainSearchGallery = memberService.mainSearchGallery(keyword);
		
		System.out.println("mainSearchProduct"+mainSearchProduct);
		
		model.addAttribute("mainSearchProduct",mainSearchProduct);
		model.addAttribute("mainSearchNews",mainSearchNews);
		model.addAttribute("mainSearchGallery",mainSearchGallery);
		model.addAttribute("keyword",keyword);
		
	
	
		return "mainSearchPage";
	}
	
	
	
	/********************************** member ****************************************/
	
	

	
	@RequestMapping("/memberJoinPage")//가입 정보동의약관
	public String memberJoinPage(){
		return"memberJoinConfirm";
	}
	
	@RequestMapping("/memberJoinForm")//회원가입페이지
	public String memberJoinForm(){
		return"memberJoinForm";
	}
	
	@RequestMapping("/joinSuccess")
	public String joinSuccess() {
		return "joinSuccess";
	}
	
	@RequestMapping("/privacyPolicyPage")//정보처리방침
	public String privacyPolicyPage() {
		return "privacyPolicyPage";
	}
	
	@RequestMapping("/termsOfUse")//정보처리방침
	public String termsOfUsePage() {
		return "termsOfUsePage";
	}
	
	@RequestMapping("/copyrightPolicy")//정보처리방침
	public String copyrightPolicyPage() {
		return "copyrightPolicyPage";
	}
	
	@RequestMapping("/idPasswordFind")//아이디비번찾기페이지
	public String idAndPasswordFindPage() {
		return "idPasswordFindPage";
	}
	


	
	
	//로그인 
	@ResponseBody
	@RequestMapping(value = "/loginForm", method = RequestMethod.POST, consumes = "application/json")
	public int loginCheck(HttpSession session, @RequestBody Map<String, String> param) {
			
		
		String id = (String)param.get("id");
		String password = (String)param.get("password");

		int resultCount = memberService.userLoginCount(id);
		int result = -1;

		
			
		if(resultCount == 1) {
			Map<String, Object> user = memberService.loginCheck(id);
			
			System.out.println("login-map:::::"+user);
			String userId = (String)user.get("id");
			String userPassword =(String)user.get("password");
			
			if(userId.equals(id) && passwordEncoder.matches(password,userPassword )) {

				session.setAttribute("id", id);
				session.setAttribute("name", (String)user.get("name"));
				session.setAttribute("userType", (String)user.get("userType"));
				session.setAttribute("email", (String)user.get("email"));
				result = 1;
			}
			}
			else {
					result = 0;
				  }

		return result;
			
		
		};	
		
		/*
		//구글 로그인
		@RestController
		@CrossOrigin("*")
		public class LoginController {
		    @Value("${google.client.id}")
		    private String googleClientId;
		    @Value("${google.client.pw}")
		    private String googleClientPw;

		    @RequestMapping(value="/api/v1/oauth2/google", method = RequestMethod.POST)
		    public String loginUrlGoogle(){
		        String reqUrl = "https://accounts.google.com/o/oauth2/v2/auth?client_id=" + googleClientId
		                + "&redirect_uri=http://localhost:8080/api/v1/oauth2/google&response_type=code&scope=email%20profile%20openid&access_type=offline";
		        return reqUrl;
		    }
		}
		*/
	
	//핸드폰인증번호 
	@ResponseBody
	@RequestMapping(value = "/phoneCheckMessage",method = RequestMethod.POST)
	public String phoneCheckMessage(String phonenumber) {
		
		
		String messageResult =phoneMessageService.phoneMessage(phonenumber);
		
		return messageResult;
	}
		
	
	// 아이디 중복확인 
	@ResponseBody
	@RequestMapping(value = "/joinIdCheck", method = RequestMethod.POST)
	public int joinIdCheck(String id) {
	    
	    System.out.println("아이디 중복확인 controller-id-"+ id);
   
	    int idCheck = memberService.joinIdCheck(id);
	    
	    System.out.println("idCheck"+idCheck);
	    return idCheck;
	};
	//이메일 중복확인
	/* String email = (String)param.get("email"); */
	@ResponseBody
	@RequestMapping(value = "/joinEmailCheck",method = RequestMethod.POST)
	public int joinEmailCheck(String email) {
		int result = 0;
		result =memberService.joinEmailCheck(email);
		return result;
	}
	

	//이메일 인증
	@ResponseBody
	@RequestMapping(value = "/mailCheck", method = RequestMethod.POST)
	public String mailCheck(String email) {
		System.out.println("이메일 인증 이메일 : " + email);
		return mailService.joinEmail(email);
	}
		
	
	
		
	//회원가입 
	@ResponseBody
	@RequestMapping(value = "/memberJoin", method = RequestMethod.POST)
	public String memberJoin(@RequestParam("joinName")String name,@RequestParam("joinId")String id,@RequestParam("phoneNumber")String phone,
							 @RequestParam("joinPasswordCheck")String password,@RequestParam("zipcode")String zipcode,
							 @RequestParam("address1")String address1,@RequestParam("address2")String address2,
							 @RequestParam("eMailId")String eMailId,@RequestParam("eMailDomain")String eMailDomain){
		
					String email = eMailId +"@"+eMailDomain;
					String passEncode = passwordEncoder.encode(password);
					
					String phonenumber = phone.replaceFirst("(\\d{3})(\\d{4})(\\d{4})", "$1-$2-$3");
					
						Member member =new Member();
						member.setName(name);
						member.setId(id);
						member.setPhonenumber(phonenumber);
						member.setPassword(passEncode);
						member.setZipcode(zipcode);
						member.setAddress1(address1);
						member.setAddress2(address2);
						member.setEmail(email);
						
						memberService.joinMember(member);
						memberService.newMemberCoupon(id);
						
		
		return "redirect:login";
	}
	

	//아이디 찾기
	@ResponseBody
	@RequestMapping(value = "/userFindId", method = RequestMethod.POST)
	public String userFindId (@RequestBody Map<String, Object>param) {
		Map<String, Object> userfind = new HashMap<>();
		userfind.put("email", (String)param.get("email"));
		userfind.put("name", (String)param.get("name"));
	
	String findId =	memberService.userFindId(userfind);
	
	return findId;
	}
	
	//인증번호만
	@ResponseBody
	@RequestMapping(value = "/userFindCoed" ,method = RequestMethod.POST)
	public String userFindCoed(@RequestBody Map<String, Object> param){
	return 	mailService.findeMailCheck((String)param.get("email"));
	}
	
	
	//비밀번호 찾기
	@ResponseBody
	@RequestMapping(value = "/userFindPassword" ,method = RequestMethod.POST)
	public String userFindPassword(@RequestBody Map<String, Object> param) {
		String findEmailCheckCode ="";
		Map< String , Object> map =new HashMap<>();
		map.put("id", param.get("id"));
		map.put("email", param.get("email"));
		
		int memberCherck = memberService.userFindPassword(map);
		
		if(memberCherck == 1) {
			findEmailCheckCode = mailService.findeMailCheck((String) param.get("email"));
		}
		return findEmailCheckCode;
	}
	
	
	//새로운비밀번호
	@ResponseBody
	@RequestMapping(value = "/userNewPassword",method = RequestMethod.POST)
	public int userNewPassword(@RequestBody Map<String, Object> param) {
		
		Map<String, Object>newPassword = new HashMap<String, Object>();
		String newPasswordString =(String)param.get("password");
		String id = (String)param.get("id");
		String password = passwordEncoder.encode(newPasswordString);
		
		newPassword.put("password", password);
		newPassword.put("id", id);
	
		System.out.println("newPassword----"+newPassword);
		 int result =  memberService.userNewPassword(newPassword);
		
		return result;
	}
	
	/******************************** admin *************************************/
	
	//adminUser
	@RequestMapping("/adminUser")
	public String adminUser(Model model) {
		
		
		model.addAttribute("adminList",memberService.adminUserSelect());
		
		return "adminUser";
	}
	
	//adminAdd
	@RequestMapping(value = "/adminUserAdd",method = RequestMethod.POST )
	public String adminUserAdd(String adminname,String adminid,String adminpassword) {
		Map<String, Object> adminUserAdd = new HashMap<>();
		String password = passwordEncoder.encode(adminpassword);
		
		adminUserAdd.put("adminname", adminname);
		adminUserAdd.put("adminid", adminid);
		adminUserAdd.put("adminpassword", password);
		
		memberService.adminUserAdd(adminUserAdd);
		return "redirect:adminUser";
	}
	
	/******************************** bookmark *************************************/
	
	
	@ResponseBody
	@RequestMapping(value = "/bookmarkChange" ,method = RequestMethod.POST)
	public int bookmarkChange(String id, int productno){
		
		System.out.println(id+"-----controller-----"+productno);
		
		
		
		 return memberService.bookmarkChange(id, productno);
	}
	
}
