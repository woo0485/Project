<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="resources/css/hyunju.css" rel="stylesheet">
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="resources/js/HyunJu.js"></script>

<!-- content -->
<div class="row my-5" id="global-content">
<!--  검색 폼 -->
	<form name="searchForm" id="searchForm" action="#" 
			class="row justify-content-center my-3">
			<div class="col-auto">
				<select name="type" class="form-select">
					<option value="productname">제목</option>
					<option value="productcontent">내용</option>
					<option value="productlocation">지역</option>
				</select>
			</div>
			<div class="col-4">
				<input type="text" name="keyword" class="form-control"/>
			</div>
			<div class="col-auto">
				<input type="submit" value="검 색" class="btn btn-primary"/>
			</div>
		</form>
<!--  검색 폼 -->			
<!--  캐러셀 -->
	<div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel" >
  <div class="carousel-inner">
    <div class="carousel-item active" data-bs-interval="2000">
      <img src="resources/img/4.jpg" class="d-block w-10" alt="...">
    </div>
    <div class="carousel-item" data-bs-interval="2000">
      <img src="resources/img/5.jpg" class="d-block w-10" alt="...">
    </div>
    <div class="carousel-item" data-bs-interval="2000">
      <img src="resources/img/3.jpg" class="d-block w-10" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
<!--  캐러셀  끝-->	 		
<!-- 축제정보 등록 -->
		<div class="col-12 text-end">
				<a href="writeForm" class="btn btn-outline-success">축제정보 등록</a>
		</div>
<!-- 축제정보 등록 끝-->
		<!-- 검색 요청일 경우 아래를 화면에 표시 -->	
		<c:if test="${ searchOption }">			
			<div class="row my-3">
				<div class="col text-center">
					"${ keyword  }" 검색 결과
				</div>
			</div> 
			
			<%-- 검색 요청일 경우 일반 게시 글 리스트로 이동할 수 있도록 링크를 설정했다. --%>
			<div class="row my-3">
				<div class="col-6">
					<a href="productList" class="btn btn-outline-success">목록 보기</a>
				</div>
			</div>
		</c:if>
		
		<!-- //////////////////////검색 요청이 아닐 경우 아래를 화면에 표시//////////////////////////////// -->
		<c:if test="${ not searchOption }">
			<div class="row my-3"></div>
		</c:if>
		
		<div class="row my-3">
			<div class="col">
				<table class="table table-hover">
					<tbody class="text-secondary">
						
		<c:set var="i" value="0" />
			<c:set var="j" value="4" />
					<c:if test="${ searchOption and not empty productList }">
						<c:forEach var="p" items="${productList}" varStatus="status">
						<c:if test="${i%j == 0 }">
						<tr>
						</c:if>
						
					<td><a href="productDetail?productno=${p.productno}&pageNum=${currentPage}" 
								class="text-decoration-none link-secondary">
								<img src="${p.productimage}"  width="300" height="200" /></a> <br>
	
					지역 : ${ p.productlocation } <br>
					북마크 수 : ${ p.productbookmarkcount } <br>
					<a href="productDetail?productno=${p.productno}&pageNum=${currentPage}" 
								class="text-decoration-none link-secondary">${ p.productname }</a> <br>
					이름 : ${ p.productname } <br>
					가격: ${ p.productprice } <br>
					</td>
			
							<c:if test="${i%j == j-1 }">		
						</c:if>
						 <c:set var="i" value="${i+1 }" />
						</c:forEach>
					</c:if>
					
<%--@@@ 일반 게시 글 리스트 요청 이면서 게시 글 리스트가 존재할 경우 게시 글 상세보기로 링크를 적용할 때 type과 keyword 파라미터는 필요 없다. @@@--%>
<c:set var="i" value="0" />
		<c:set var="j" value="4" />
					<c:if test="${ not searchOption and not empty productList }">
						<c:forEach var="p" items="${productList}" varStatus="status">
						 	<c:if test="${i%j == 0 }">
						<tr>
						</c:if>
						
					<td><a href="productDetail?productno=${p.productno}&pageNum=${currentPage}" 
								class="text-decoration-none link-secondary">
								<img src="${p.productimage}"  width="300" height="200" /></a> <br>
	
					
					지역 : ${ p.productlocation } <br>
					북마크 수 : ${ p.productbookmarkcount } <br>
					<a href="productDetail?productno=${p.productno}&pageNum=${currentPage}" 
								class="text-decoration-none link-secondary">${ p.productname }</a> <br>
					이름 : ${ p.productname } <br>
					가격: ${ p.productprice } <br>
					</td>
			
							<c:if test="${i%j == j-1 }">		
						</c:if>
						 <c:set var="i" value="${i+1 }" />
						</c:forEach>
					</c:if>
					
