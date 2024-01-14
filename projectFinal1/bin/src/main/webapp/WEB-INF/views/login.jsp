<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="row mt-5 border-top" style="height: 500px;">
	<div class=" mt-5">
	
	<c:if test="${empty sessionScope.id }">
		<div class="row mt-5 container text-center">
			<div class="col offset-1 mt-5 align-items-center">
			
				<form action="loginFrom" method="post" id="loginFrom">
					<div class="row offset-3">
						<div class="col-2">
							<p>아이디<p>
						</div>
						<div class="col-4">
							<div class="mb-4 border-bottom">
								<input type="text" class="form-control border-0" id="id"  autocomplete="username"
									placeholder="아이디">
							</div>
						</div>
					</div>
					<div class="row offset-3">
						<div class="col-2">
							<label for="password">비밀번호</label>
						</div>
						<div class="col-4 mb-3">
							<div class="border-bottom">
								<input type="password" class="form-control border-0" id="password" autocomplete="current-password"
									placeholder="비밀번호">
							</div>
						</div>
					</div>
					<div class="row offset-4 ">
						<span id="loginMag1" class="text-start"></span>
					</div>	
					<div class="row">
						<div class="d-grid col-3 offset-4 mt-3">
							<input type="button" id="loginBtn" class="btn btn-outline-dark" value="로그인"/>
						</div>
					</div>
				</form>
				<div class="row mt-5">
					<div class="offset-3 col-2">
						<a href="memberJoinPage" class="text-decoration-none link-dark fw-bold">회원 가입</a> 
					</div>
					<div class="col-4">
						<a href="idPasswordFind" class="text-decoration-none link-dark fw-bold">아이디/비밀번호 찾기</a>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${not empty sessionScope.id }">
		<div class="row">
			<img alt="" src="resources/img/logo.jpg">
		</div>
		<div class="row">
			<h2>회원님은 현재 로그인중 입니다</h2>
		</div>
		<div class="row">
			<div class="col">
				<a href="main" class="btn btn-outline-dark ">메인 으로</a>
			</div>
			<div class="col">
				<a href="logout" class="btn btn-outline-dark ">로그아웃</a>
			</div>
		</div>
	</c:if>
	</div>
</div>