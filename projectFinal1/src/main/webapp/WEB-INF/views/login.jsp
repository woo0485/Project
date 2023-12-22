<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div class="row mt-5">
	<div class="col-10 offset-1 mt-5">
	
	 <div class="row  offset-4 container text-center">
	 	<div class="col-4 align-items-center">
	 	
		 	<form action="loginFrom" method="post" id="loginFrom">
				<div class="form-floating mb-3">
				  <input type="text" class="form-control" id="id" placeholder="아이디를 입력해 주세요">
				  <label for="floatingInput">아이디</label>
				</div>
				<div class="form-floating">
				  <input type="password" class="form-control" id="password" placeholder="비밀번호를 입력해 주세요">
				  <label for="floatingPassword">비밀번호</label>
				</div>
				<span id="loginMag"></span>
				<div class="d-grid gap-2 mt-2">
				<input type="button" id="loginBtn" value="로그인" >
				</div>
		 	</form>
		 	
				<a href="memberJoin">회원 가입</a> 
				<a href="#">아이디/비밀번호 찾기</a>
				<div id="my-signin2"></div>
		 	
	 	</div>
	 </div>
	
	
	</div>
</div>