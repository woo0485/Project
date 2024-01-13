<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<link href="resources/css/hyunju.css" rel="stylesheet">
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="resources/js/HyunJu.js"></script>

	<!-- content 영역 -->
	<div class="row my-5" id="global-content">		
		<div class="col">
			<div class="row">
				<div class="col">
					<h2 class="fs-3 fw-bold text-center">축제 정보 글 수정하기</h2>
				</div>
			</div> <br>
			
			<!--  여기서부터 업데이트 폼 -->
			<form name="updateForm" id="updateForm" action="update"
				class="row g-3 border-primary" method="post">
				
					<input type="hidden" name="productno" value="${product.productno}">
					<input type="hidden" name="pageNum" value="${ pageNum }" />
				
				<c:if test="${ searchOption }">
					<input type="hidden" name="type" value="${ type }" />
					<input type="hidden" name="keyword" value="${ keyword }" />
				</c:if>
				  
				  <!--  입력하시오 -->
				  <div class="col-10 offset-1">
				    <label for="title" class="form-label">제목을 입력하시오</label>
				    <input type="text" class="form-control" name="productname" id="productname" value="${product.productname}">
				  </div>
				  <div class="col-10 offset-1">
				    <label for="content" class="form-label">내용을 입력하시오</label>
				    <textarea name="productcontent" id="productcontent" class="form-control" rows="10">${product.productcontent}</textarea>
				  </div>
				    <div class="col-10 offset-1">
				    <label for="productprice" class="form-label">가격</label>
				    <input type="text" class="form-control" name="productprice" id="productprice" value="${product.productprice}">
				  </div>
				    <div class="col-10 offset-1">
				    <label for="productimage" class="form-label">사진은 수정할 수 없습니다. </label>
				     <img src="${product.productimage}"  width="600" height="450" />
				  </div>
				  <div class="col-10 offset-1">
				    <label for="productlocation" class="form-label">위치 </label>
				     <input type="text" class="form-control" name="productlocation" id="productlocation" value="${product.productlocation}">
				  </div>
				   <div class="col-10 offset-1">
				    <label for="productopendate" class="form-label">오픈일 </label>
				     <input type="text" class="form-control" name="productopendate" id="productopendate" value="${product.productopendate}">
				  </div>
				    <div class="col-10 offset-1">
				    <label for="productclosedate" class="form-label">마감일 </label>
				     <input type="text" class="form-control" name="productclosedate" id="productclosedate" value="${product.productclosedate}">
				  </div>
				  <div class="col-10 offset-1">
				    <label for="productticketcount" class="form-label">티켓 수</label>
				     <input type="text" class="form-control" name="productticketcount" id="productticketcount" value="${product.productticketcount}">
				  </div>
				  <div class="col-10 offset-1">
				    <label for="productremainticketcount" class="form-label">남은 티켓 수</label>
				     <input type="text" class="form-control" name="productremainticketcount" id="productremainticketcount" value="${product.productremainticketcount}">
				  </div>
				  <!--  여기까지 업데이트 폼  끝-->
				 <div class="col-10 offset-1">
			    		<label for="adminpassword" class="form-label">비밀번호</label>
			    		<input type="password" class="form-control" name="adminpassword"  id="adminpassword">
	  			</div>
				  
				  <div class="col-10 offset-1 mt-5 text-center">
					<input type="submit" value="수정하기" class="btn btn-primary">		
					
				<!--  목록보기  -->		    
				<c:if test="${ not searchOption }">	
						&nbsp;&nbsp;
							<input class="btn btn-primary" type="button" value="목록보기" 
								onclick="location.href='productList?pageNum=${pageNum}'"/>
				</c:if>
				<c:if test="${ searchOption }">	
						&nbsp;&nbsp;
						<input class="btn btn-primary" type="button" value="목록보기" 
						onclick="location.href='productList?pageNum=${pageNum}&type=${ type }&keyword=${ keyword }'"/>
				</c:if>				    
				  </div>				  
			
			</form>
		</div>
	</div>		