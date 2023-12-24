<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div class="row">
	<div class="col-8 offset-2">
		<h1 class="my-5 border-bottom border-dark">회원 가입</h1>
		
		<div class="row">
			<div class="col ">
			
				<form action="" class="g-3 align-items-center">
				
					<div class="row">
						<div class=" offset-md-1 col-2"><p>이름*</p></div>
						<div class="col-7 border-bottom">
							<input type="text" id="neme" class="form-control border-0"aria-describedby="passwordHelpInline">
						</div> 
					</div>
					<div class="row">
						<span id="passwordHelpInline" class="form-text offset-md-3"></span>
					</div>
					
					<div class="row">
						<div class="col-2 offset-md-1"><p>아이디*</p></div>
						<div class="col-7 border-bottom">
							<input type="text" id="joinId"  class="form-control border-0" placeholder="영문과 숫자만 사용 가능" aria-describedby="joinId">
						</div>
						<div class="col-2 text-center">
							<input type="button" id="idCheck" class="form-control" value="중복확인">
						</div>
					</div>
					<div class="row">
						<span id="joinIdMsg" class="form-text offset-md-3"></span>
					</div>
							
					<div class="row">
						<div class="col-2 offset-md-1"><p>비밀번호*</p></div>
						<div class="col-7 border-bottom">
							<input type="password" id="joinPassword" class="form-control border-0"aria-describedby="joinPassword">
						</div> 
					</div>
					<div class="row">
						<div class="offset-1 col-7">
							<span id="passwordMsg1" class="form-text offset-md-3">
							 	<i class="bi bi-exclamation-triangle"></i>영문 8자이상16자 이하  
							</span>
							<span id="passwordMsg2" class="form-text">
							 	<i class="bi bi-exclamation-triangle"></i>숫자 
							</span>
							<span id="passwordMsg3" class="form-text">
								<i class="bi bi-exclamation-triangle"></i> 특수문자
							</span>
						</div>
						
					</div>
					
					
					<div class="row">
						<div class="col-2 offset-md-1"><p>비밀번호 확인*</p></div>
						<div class="col-7 border-bottom">
							<input type="password" id="PasswordCheck" class="form-control border-0"aria-describedby="PasswordCheck">
						</div>
					</div>
					<div class="row">
						<span id="PasswordCheckMsg" class="form-text offset-md-3"></span>
					</div>		
					<div class="row">
						<div class="col-2 offset-md-1"><p>이메일*</p></div>
						<div class="col-3 border-bottom">
					    	<input type="text" class="form-contro border-0" id="eMailId">
					    </div>
							<span class="col-1 p-0 mx-1" style="width: 15px;">@</span>
						<div class="col-sm">
					      <select class="form-select" id="eMailDomain">
					        <option value="naver.com">naver.com</option>
					        <option value="daum.net">daum.net</option>
					        <option value="gmail.com">gmail.com</option>
					        <option value="nate.com">nate.com</option>
					      </select>
					    </div>
						<div class="col-2">
							<input type="button" id="eMailCheckBtn" class="form-control" value="인증번호">
						</div>
					</div>
					<div class="row">
						<span id="eMailCheckMsg" class="form-text offset-md-3"></span>
					</div>	 
					<div class="row" id="eMailCheckLi" hidden="">
						<div class="offset-3 col-7 border-bottom ">
							<input type="hidden" id="eMailCheckNum">	
							<input type="text" id="eMailCodeCheck" class="form-control border-0"
								aria-describedby="eMailCodeCheck" placeholder="인증번호를 입력해 주세요." data-code="false">
						</div>
						<div class="col-2 text-center">
							<input type="button" id="eMailCheckNumBtn" class="form-control" value="인증확인">
						</div>
					</div>
					
					<div class="row">
						<span id="eMailCheckNumMsg" class="form-text offset-md-3"></span>
					</div>
					
					<div class="row">
						<div class="col-2 offset-md-1">
							<p>핸드폰 번호*</p>
						</div>
						<div class="col-7 border-bottom">
					      <input type="text" class="form-control border-0" id="phone" placeholder="'-(하이픈)' 없이 입력해 주세요">
					    </div>
					    <div class="col-2 text-center">
							<input type="button" id="phoneCheckBtn" class="form-control" value="인증하기">
						</div>
					</div>
					
					<div class="row" id="phoneCheckLi" hidden="">
						<div class="offset-md-3 col-7 border-bottom">
							<input type="text" id="phoneCheck" class="form-control border-0"
								aria-describedby="phoneCheck" placeholder="인증번호를 입력해 주세요." data-code="false">
						</div>
						<div class="col-2 text-center">
							<input type="button" id="phoneCheckNumBtn" class="form-control" value="인증확인">
						</div>
					</div>
					
					<div class="row">
						 <span id="phoneCheck" class="form-text offset-md-3"></span>
					</div>	
						
					<div class="row offset-5 my-5 pt-5">
						<div class="col">
							<a href="main" class="btn btn-primary">돌아가기</a>
						</div>
						<div class="col">
							<input type="button" value="회원가입" class="btn btn-primary offset-1" id="joinConfirmBtn">
						</div>
					</div>
				
				</form>
			
			
			
			</div>
		</div>
	
	
	</div>
</div>