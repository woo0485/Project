<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div class="row">
	<div class="col-10 offset-1">
	
		<div class="row">
			<div class="col">
			<h1 class="my-5">정보 약관 동의</h1>
				<span>
				<i id="allLoginConfrimCheck" class="LoginConfrim bi bi-check-circle-fill me-2"  data-code="false" style="font-size:25px; color: lightgray; " ></i>
				전체동의
				</span>
			
			
			<form action="memberJoinForm" id="memberJoinConfrimFrom">  
				<div class="row">
				  <span>
				  	<i id="LoginConfrimCheck1" class="LoginConfrim LoginConfrim2 bi bi-check-circle-fill me-2" data-code="false" style="font-size:25px; color: lightgray; " ></i>
				  	회원가입약관(필수)
				  </span>
				  
				  
				  <textarea class="form-control mb-5"  rows="5" style="height: 300px;">
	 
	
				  
				  </textarea>
				  
				</div>
				<div class="row">
				 <span>
				  	<i id="LoginConfrimCheck2" class="LoginConfrim LoginConfrim2 bi bi-check-circle-fill me-2" data-code="false" style="font-size:25px; color: lightgray; " ></i>
				  	전자금융거래이용약관(필수)
				 </span>
				  
				  <textarea class="form-control mb-5"  rows="3" style="height: 300px;">
	
				  
				  </textarea>
				 
				</div>
				
				<div class="row">
				 
				  <span>
				  	<i id="LoginConfrimCheck3" class="LoginConfrim LoginConfrim2 bi bi-check-circle-fill me-2" data-code="false" style="font-size:25px; color: lightgray; " ></i>
				  	개인정보처리방침(필수)
				  </span>
				 
				  <textarea class="form-control mb-5"  rows="3"  style="height: 300px;">
				 
	
				  
				  </textarea>
				
				</div>
				<span id="LoginConfrimCheckMsg"></span>
				<div class="offset-2 row mt-5">
					<div class="col">
						<a href="main" class="btn btn-primary ">돌아가기</a>
					</div>
					<div class="offset-1 col">
						<input type="button" value="동의하고 가입하기" class="btn btn-primary " id="joinConfirmBtn">
					</div>
				</div>
			</form>	
		</div>
	
	</div>	
	
	
	
	 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	</div>
</div>