<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  


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
						
				<form name="writeForm" action="writeProcess" id="writeForm" 
					class="g-3 border-primary" method="post" enctype="multipart/form-data">
			
					
						  <div class="col-5 offset-1">
						    <label for="productprice" class="form-label">가격</label>
						    <input type="text" class="form-control" name="productprice" id="productprice">
						  </div>
						  <div class="col-5">
						    <label for="adminpassword" class="form-label">비밀번호</label>
						    <input type="password" class="form-control" name="adminpassword" id="adminpassword">
						  </div>
						  <div class="col-10 offset-1">
						    <label for="productname" class="form-label">제 목</label>
						    <input type="text" class="form-control" name="productname" id="productname">
						  </div>
						  <div class="col-10 offset-1">
						    <label for="productcontent" class="form-label">내 용</label>
						    <textarea name="productcontent" id="productcontent" class="form-control" rows="10"></textarea>
						  </div>
						  <div class="col-8 offset-md-2">
						    <label for="productimage" class="form-label">사진 </label>
						      <input type="file" class="form-control" name="productimage"  id="productimage" >
						  </div>
						  <div class="col-10 offset-1">
						    <label for="productlocation" class="form-label">위치 </label>
						    <input type="text" class="form-control" name="productlocation" id="productlocation">
						  </div>
						  <div class="col-10 offset-1">
						    <label for="productopendate" class="form-label">오픈일 </label>
						    <input type="text" class="form-control" name="productopendate" id="productopendate">
						  </div>
						    <div class="col-10 offset-1">
						    <label for="productclosedate" class="form-label">마감일 </label>
						    <input type="text" class="form-control" name="productclosedate" id="productclosedate">
						  </div>
						  <div class="col-10 offset-1">
						    <label for="productticketcount" class="form-label">티켓 수</label>
						     <input type="text" class="form-control" name="productticketcount" id="productticketcount">
						  </div>
						  
						  <div class="col-10 offset-1">
						    <label for="productremainticketcount" class="form-label">남은 티켓 수</label>
						    <input type="text" class="form-control" name="productremainticketcount" id="productremainticketcount">
						  </div>
						  
						  <div class="col-10 offset-1 mt-5 text-center">
							<input type="submit" value="등록하기" class="btn btn-primary">				    
							<input type="button" value="목록보기" class="btn btn-warning"
								onclick="location.href='productList'">				    
						  </div>				  
						</form>
					</div>
			</div>
			</div>
			</div>
	
	<div id="summernote"></div>
    <script>
      $('#summernote').summernote({
        placeholder: 'Hello stand alone ui',
        tabsize: 2,
        height: 120,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture', 'video']],
          ['view', ['fullscreen', 'codeview', 'help']]
        ]
      });
    </script>	