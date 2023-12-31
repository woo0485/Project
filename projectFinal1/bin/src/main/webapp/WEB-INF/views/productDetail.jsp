<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="resources/css/hyunju.css" rel="stylesheet">
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="resources/js/HyunJu.js"></script>

<!-- content 영역 -->
<div class="row my-5" id="global-content">
	<div class="offset-1 col-10">
		<form name="checkForm" id="checkForm">
			<input type="hidden" name="productno" id="productno" value="${product.productno}"> 
			<input type="hidden" name="adminpassword" id="rPass"> 
			<input type="hidden" name="pageNum" value="${ pageNum }" />

			<c:if test="${ searchOption }">
				<input type="hidden" name="type" value="${ type }" />
				<input type="hidden" name="keyword" value="${ keyword }" />
			</c:if>
		</form>
		<!-- @@@@@@@@ 게시 글 상세보기 영역  @@@@@@@@@@-->
		<table>
		<tr>
			<td><img src="${product.productimage}"  width="400" height="500" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td> 
			
			<td>
			<!--  오른쪽에 뜨는 축제 정보 글 한묶음 -->
				<h2>${ product.productname }</h2>
					기간 ${ product.productopendate } ~ ${ product.productclosedate } <br>
					금액 ${ product.productprice }  <br><br>
		<!--  수량 선택 -->
			<label>수량을 선택하세요<input type="number" name="number_select" min="1" max="4" value="1"></label> 
		<!--  수량 선택 끝--> <br><br>
				<a href="priceOrder" class="text-decoration-none link-secondary">구매하기 </a> 
				<input class="btn btn-primary" type="button" value="구매하기"
							onclick="location.href='priceOrder'" /> &nbsp;&nbsp; 
				<a href="basket" class="text-decoration-none link-secondary">장바구니 뷰테스트 </a> 
				
				<input class="btn btn-warning" type="button" id="detailBasket" value="장바구니"> <br>
						<br>
						전체 티켓 수: ${ product.productticketcount }
						남은 티켓 수: ${ product.productremainticketcount }
						조회수: ${ product.productreadcount }
						<!--  축제 정보 글 한묶음 끝 -->
			</td>
		</tr>
		</table>
				<br><br><br>
				<!-- ///////////  축제 정보 이미지와 내용  //////////// -->
				<img src="http://via.placeholder.com/800x1000" alt="">
				<pre>${ product.productcontent }</pre>
			</div>
		</div>
		
		<!-- @@  여기서부터는 관리자가 수정 삭제할 수 있게 하는.....  @@-->
		<div class="row my-3">
			<div class="col text-center">
			<!--  수정하려면 비밀번호 입력하는 영역 -->
		<div>
			수정하기 폼으로 이동하거나, 삭제하려면 관리자 비밀번호를 입력하시오. 
			<input class="form-control" type="password" name="adminpassword" id="adminpassword">
		</div>
		<br>
		<!--  수정하려면 비밀번호 입력하는 영역  끝-->
				<input class="btn btn-warning" type="button" id="detailUpdate" value="수정 폼 이동"> &nbsp;&nbsp; 
				<input class="btn btn-danger" type="button" id="detailDelete" value="삭제하기">

				<%-- 일반 게시 글 리스트에서 온 요청이면 일반 게시 글 리스트로 돌려 보낸다. --%>
				<c:if test="${ not searchOption }">	
				&nbsp;&nbsp;<input class="btn btn-primary" type="button"
						value="목록보기"
						onclick="location.href='productList?pageNum=${pageNum}'" />
				</c:if>
				<%-- 검색 리스트에서 온 요청이면 검색 리스트의 동일한 페이지로 돌려보낸다. --%>
				<c:if test="${ searchOption }">	
				&nbsp;&nbsp;<input class="btn btn-primary" type="button"
						value="목록보기"
						onclick="location.href='productList?pageNum=${pageNum}&type=${ type }&keyword=${ keyword }'" />
				</c:if>
			</div>
		</div>
	</div>
</div>