<%--/////////////////////////// 검색 요청이면서 검색된 리스트가 존재하지 않을 경우////////////////////////////////////// --%>
					<c:if test="${ searchOption and empty productList }">
						<tr>
							<td colspan="5" class="text-center">
								"${ keyword }"가 포함된 게시 글이 존재하지 않습니다.
							</td>
						</tr>
					</c:if>
					
					<%-- 일반 게시 글 리스트 요청이면서 게시 글 리스트가 존재하지 않을 경우 --%>
					<c:if test="${ not searchOption and empty productList }">
						<tr>
							<td colspan="5" class="text-center">게시 글이 존재하지 않습니다.</td>
						</tr>
					</c:if>
					</tbody>					
				</table>
			</div>			
		</div>
		
		<!-- 검색 요청이면서 검색된 리스트가 존재할 경우 페이지네이션  -->
		<c:if test="${ searchOption and not empty productList }">
			<div class="row">
				<div class="col">
					<nav aria-label="Page navigation">
					  <ul class="pagination justify-content-center">

					  	<c:if test="${ startPage > pageGroup }">
						    <li class="page-item">
						      <a class="page-link" href="productList?pageNum=${ startPage - pageGroup }
						      &type=${ type }&keyword=${ keyword }">〈</a>
						    </li>
					    </c:if>
		
					    <c:forEach var="i" begin="${startPage}" end="${endPage}">
					    	<c:if test="${i == currentPage }">
					    	<li class="page-item active" aria-current="page">
					    		<span class="page-link">${i}</span>
					    	</li>
					    	</c:if>
					    	<c:if test="${i != currentPage }">
						    	<li class="page-item">
						    		<a class="page-link" href="productLisit?pageNum=${ i }&type=${ type }&keyword=${ keyword }">${i}</a>
						    	</li>
						    </c:if>					    
					    </c:forEach>
					    
					    <%--  ///////////////////////////////////// --%>
						<c:if test="${ endPage < pageCount }">
						    <li class="page-item">
						      <a class="page-link" href="productList?pageNum=${ startPage + pageGroup }
						      &type=${ type }&keyword=${ keyword }"> 〉</a>
						    </li>
					  	</c:if>
					  </ul>
					</nav>
				</div>
			</div>
		</c:if>
		
		<!-- 일반 게시글 요청이면서 검색된 리스트가 존재할 경우 페이지네이션  -->
		<c:if test="${ not searchOption and not empty productList }">
			<div class="row">
				<div class="col">
					<nav aria-label="Page navigation">
					  <ul class="pagination justify-content-center">
			
					  	<c:if test="${ startPage > pageGroup }">
						    <li class="page-item">
						      <a class="page-link" href="productList?pageNum=${ startPage - pageGroup }">〈</a>
						    </li>
					    </c:if>
			
					    <c:forEach var="i" begin="${startPage}" end="${endPage}">
					    	<c:if test="${i == currentPage }">
					    	<li class="page-item active" aria-current="page">
					    		<span class="page-link">${i}</span>
					    	</li>
					    	</c:if>
					    	<c:if test="${i != currentPage }">
						    	<li class="page-item"><a class="page-link" href="productList?pageNum=${ i }">${i}</a></li>
						    </c:if>					    
					    </c:forEach>
					    
						<c:if test="${ endPage < pageCount }">
						    <li class="page-item">
						      <a class="page-link" href="productList?pageNum=${ startPage + pageGroup }"> 〉</a>
						    </li>
					  	</c:if>
					  </ul>
					</nav>
				</div>
			</div>
		</c:if>
		
	</div>