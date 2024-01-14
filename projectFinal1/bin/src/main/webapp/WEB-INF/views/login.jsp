<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="row mt-5">
	<div class="col-10 offset-1 mt-5">

		<div class="row mt-5 container text-center">
			<div class="col align-items-center">

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
						<div class="col-4">
							<div class="mb-5 border-bottom">
								<input type="password" class="form-control border-0" id="password" autocomplete="current-password"
									placeholder="비밀번호">
							</div>
						</div>
					</div>
						<span id="loginMag"></span>
						
					<div class="d-grid col-3 offset-4 ">
						<input type="button" id="loginBtn" class="btn btn-outline-dark" value="로그인"/>
					</div>
				</form>
				<div class="row mt-5">
					<div class="offset-3 col-2">
						<a href="memberJoinPage">회원 가입</a> 
					</div>
					<div class="col-3">
						<a href="idAndPasswordFind">아이디/비밀번호 찾기</a>
					</div>
				</div>
				

			</div>
		</div>


	</div>
</div>