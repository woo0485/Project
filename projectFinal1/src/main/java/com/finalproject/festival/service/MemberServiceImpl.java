package com.finalproject.festival.service;


import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.finalproject.festival.dao.BookmarkDao;
import com.finalproject.festival.dao.MemberDao;
import com.finalproject.festival.domain.Admin;
import com.finalproject.festival.domain.Bookmark;
import com.finalproject.festival.domain.Gallery;
import com.finalproject.festival.domain.Main;
import com.finalproject.festival.domain.Member;
import com.finalproject.festival.domain.News;
import com.finalproject.festival.domain.Product;
import com.finalproject.festival.domain.Search;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;
	@Autowired
	private BookmarkDao bookmarkDao;
	

	@Override
	public int userLoginCount(String id) {
		
		return memberDao.userLoginCount(id);
	}

	@Override//로그인확인
	public Map<String, Object> loginCheck(String id) {
	
	
		return memberDao.loginCheck(id);
	}


	@Override
	public int joinIdCheck(String id) {
		int idCheck = memberDao.joinIdCheck(id);
		return idCheck;
	}


	@Override
	public int joinEmailCheck(String email) {
		int emailCheck = memberDao.emailUserCount(email);
		return emailCheck;
	}


	@Override
	public void joinMember(Member m) {
		memberDao.joinMember(m);
		
	}

	@Override
	public void newMemberCoupon(String id) {
		memberDao.newMemberCoupon(id);
		
	}


	@Override
	public String userFindId(Map<String, Object> userfind) {
		return memberDao.userFindId(userfind);
	}


	@Override
	public int userFindPassword(Map<String, Object> map) {
		
		return memberDao.userFindPassword(map);
	}


	@Override
	public int userNewPassword(Map<String, Object> newPassword) {
		
		return memberDao.userNewPassword(newPassword);
	}
		////////////////////////////////////////////////////////

	@Override
	public void adminUserAdd(Map<String, Object> adminUserAdd) {
		memberDao.adminUserAdd(adminUserAdd);
	}


	@Override
	public List<Admin> adminUserSelect() {
		
		return memberDao.adminUserSelect();
	}

		////////////////////////////////////////////////////////

	@Override
	public List<Product> mainProductCarousel() {
		
		return memberDao.mainProductCarousel();
	}

		@Override
		public List<Product> mainSearchProduct(String keyword) {
			return memberDao.mainSearchProduct(keyword);
		}

		@Override
		public List<News> mainSearchNews(String keyword) {
			return memberDao.mainSearchNews(keyword);
		}

		@Override
		public List<Gallery> mainSearchGallery(String keyword) {
			return memberDao.mainSearchGallery(keyword);
		}
		
	/************************search***************************/
		
		@Override
		public void searchKeyword(String keyword) {
			String searchKeyword="";
			
			String koreanRegex = "^[가-힣]*$";
	        
	        if (keyword.matches(koreanRegex)){
				searchKeyword=keyword;
				
			}	
		int keywordCount = memberDao.searchKeywordFind(searchKeyword);
		
		if(keywordCount == 0) {
			memberDao.searchKeywordInsert(searchKeyword);
		}else {
			
			memberDao.searchKeywordCount(searchKeyword);
		}
			
		}

		@Override
		public List<Search> mainSearchSelect() {
		    LocalDateTime now = LocalDateTime.now();
		    int nowMonth = now.getMonthValue();

		    SimpleDateFormat dateFormat = new SimpleDateFormat("MM");
		    String monthString = "";
		    int searchMonth = 0;

		    List<Search> monthList = memberDao.searchKeywordSelect();
		    List<Search> searchList = new ArrayList<>();

		    for (Search list : monthList) {
		        Timestamp month = list.getSearchdate();
		        monthString = dateFormat.format(month);
		        searchMonth = Integer.parseInt(monthString);

		        if (nowMonth == searchMonth) {
		            searchList.add(list);
		        }
		    }

		    System.out.println(nowMonth + "-----" + searchMonth);

		    return searchList;
		}
		
	/************************bookmark***************************/
		
		@Override
		public int bookmarkChange(String id, int productno) {
			
			System.out.println(id+"-----serviec-----"+productno);
			
			int result = bookmarkDao.selectBookmarkCount(id,productno);
			System.out.println("result"+result);
		
			if(result == 0) {
				bookmarkDao.productBookmarkCount(productno);
				bookmarkDao.bookmarkInsert(id,productno);
			}else {
				bookmarkDao.productBookmarkCountDelete(productno);
				bookmarkDao.bookmarkDelete(id,productno);
			}
			
			return bookmarkDao.productBookmarkSelect(productno);
		}

	

	


	




}
