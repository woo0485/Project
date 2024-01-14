<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div class="row my-5 py-5" style="height: 500px;">
	<div class="col-10 offset-1">
	    
		    <ul class="nav nav-tabs  nav-justified" id="myTab" role="tablist">
			  <li class="nav-item" role="presentation">
			    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">아이디 찾기</button>
			  </li>
			  <li class="nav-item" role="presentation">
			    <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">비밀번호 찾기</button>
			  </li>
			  
			</ul>
			<div class="tab-content mt-5" id="myTabContent">
			  <div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
				아이디 찾기1
				
				<div class="row my-5 container text-center">
					<div class="col align-items-center">

						<form action="loginFrom" method="post" id="loginFrom">
							<div class="row offset-3 mt-5">
								<div class="col-2">
									<p>이메일<p>
								</div>
								<div class="col-6">
									<div class="mb-4 border-bottom">
										<input type="text" class="form-control border-0" id="email"  
											placeholder="@포함해서 이메일을 작성해주세요.">
									</div>
								</div>
							</div>
							
								
							<div class="d-grid col-3 offset-5 mt-5">
								<input type="button" id="FindIdBtn" class="btn btn-outline-dark" value="아이디 찾기"/>
							</div>
						</form>
					</div>
				</div>
				
			  </div>
			  <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">
					비밀번호 찾기2
					
					<div class="row my-5 container text-center">
					<div class="col align-items-center">

						<form action="loginFrom" method="post" id="loginFrom">
							<div class="row offset-3 mt-4">
								<div class="col-2">
									<p>아이디<p>
								</div>
								<div class="col-6">
									<div class="mb-4 border-bottom">
										<input type="text" class="form-control border-0" id="id" 
											placeholder="아이디">
									</div>
								</div>
							</div>
							<div class="row offset-3">
								<div class="col-2 mt-2">
									<p>이메일<p>
								</div>
								<div class="col-6">
									<div class="mb-4 border-bottom">
										<input type="text" class="form-control border-0" id="email"  
											placeholder="@포함해서 이메일을 작성해주세요.">
									</div>
								</div>
							</div>
								
							<div class="d-grid col-3 offset-5 mt-5 ">
								<input type="button" id="FindIdBtn" class="btn btn-outline-dark" value="비밀번호 찾기"/>
							</div>
						</form>
					</div>
				</div>
			  </div> 
			</div>
		</div>
	</div>