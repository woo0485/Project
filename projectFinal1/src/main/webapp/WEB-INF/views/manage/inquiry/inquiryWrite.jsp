<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.font {
	font-size: small;
	color: #999999;
}
#questionTitle{
	outline: none;
	background-color:#F0F6F9;
}
#contenteditable{
	outline: none;
	background-color:#F0F6F9;
}

</style>

	<!-- content -->
	<div class="row">
		<div class="col">
	
			<div class="row">
				<div class="col-3">
					<jsp:include page="/WEB-INF/views/manage/customer/customerSide.jsp" />
				</div>
				<div class="col-9 mt-5">
					<div class="row" id="global-content">
						<div
							class="col-10  text-start border-2 border-dark border-bottom pb-3">
							<span class="fw-bold fs-2">문의하기</span>
						</div>
					</div>				
					<div class="row">
						<div class="col-10 text-start my-3 border-1 border-dark border-bottom pb-3">
							<span class="font text-secondary"><i class="bi bi-shield-exclamation"></i> 답변은 이메일로
								전송되고 2~3일 정도걸립니다.</span>
						</div>
					</div>				
					<form name="inquiryWriteForm" id="inquiryWriteForm" action="inquiryWriteProcess"
						class="row g-3" method="post">
						
	
						<div class="row">
							<div class="col-2 offset-2 my-3 mt-5">
								<select name="questionCategory" id="questionCategory" class="form-select" style="background-color:#F0F6F9;">
									<option value="Product">상품 문의</option>
									<option value="Individual">1:1 문의</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="col-6 offset-2 mb-3">
								<input type="hidden" name="answerProgress" value="답변 대기">
								
								
								아이디<input type="text" class="form-control" id="id" name="id">
								이메일<input type="text" class="form-control" name="email" value="woo0485@naver.com">
								
								
								<label class="fw-bold mb-2">제목</label> 
								<input type="text" class="form-control" id="questionTitle" name="questionTitle">
							</div>
						</div>
						<div class="row">
							<div class="col-6 offset-2 mb-3">
								<input type="hidden" name="questionContent" id="questionContent">
								<label class="fw-bold mb-2">내용</label>
								<div contenteditable="true" id="contenteditable" style="min-height: 50vh;" class="border rounded p-2"></div>
							</div>
						</div>
						<div class="row">
							<div class="col-6 offset-2 my-4 text-center">
								<input type="submit" value="등록하기" class="custom-btn btn-3 px-3 py-0" style="font-size:small;">&nbsp;&nbsp;
								<input type="button" value="뒤로가기" class="custom-btn btn-3 px-3 py-0" style="font-size:small;" onclick="history.back()">
							</div>
						</div>	
					</form>
				</div>
			</div>
			
		</div>
	</div>