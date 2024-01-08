<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div class="row">
	<div class="col-8 offset-2">
		<h1 class="my-5 border-bottom border-dark">회원 가입</h1>
		
		<div class="row">
			<div class="col ">
			
				<form action="memberJoin" class="g-3 align-items-center" method="post">
				
					<div class="row my-4">
						<div class=" offset-md-1 col-2"><p>이름*</p></div>
						<div class="col-7 border-bottom">
							<input type="text" id="joinName" name="joinName" class="form-control border-0" data-code="false" style="height: 50px;">
						</div> 
					</div>
					<div class="row">
						<span id="joinNameMsg" class="form-text offset-md-3"></span>
					</div>
					
					<div class="row my-4">
						<div class="col-2 offset-md-1">
							<p>아이디*</p>
						</div>
						<div class="col-7 border-bottom">
							<input type="text" id="joinId" name="joinId"  class="form-control border-0" 
									placeholder="영문과 숫자만 사용 가능" data-code="false" style="height: 50px;">
						</div>
						<div class="col-2 text-center">
							<input type="button" id="idCheck" class="form-control btn btn-outline-dark" value="중복확인">
						</div>
					</div>
					<div class="row">
						<span id="joinIdMsg" class="form-text offset-md-3"></span>
					</div>
							
					<div class="row my-4">
						<div class="col-2 offset-md-1">
							<p>핸드폰 번호*</p>
						</div>
						<div class="col-7 border-bottom">
					      <input type="text" class="form-control border-0" id="phoneNumber" name="phoneNumber" 
					      			data-code="false"  placeholder="'-(하이픈)' 없이 숫자 11자를 입력해 주세요" style="height: 50px;">
					    </div>
					    <div class="col-2 text-center">
							<input type="button" id="phoneCheckBtn" class="form-control btn btn-outline-dark" value="인증하기">
						</div>
						<input type="hidden" id="phoneNumberCheckCode">
					</div>
					<div class="row" id="phoneCheckLi" style="display: none;">
						<div class="offset-md-3 col-7 border-bottom">
							<input type="text" id="phoneCheck" class="form-control border-0"
								aria-describedby="phoneCheck" placeholder="인증번호를 입력해 주세요." data-code="false" style="height: 50px;">
						</div>
						<div class="col-2 text-center">
							<input type="button" id="phoneCheckNumBtn" class="form-control btn btn-outline-dark" value="인증확인">
						</div>
					</div>
					<div class="row">
						<span id="phoneNumberMsg" class="form-text offset-md-3"></span>
					</div>	
					
					<div class="row">
						 <span id="phoneCheck" class="form-text offset-md-3"></span>
					</div>		
							
					<div class="row my-4">
						<div class="col-2 offset-md-1"><p>비밀번호*</p></div>
						<div class="col-7 border-bottom">
							<input type="password" id="joinPassword" class="form-control border-0" style="height: 50px;">
						</div> 
						<div class="col">
							<i class="bi bi-eye-slash" style="font-size: 25px;" id="seeJoinPassword"></i>
						</div>
					</div>
					<div class="row">
						<div class="offset-1 col-9 fw-bold"">
							<span id="passwordMsg1" class="form-text offset-md-3">
							 	<i class="bi bi-check-circle"></i>영문  
							</span>
							<span id="passwordMsg2" class="form-text">
							 	<i class="bi bi-check-circle"></i>숫자 
							</span>
							<span id="passwordMsg3" class="form-text">
								<i class="bi bi-check-circle"></i> 특수문자
							</span>
							<span id="passwordMsg4" class="form-text">
								<i class="bi bi-check-circle"></i> 8자이상16자 이하 
							</span>
						</div>
					</div>
					
					
					<div class="row my-5">
						<div class="col-2 offset-md-1"><p>비밀번호 확인*</p></div>
						<div class="col-7 border-bottom">
							<input type="password" id="joinPasswordCheck" name="joinPasswordCheck" 
									class="form-control border-0" data-code="false" style="height: 50px;">
						</div>
						<div class="col">
							<i class="bi bi-eye-slash" style="font-size: 25px;" id="seeJoinPasswordCheck"></i>
						</div>
					</div>
					<div class="row">
						<span id="joinPasswordCheckMsg" class="form-text offset-md-3"></span>
					</div>
								
					<div class="row mt-5">
						<div class="col-2 offset-md-1 form-label"><p>우편번호 *</p></div>
							
						<div class="col-5 border-bottom">
							<input type="text" class="form-control border-0" name="zipcode"
									id="zipcode" maxlength="5" readonly data-code="false" style="height: 50px;" >
						</div>
						<div class="col-4">
							<input type="button" class="btn btn btn-outline-dark" id="btnZipcode" 
									onclick="findAddr()" value="우편번호 찾기">
						</div>
					</div>
					
					<div class="row my-3">
						<div class="col-2 offset-md-1 form-label"><p>자택주소 *</p></div>
						<div class="col-7 border-bottom">
							<input type="text" class="form-control border-0"  name="address1" id="address1"
							 readonly>
						</div>
					</div>
					<div class="row my-4 ">
						<div class="col-2 offset-md-1 form-label"><p>상세주소  </p></div>
						<div class="col-7 border-bottom">
							<input type="text" class="form-control border-0" name="address2" id="address2">
						</div>
					</div>			
								
								
					<div class="row">
						<span  class="form-text offset-md-3">*아이디 찾을 때 이메일이 필요합니다*</span>
					</div>
					<div class="row my-4 mt-4">
						<div class="col-2 offset-md-1"><p>이메일*</p></div>
						<div class="col-3 border-bottom">
					    	<input type="text" class="form-contro border-0" id="eMailId" name="eMailId" style="height: 50px;">
					    </div>
							<span class="col-1 p-0 mx-1" style="width: 15px;">@</span>
						<div class="col-sm">
					      <select class="form-select" id="eMailDomain" name="eMailDomain" style="height: 50px;">
					        <option value="naver.com">naver.com</option>
					        <option value="daum.net">daum.net</option>
					        <option value="gmail.com">gmail.com</option>
					        <option value="nate.com">nate.com</option>
					      </select>
					    </div>
						<div class="col-2">
							<input type="button" id="eMailCheckBtn" class="form-control btn btn-outline-dark" value="인증번호">
						</div>
					</div>
					<div class="row">
						<span id="eMailCheckMsg" class="form-text offset-md-3"></span>
					</div>	
					 
					<div class="row" id="eMailCheckLi" style="display: none;">
						<div class="offset-3 col-7 border-bottom ">
								
							<input type="text" id="eMailCodeCheck" class="form-control border-0"
								aria-describedby="eMailCodeCheck" placeholder="인증번호를 입력해 주세요." data-code="false">
						</div>
							<input type="hidden" id="eMailCheckCode">
						<div class="col-2 text-center">
							<input type="button" id="eMailCheckNumBtn" class="form-control btn btn-outline-dark" value="인증확인">
						</div>
					</div>
					
					<div class="row">
						<span id="eMailCheckNumMsg" class="form-text offset-md-3"></span>
					</div>
					<div class="row">
						<span id="joinLastCheckMsg" class="form-text offset-md-3"></span>
					</div>
						
						
					<div class="row offset-3 my-5 pt-5 justify-content-end">
						<div class="col">
							<a href="main" class="btn btn-outline-dark">돌아가기</a>
						</div>
						<div class="col">
							<input type="submit" value="회원가입" class="btn btn-outline-dark offset-1" id="memberJoinBtn">
						</div>
					</div>
				
				</form>
			
			
			
			</div>
		</div>
	
	
	</div>
</div>