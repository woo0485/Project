<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="qu" value="${Question}"></c:set>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row col-auto">
	 		<jsp:include page="/WEB-INF/views/myPageHeader.jsp"></jsp:include>
	 </div>
	 <br><br>
	 <c:if test="${fn:length(qu) == 0}">
							    <div class="row">
							        <div class="col">
							            예매하신 문의 내용이 없습니다!
							        </div>
							    </div>
	</c:if>
	<br><br>
	
	<div class="row" id="global-content">
				<div class="col text-center">
					<span class="font-bold p-4"><h4><span style="font-weight: bold;">${sessionScope.id}</span> 님의 문의함</h4></span>		
				</div>
			</div>
	<c:forEach var="qu" items="${Question}" >
	<div class="row text-center">
	<div class="col-8 text-start mt-5" style="margin-left: 220px;">
			<form name="checkForm" id="checkForm">
				<input type="hidden" name="questionNo" id="questionNo" value="${ qu.questionNo }">
				<input type="hidden" name="pageNum" value="${ pageNum }" />
			</form>
			<div class="row " id="global-content" style="border-top: 1px solid black;">
				<div class="col text-start bordertop py-2 ps-4" style="background: #f0f6f9; color: #168;">
					<span style="font-size:large; font-weight: 500;">${qu.questionTitle }</span>
				</div>
				<div class="col bordertop py-2 text-end" style="background: #f0f6f9; color: #168;">
					<div class="EmailDate" style="font-size:small;">${qu.email}<span class="ps-3" style="font-size:small;">${question.questionDate }</span></div>
				</div>
			</div>
			
			<div class="row">
				<div class="col ps-4 border-bottom py-4" class="fontbold">
					<span style="font-family: 'Noto Sans KR', sans-serif;"></span>
					${qu.questionContent }
				</div>
			</div>	
			<c:if test="${ qu.answerContent != null }">
				<div class="my-5" style="color:red;">답변완료! 이메일을 확인해주세요!</div>	
			</c:if>
			
			<c:if test="${ qu.answerContent == null }">
				<div class="my-5" style="color:red;">현재 답변 대기중</div>
			</c:if>		
		</div>
		</div>
		</c:forEach>
	
	
	
</body>
</html>