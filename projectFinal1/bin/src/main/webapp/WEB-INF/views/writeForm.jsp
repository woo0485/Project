<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>  
<link href="resources/css/hyunju.css" rel="stylesheet">
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="resources/js/HyunJu.js"></script>
	<!-- content 영역 -->
	<div class="row my-5" id="global-content">		
		<div class="col">
		
			<div class="row">
				<div class="col">
					<h2 class="fs-3 fw-bold text-center">축제 정보 글 쓰기</h2>
				</div>
			</div>
			
			<div class="row">
				<div class="col">
						
				<form name="productWriteForm" action="productWriteForm" id="writeForm" 
					class="g-3 border-primary" method="post" enctype="multipart/form-data">
			
						<div class="row my-3">
						  <div class="col border-bottom">
						    <label for="productname" class="form-label fs-5 fw-bold">제 목</label>
						    <input type="text" class="form-control  border-0" name="productname" id="productname">
						  </div>
						</div>
						<div class="row my-3">  
						  <div class="col border-bottom">
						    <label for="productopendate" class="form-label fs-5 fw-bold">오픈일 </label>
						    <input type="date" class="form-control  border-0" name="productopendate" id="productopendate">
						  </div>
						   <div class="col border-bottom">
						    <label for="productclosedate" class="form-label fs-5 fw-bold">마감일 </label>
						    <input type="date" class="form-control  border-0" name="productclosedate" id="productclosedate">
						  </div>
						 </div>
						<div class="row my-3">
						  <div class="col border-bottom">
						    <label for="productprice" class="form-label fs-5 fw-bold">가격</label>
						    <input type="text" class="form-control  border-0" name="productprice" id="productprice">
						  </div>
						</div>  
						
						<div class="row mt-5">
						<div class="col-2 form-label"><p class="fs-5 fw-bold">우편번호 </p></div>
							
						<div class="col-8 border-bottom">
							<input type="text" class="form-control border-0"
									id="zipcode" maxlength="5" readonly data-code="false" style="height: 50px;" >
						</div>
						<div class="col-2">
							<input type="button" class="btn btn btn-outline-dark" id="btnZipcode" 
									onclick="findAddr()" value="우편번호 찾기">
						</div>
					</div>
					
					<div class="row my-3">
						  <label for="productlocation" class="form-label fs-5 fw-bold">주소</label>
						<div class="col border-bottom">
							<input type="text" class="form-control border-0"  name="productlocation" id="address1"
							 readonly>
						</div>
					</div>
						<div class="row my-3">  
						  <div class="col border-bottom">
						    <label for="productticketcount" class="form-label fs-5 fw-bold">총 티켓 수</label>
						     <input type="number" class="form-control  border-0" name="productticketcount" id="productticketcount">
						  </div>
						</div>  
						<div class="row mt-5">  
						    <div class="col ">
						    <label for="productcontent" class="form-label fs-5 fw-bold">내 용</label>
						    <textarea name="productcontent" id="productcontent" class="form-control" rows="10"></textarea>
						  </div>
						  </div>
						  
						<div class="row my-3">  
						  <div class="col">
						    <label for="productimage" class="form-label fs-5 fw-bold">사진 </label>
						      <input type="file" class="form-control" name="productimage"  id="productimage" >
						  </div>
						</div>  
						
						  
						  <div class="col-10 offset-1 mt-5 text-center">
							<input type="submit" value="등록하기" class="btn btn-outline-primary">				    
							<input type="button" value="목록보기" class="btn btn-outline-warning"
								onclick="location.href='productList'">				    
						  </div>
						  				  
						</form>
					</div>
				</div>
			</div>
		</div>
	
				
				  