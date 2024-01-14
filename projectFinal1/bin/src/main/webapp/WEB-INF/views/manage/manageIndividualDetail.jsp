<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="resources/css/donggyun.css" rel="stylesheet">
<script src="resources/js/donggyun.js"></script>
<style>
.bordertop {
  border-collapse: collapse;
  border-top: 3px solid #168;
  border-bottom: 3px solid #168;
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
					<span class="font-bold p-4"><h3>1:1 문의함</h3></span>		
				</div>
				<div class="col">
					<button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" 
				         data-bs-target="#myModal">메일 답장
					</button>
				</div>
			</div>
			
			<div class="row " id="global-content ">
				<div class="col text-start bordertop py-3 ps-4">
					<span class="fs-6">${question.questionTitle }</span>
				</div>
				<div class="col bordertop py-3 text-end">
					<div class="EmailDate">${question.email}<span class="ps-3">${question.questionDate }</span></div>
				</div>
			</div>
			
			<div class="row">
				<div class="col p-4 border-bottom py-5" class="fontbold">
					<span style="font-family: 'Noto Sans KR', sans-serif;"></span>
					${question.questionContent }
				</div>
			</div>	
			
			<div class="row">
				<div class="col  my-4">
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
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <div class="modal-body">
                    <form action="productMailWrite" method="post">
                    	<input type="hidden" name="answerProgress" value="답변 완료">
                    	<input type="hidden" name="answerCategory" value="${question.questionCategory }">

                        <input name="email" placeholder="이메일 주소" class="form-control mt-2" value="${question.email }"> <br>
                        <input name="answerTitle" placeholder="제목을 입력하세요." class="form-control" value='"${question.questionTitle }" 답변 드립니다.'> <br>
                        <textarea name="answerContent" placeholder="내용을 입력해주세요." 
                                  cols="60" rows="20" class="form-control"></textarea><br>
                        <button type="submit" class="btn btn-primary mt-2 mb-2">발송</button>
                    </form>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>