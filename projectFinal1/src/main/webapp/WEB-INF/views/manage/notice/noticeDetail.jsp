<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="resources/css/donggyun.css" rel="stylesheet">
<script src="resources/js/donggyun.js"></script>
<style>
.fontsmall {
	color : #999999;
}
</style>


	<!-- content -->
	<div class="row">
		<div class="col-3">
			<jsp:include page="/WEB-INF/views/manage/customer/customerSide.jsp" />
		</div>
		<div class="col-9 text-start mt-5">
		
			<form name="checkForm" id="checkForm">
				<input type="hidden" name="noticeNo" id="noticeNo" value="${ notice.noticeNo }">
				<input type="hidden" name="noticePassword" id="rPass"> 
				<input type="hidden" name="pageNum" value="${ pageNum }" />
			</form>
		
			<div class="row" id="global-content">
				<div class="col-10 text-start border-2 border-dark border-bottom pb-3">
					<span class="fw-bold fs-2">공지사항</span>
				</div>
			</div>
			
			<div class="row" id="global-content">
				<div class="col-8 text-start border-dark border-bottom py-3 ps-5">
					<span class="fontbold">${notice.noticeTitle }</span>
				</div>
				<div class="col-2 pt-3 border-dark border-bottom pb-1 ">
					<span class="fontsmall">${notice.noticeUploadDate }</span>
				</div>
			</div>
			
			<c:if test="${sessionScope.userType =='Admin' }">
				<div class="row">
					<div class="col offset-6 mt-3">
						<input class="btn btn-outline-danger" type="button" id="noticeDetailUpdate" value="수정" />&nbsp;&nbsp;
						<input class="btn btn-outline-danger" type="button" id="noticeDetailDelete" value="삭제" />
					</div>
				</div>
			</c:if>
			
			<div class="row">
				<div class="col-10 p-5 border-dark border-bottom py-5" class="fontbold">
					<span style="font-family: 'Noto Sans KR', sans-serif;"></span>
					${notice.noticeContent }
				</div>
			</div>
			
			<div class="row">
				<div class="col-10  my-4">
					<input class="custom-btn btn-3 px-4" type="button" value="목록" style="font-size:small;" onclick="history.back();"/>
				</div>
			</div>
			
		</div>
	</div>