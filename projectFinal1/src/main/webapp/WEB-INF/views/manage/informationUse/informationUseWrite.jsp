<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="resources/css/donggyun.css" rel="stylesheet">
<script src="resources/js/donggyun.js"></script>

	<!-- content -->	
	<div class="row" id="global-content">
		<div class="col-8 offset-2 text-start border-2 border-dark border-bottom pb-3">
			<span class="fw-bold fs-2">이용안내</span>
		</div>
	</div>
	
	<form name="informationUseWriteForm" id="informationUseWriteForm" action="informationUseWriteProcess" 
			class="row g-3" method="post">		
	<input type="hidden" name="pageNum" value="${ pageNum }">
	
	<div class="row">
		<div class="col-6 offset-3 my-5">
			<label>제목</label>
			<input type="text" class="form-control" id="informationUseTitle" name="informationUseTitle" >
		</div>	 
	</div>
	
	<div class="row">
		<div class="col-6 offset-3 mb-3">
			<input type="hidden" name="informationUseContent" id="informationUseContent">
			<label>내용</label>			
			<div contenteditable="true" id="contenteditable"
				style="min-height: 50vh;" class="border rounded p-2" placeholder="1234">
			</div>						
		</div>
	</div>
	
	<div class="col-5 offset-3 mb-5">
		<label>이미지 추가</label>
		<input type="file" class="form-control form-control-sm" id="img2" >
		<input type="hidden" name="informationUseImage" id="informationUseImage">
	</div>
	
	<div class="text-center my-2">
			<span class="mb-5"><input type="submit" value="등록하기" class="custom-btn btn-3 px-3">
			
			<span class="ms-5"><input type="button" value="뒤로가기" class="custom-btn btn-3 px-3"
				onclick="history.back()"></span>
	</div>
	
	
	</form>
	

	