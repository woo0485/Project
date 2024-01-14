<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.bg99 {
  background-image: url("https://cdn.pixabay.com/photo/2014/01/13/12/39/stationery-243363_1280.jpg");
  background-repeat: no-repeat;
  margin-top : 20px ;
  padding-right: 80px;
  background-size : 590px 1060px ;

}
.font {
	font-size: small;
	color: #999999;
}

#contenteditable{
	outline: none;
	background-color:white;
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
					<c:if test="${sessionScope.id != null }">
					<form name="inquiryWriteForm" id="inquiryWriteForm" action="inquiryWriteProcess"
						class="row g-3" method="post" onsubmit="alert('답변은 이메일로 전송되고 2~3일 정도걸립니다.');">
					<div class="row">
						<div class="col bg99">
	
						<div class="row">
							<div class="col-2 offset-1 my-3 mt-5">
								<select name="questionCategory" id="questionCategory" class="form-select" >
									<option value="Product">상품 문의</option>
									<option value="Individual">1:1 문의</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="col-6 offset-1 mb-3">
								<input type="hidden" name="answerProgress" value="답변 대기">
								<input type="hidden" class="form-control" id="id" name="id" value="${sessionScope.id }">
								<input type="hidden" class="form-control" name="email" value="${sessionScope.email }">
								<label class="fw-bold mb-2">제목</label> 
								<input type="text" class="form-control" id="questionTitle" name="questionTitle">
							</div>
						</div>
						<div class="row">
							<div class="col-6 offset-1 mb-3">
								<input type="hidden" name="questionContent" id="questionContent">
								<label class="fw-bold mb-2">내용</label>
								<div contenteditable="true" id="contenteditable" style="min-height: 50vh;" class="border rounded p-2"></div>
							</div>
						</div>
						<div class="row">
							<div class="col-6 offset-1 my-4 text-center">
								<input type="submit" value="등록하기" class="custom-btn btn-3 px-3 py-0" style="font-size:small;">&nbsp;&nbsp;
								<input type="button" value="뒤로가기" class="custom-btn btn-3 px-3 py-0" style="font-size:small;" onclick="history.back()">
							</div>
						</div>	
						
						</div>
					</div>
					
					</form>					
					</c:if>
					
					<c:if test="${sessionScope.id == null }">
						<script type="text/javascript">							
							$(location).attr('href', 'login');
							alert("로그인 해주세요.")
						</script>
					</c:if>
				</div>
			</div>
			
		</div>
	</div>