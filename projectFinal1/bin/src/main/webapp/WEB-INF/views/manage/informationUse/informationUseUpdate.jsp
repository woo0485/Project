<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="resources/css/donggyun.css" rel="stylesheet">
<script src="resources/js/donggyun.js"></script>

<!-- content -->
<div class="row">
	<div class="col-3">
		<jsp:include page="/WEB-INF/views/manage/customer/customerSide.jsp" />
	</div>
	<div class="col-9 text-start mt-5">
		<div class="row" id="global-content">
			<div class="col-10 text-start border-2 border-dark border-bottom pb-3">
				<span class="fw-bold fs-2">이용안내</span>
			</div>
		</div>

		<form name="informationUseUpdateForm" id="informationUseUpdateForm" action="informationUseUpdateProcess"
			class="row g-3" method="post">
			<input type="hidden" name="informationUseNo" value="${informationUse.informationUseNo}">
			<input type="hidden" name="pageNum" value="${ pageNum }">

			<div class="row">
				<div class="col-6 offset-2 my-5">
					<label>제목</label> <input type="text" class="form-control"
						id="informationUseTitle" name="informationUseTitle" value="${informationUse.informationUseTitle}">
				</div>
			</div>

			<div class="row">
				<div class="col-6 offset-2  mb-3">
					<input type="hidden" name="informationUseContent" id="informationUseContent">
					<label>내용</label>
					<div id="contenteditable" contenteditable="true"
						style="min-height: 50vh;" class="border rounded">${informationUse.informationUseContent}
					</div>
				</div>
			</div>

			<div class="col-5 offset-2  mb-5">
				<label>이미지 수정</label> <input type="file"
					class="form-control form-control-sm" id="img"> <input
					type="hidden" name="informationUseImage" id="informationUseImage">
			</div>

			<div class="text-center my-4">
				<input type="submit" value="수정하기" class="btn btn-secondary">&nbsp;&nbsp;
				<input type="button" value="뒤로가기" class="btn btn-secondary"
					onclick="history.back()">
			</div>
		</form>
	</div>
</div>

