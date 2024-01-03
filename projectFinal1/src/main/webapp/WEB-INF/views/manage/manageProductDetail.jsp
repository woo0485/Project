<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="resources/css/donggyun.css" rel="stylesheet">
<script src="resources/js/donggyun.js"></script>
<style>
.bordertop {
  border-collapse: collapse;
  border-top: 3px solid #168;
}
.button99 {
    top:50%;
    background-color:#f0f6f9;
    border-color:#168;
    color: black;
    border-radius:10px; 
    padding:15px;
    min-height:30px; 
    min-width: 120px;
  } 
.button99:hover {
      border-color:red;
  }  
</style>

	<!-- content -->
	<div class="row">
		<div class="col-4">
				<jsp:include page="/WEB-INF/views/manage/manageSide.jsp"/>
		</div>
		
		<div class="col-8 text-start mt-5">
		
			<form name="checkForm" id="checkForm">
				<input type="hidden" name="questionNo" id="questionNo" value="${ question.questionNo }">
				<input type="hidden" name="pageNum" value="${ pageNum }" />
			</form>
		
			<div class="row" id="global-content">
				<div class="col">
					<span class="font-bold p-4"><h3>상품 문의함</h3></span>		
				</div>
				<div class="col text-end">
					<button type="button" class="button99 py-2" data-bs-toggle="modal" 
				         data-bs-target="#myModal">메일 답장
					</button>
				</div>
			</div>

			<div class="row " id="global-content ">
				<div class="col text-start bordertop py-2 ps-4" style="background: #f0f6f9; color: #168;">
					<span style="font-size:large; font-weight: 500;">${question.questionTitle }</span>
				</div>
				<div class="col bordertop py-2 text-end" style="background: #f0f6f9; color: #168;">
					<div class="EmailDate" style="font-size:small;">${question.email}<span class="ps-3" style="font-size:small;">${question.questionDate }</span></div>
				</div>
			</div>
			
			<div class="row">
				<div class="col ps-4 border-bottom py-4" class="fontbold">
					<span style="font-family: 'Noto Sans KR', sans-serif;"></span>
					${question.questionContent }
				</div>
			</div>	
			
			<div class="row">
				<div class="col my-4 ms-2">
					<input class="custom-btn btn-3 px-4" type="button" value="목록" style="font-size:small;" onclick="history.back();"/>
				</div>
			</div>			
			
		</div>
	</div>
	
	<!-- 버튼 클릭시 모달 생김 -->
    <div class="modal" id="myModal">
        <div class="modal-dialog">
            <!-- modal-sm modal-lg modal-xl 모달 사이즈 -->
            <!-- modal-dialog-centered 화면 가운데 -->
            <!-- modal-dialog-scrollable 스크롤 기능 -->
            <div class="modal-content">
                <div class="modal-header">
               		<span class=""><h1>Email</h1></span>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <div class="modal-body text-center">
                    <form action="productMailSend" method="post" onsubmit="alert('메일이 전송 되었습니다.');">
                    	<input type="hidden" name="questionNo" id="questionNo" value="${ question.questionNo }">
                    	<input type="hidden" name="answerProgress" value="답변 완료">

                        <input name="toEmail" placeholder="회원 이메일 주소을 입력해주세요." class="form-control mt-2" value="${question.email }" style="border-color:#168;"> <br>
                        <input name="answerTitle" placeholder="제목을 입력하세요." class="form-control" value='"${question.questionTitle }" 답변 드립니다.' style="border-color:#168;"> <br>
                        <textarea name="answerContent" placeholder="내용을 입력해주세요." 
                                  cols="60" rows="20" class="form-control" style="border-color:#168;"></textarea><br>                               
                        <button type="submit" class="button99 mt-2 mb-2 px-4 py-2">전송</button>
                        <button type="button" class="button99 px-4 py-2 ms-5" data-bs-dismiss="modal">닫기</button>              		  	
                    </form>
                </div> 
            </div>
        </div>
    </div>