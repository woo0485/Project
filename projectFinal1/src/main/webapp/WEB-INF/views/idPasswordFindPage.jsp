<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row my-5 py-5 border-top" style="height: 500px;">
	<div class="col-10 offset-1 mt-3" >
	    
		    <ul class="nav nav-tabs  nav-justified  fw-bold" id="myTab" role="tablist">
			  <li class="nav-item" role="presentation">
			    <button class="nav-link active py-3" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">
			   		 아이디 찾기
			   	</button>
			  </li>
			  <li class="nav-item" role="presentation  fw-bold"  style="display: block;" id="findPasswordTab">
			    <button class="nav-link  py-3"  id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">
			   		 비밀번호 찾기
			    </button>
			  </li>
			  <li class="nav-item" role="presentation  fw-bold"  style="display: none;" id="findPasswordChangeTab" >
			    <button class="nav-link  py-3" id="profile-tab2"  data-bs-toggle="tab" data-bs-target="#profile-tab2-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">
			   		 비밀번호 변경
			    </button>
			  </li>
			  
			</ul>
			<div class="tab-content mt-5" id="myTabContent">
			  <div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
			
				
				<div class="row mt-5 container text-center">
					<div class="col mt-5 align-items-center">

						
							<div class="row offset-3 mt-5">
								<div class="col-2">
									<p class="fw-bold" id="findIdLavalEmail">이메일 : <p>
								</div>
								<div class="col-6">
									<div class="mb-4 border-bottom">
										<input type="text" class="form-control border-0" id="findIdEmail"  
											placeholder="@포함해서 이메일을 작성해주세요.">
									</div>
								</div>
							</div>
							<div class="row offset-1"><span id="findIdEmailMsg"></span></div>
								
							<div class="d-grid col-3 offset-5 mt-5" >
								<input type="button" id="FindIdBtn" class="btn btn-outline-dark" value="아이디 찾기"/>
							</div>
							<div class="row col-3 offset-5 mt-5" hidden="" id="moveLogin"><a href="login">로그인</a></div>
						
					</div>
				</div>
				
			  </div>
			  <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">
				<div class="row my-5 container text-center">
					<div class="col align-items-center">
						
							<div class="row offset-3 mt-5">
								<div class="col-2 my-4"><p>아이디 :<p></div>
								<div class="col-6">
									<div class="my-4 border-bottom">
										<input type="text" class="form-control border-0" id="findPasswordId" placeholder="아이디">
									</div>
								</div>
							</div>
							<div class="row offset-3">
								<div class="col-2 mt-2"><p>이메일 :<p></div>
								<div class="col-6">
									<div class="mb-5 border-bottom">
										<input type="text" class="form-control border-0" id="findPasswordEmail" placeholder="@포함해서 이메일을 작성해주세요.">
									</div>
								</div>
							</div>
							
							<div class="row" id="findPasswordEmailCheck" style="display: none;" >
								<input type="hidden" id="findEmailCheckCodeHidden"><!-- 보낸 인증번호 -->
								<div class="offset-5 col-3 border-bottom ">
									<input type="text" id="findEmailCodeCheck" class="form-control border-0"aria-describedby="findEmailCodeCheck" placeholder="인증번호를 입력해 주세요." data-code="false">
								</div>
								<div class="col-2 text-center">
									<input type="button" id="findeMailCheckNumBtn" class="form-control btn btn-outline-dark" value="인증확인">
								</div>
							</div>	
							
							<div class="row offset-1"><span id="findPasswordMsg"></span></div>
							
							<div class="d-grid col-3 offset-5 mt-4 ">
								<input type="button" id="FindPasswordBtn" class="btn btn-outline-dark" value="이메일 인증하기"/>
							</div>
						
					</div>
				</div>
			  </div> 
			  <div class="tab-pane fade" id="profile-tab2-pane" role="tabpanel" aria-labelledby="profile-tab2" tabindex="0" >
				<div class="row my-5 container text-center">
					<div class="col align-items-center">
						<form action="" method="post" id="">
							<div class="row"><h3>새로운 비밀번호를 입력해 주세요.</h3></div>
							<div class="row offset-3 mt-5">
								<div class="col-2 my-4"><p>새로운 비밀번호:<p></div>
								<div class="col-6">
									<div class="my-4 border-bottom">
										<input type="password" class="form-control border-0" id="findNewPassword" placeholder="새로운 비밀번호를 적어주세요">
									</div>
								</div>
							</div>
							<div class="row offset-3">
								<div class="col-2 mt-2"><p>새로운 비밀번호 확인:<p></div>
								<div class="col-6">
									<div class="mb-5 border-bottom">
										<input type="password" class="form-control border-0" id="findNewPasswordCheck" placeholder="새로운 비밀번호를 적어주세요">
									</div>
								</div>
							</div>
							
							
							<div class="row offset-1"><span id="findPasswordMsg"></span></div>
							<div class="d-grid col-3 offset-5 mt-4 ">
								<input type="button" id="FindPasswordBtn" class="btn btn-outline-dark" value="비밀 번호 변경"/>
							</div>
						</form>
					</div>
				</div>
			  </div> 
			</div>
		</div>
	</div>