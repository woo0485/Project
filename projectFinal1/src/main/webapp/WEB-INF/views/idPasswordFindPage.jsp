<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row my-5 py-5 border-top" >
	<div class="col" >
	    
		    <ul class="nav nav-tabs  nav-justified  fw-bold" id="myTab" role="tablist">
			  <li class="nav-item" role="presentation">
			    <button class="nav-link active py-3" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane1" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">
			   		 아이디 찾기
			   	</button>
			  </li>
			  <li class="nav-item" role="presentation  fw-bold" >
			    <button class="nav-link  py-3"  id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane1" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">
			   		 비밀번호 찾기
			    </button>
			  </li>
			</ul>
			
			<div class="tab-content mt-5" id="myTabContent">
			  <div class="tab-pane fade show active" id="home-tab-pane1" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
				
				<div class="row mt-5 container text-center" id="findIdDiv">
					<div class="col mt-5 align-items-center">
					
						<div class="row my-5">
							<div class="col">	
								<i class="bi bi-circle" id="idFindCheckEmailIcon" data-code="false"> 이메일번호로 아이디 찾기</i>
							</div>
						</div>		
						
						<div class="row" id="idFindCheckEmail" style="display: none;">
							<div class="col">
								<div class="row offset-3 mt-5"  >
									<div class="col-2">
										<p class="fw-bold" id="findIdLavalName">이름 : <p>
									</div>
									<div class="col-6">
										<div class="mb-4 border-bottom">
											<input type="text" class="form-control border-0" id="findIdName"  
												placeholder="이름을 입력해 주세요.">
										</div>
									</div>
								</div>
								<div class="row offset-3 mt-1">
									<div class="col-2">
										<p class="fw-bold" id="findIdLavalEmail">이메일 : <p>
									</div>
									<div class="col-6">
										<div class="mb-4 border-bottom">
											<input type="text" class="form-control border-0" id="findIdEmail"  
												placeholder="@포함해서 이메일을 작성해주세요.">
										</div>
									</div>
									<div class="col-3" >
										<input type="button" id="FindIdBtn" class="btn btn-outline-dark" value="인증번호"/>
									</div>
								
								</div>
								<div class="row" id="findIdEmailCheck"   hidden="">
									<input type="hidden" id="findIdEmailCheckCodeHidden"><!-- 보낸 인증번호 -->
									<div class="offset-5 col-3 border-bottom ">
										<input type="text" id="findIdEmailCodeCheck" class="form-control border-0"aria-describedby="findEmailCodeCheck" placeholder="인증번호를 입력해 주세요." data-code="false">
									</div>
									<div class="col-2 text-center">
										<input type="button" id="findIdEmailCheckNumBtn" class="form-control btn btn-outline-dark" value="인증확인">
									</div>
								</div>	
								
								<div class="row offset-1"><span id="findIdEmailMsg"></span></div>
							</div>
						</div>	
						
						
						<div class="row">
							<div class="col">	
								<i class="bi bi-circle" id="idFindCheckPhonelIcon" data-code="false"> 핸드폰번호로 아이디 찾기</i>
							</div>
						</div>
						<div class="row" id="idFindCheckPhone" style="display: none" >
							<div class="col">
								<div class="row offset-3 mt-5"  >
									<div class="col-2">
										<p class="fw-bold" id="findIdLavalPhoneName">이름 : <p>
									</div>
									<div class="col-6">
										<div class="mb-4 border-bottom">
											<input type="text" class="form-control border-0" id="findIdPhoneName"  
												placeholder="이름을 입력해 주세요.">
										</div>
 								</div>	
								<div class="row offset-3 mt-1">
									<div class="col-2">
										<p class="fw-bold" id="findIdLavalPhone">핸드폰 번호 : <p>
									</div>
									<div class="col-6">
										<div class="mb-4 border-bottom">
											<input type="text" class="form-control border-0" id="findIdPhone"  
												placeholder="-(하이픈없이 번호만 적어주세요)">
										</div>
									</div>
									<div class="col-3" >
										<input type="button" id="FindIdPhoneBtn" class="btn btn-outline-dark" value="인증번호"/>
									</div>
								
								</div>
								<div class="row" id="findIdPhoneCheck"   hidden="">
									<input type="hidden" id="findIdPhoneCheckCodeHidden"><!-- 보낸 인증번호 -->
									<div class="offset-5 col-3 border-bottom ">
										<input type="text" id="findIdPhoneCodeCheck" class="form-control border-0"aria-describedby="findPhoneCodeCheck" placeholder="인증번호를 입력해 주세요." data-code="false">
									</div>
									<div class="col-2 text-center">
										<input type="button" id="findIdPhoneCheckNumBtn" class="form-control btn btn-outline-dark" value="인증확인">
									</div>
								</div>	
								<div class="row offset-1"><span id="findIdPhoneMsg"></span></div>
							</div>
						</div>	
					</div>
				</div>
				
			  </div>
			  
			  
			  <div class="tab-pane fade show active"  id="home-tab-pane2"  role="tabpanel" aria-labelledby="home-tab" tabindex="0" style="display: none">
			
				<div class="row mt-5 container text-center">
					<div class="col mt-5 align-items-center">
							<div class="row offset-3 mt-5">
								<div class="col-2">
									<p class="fw-bold" id="findIdLavalId">아이디 : <p>
								</div>
								<div class="col-6">
									<div class="mb-4 border-bottom">
										<input type="text" class="form-control border-0" id="findId" readonly>
									</div>
								</div>
							</div>
							<div class="row offset-1"><span id="findIdEmailMsg"></span></div>
								
							<div class="row">
								<div class="col-3 offset-5 mt-5"  id="moveLogin"><a href="login">로그인</a></div>
								
							</div>
						</div>
					</div>
				  </div>
			  </div>
			  
			  <div class="tab-pane fade" id="profile-tab-pane1" role="tabpanel" aria-labelledby="profile-tab" tabindex="0" >
				<div class="row mt-5 container text-center">
					<div class="col mt-4 align-items-center">
						
							<div class="row offset-3 mt-5">
								<div class="col-2 my-4 fw-bold"><p>아이디 :<p></div>
								<div class="col-6">
									<div class="my-4 border-bottom">
										<input type="text" class="form-control border-0" id="findPasswordId" placeholder="아이디">
									</div>
								</div>
							</div>
							<div class="row offset-3">
								<div class="col-2 mt-2 fw-bold"><p>이메일 :<p></div>
								<div class="col-6">
									<div class="mb-5 border-bottom">
										<input type="text" class="form-control border-0" id="findPasswordEmail" placeholder="@포함해서 이메일을 작성해주세요.">
									</div>
								</div>
							</div>
							<div class="spinner-border text-success" id="findPasswordLoading" role="status" style="display: none;">
							  <span class="visually-hidden">Loading...</span>
							</div>
							
							<div class="row" id="findPasswordEmailCheckDiv" hidden="" >
								<input type="hidden" id="findEmailCheckCodeHidden"><!-- 보낸 인증번호 -->
								<div class="offset-5 col-3 border-bottom ">
									<input type="text" id="findEmailCodeCheck" class="form-control border-0"aria-describedby="findEmailCodeCheck" placeholder="인증번호를 입력해 주세요." data-code="false">
								</div>
								<div class="col-2 text-center">
									<input type="button" id="findPasswordEmailCheckNumBtn" class="form-control btn btn-outline-dark" value="인증확인">
								</div>
							</div>	
							
							<div class="row offset-1"><span id="findNewPasswordMsg1"></span></div>
							
							<div class="d-grid col-3 offset-5 mt-4 ">
								<input type="button" id="FindPasswordBtn" class="btn btn-outline-dark" value="이메일 인증하기"/>
							</div>
						</div>
					</div>
				  </div> 
			  <div class="tab-pane fade" id="profile-tab-pane2" role="tabpanel" aria-labelledby="profile-tab" tabindex="0"  >
				<div class="row my-5 container text-center">
					<div class="col align-items-center">
							<input type="hidden" id="findNewPasswordIdHidden">
							<div class="row"><h4>인증되었습니다 .<br>새로운 비밀번호를 입력해 주세요.<br>영문소문자,숫자,특수문자를 조합해 8자이상 16자이하로 작성해 주세요</h4></div>
							<div class="row offset-3 mt-5">
								<div class="col-3 my-4 fw-bold"><p>새로운 비밀번호:<p></div>
								<div class="col-6">
									<div class="my-4 border-bottom">
										<input type="password" class="form-control border-0" id="findNewPassword" placeholder="새로운 비밀번호를 적어주세요">
									</div>
								</div>
							</div>
							<div class="row offset-3">
								<div class="col-3 mt-2 fw-bold"><p>새로운 비밀번호 확인:<p></div>
								<div class="col-6">
									<div class="mb-5 border-bottom">
										<input type="password" class="form-control border-0" id="findNewPasswordCheck" placeholder="새로운 비밀번호를 적어주세요">
									</div>
								</div>
							</div>
							<div class="row offset-1"><span id="findPasswordMsg2"></span></div>
							<div class="row">
								<div class="d-grid col-3 offset-5 mt-4 ">
									<input type="button" id="findNewPasswordBtn" class="btn btn-outline-dark" value="비밀 번호 변경"/>
								</div>
							</div>
					</div>
				</div>
			  </div> 
			  <div class="tab-pane fade" id="profile-tab-pane3" role="tabpanel" aria-labelledby="profile-tab" tabindex="0" >
				<div class="row my-5 container text-center">
					<div class="col align-items-center">
						
						<div class="row"><h3> 비밀번호가 변경되었습니다.<br><br>새로운 비밀번호로 로그인해주세요.</h3></div>
						<div class="row">
							<div class="col-2 offset-5 mt-5 " id="moveLogin"><a href="login">로그인</a></div>
							
						</div>
					</div>
				</div>
			  </div> 
			</div>
		</div>
	</div>