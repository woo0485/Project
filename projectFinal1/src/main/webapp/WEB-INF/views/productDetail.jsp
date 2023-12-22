<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
			<!-- 게시 글 상세보기 영역  --> 
		<div class="row my-3">
			<div class="col">
				<table class="table table-bordered" >
					<tbody>					
						<tr>
							<th class="table-secondary">제 목</th>
							<td colspan="3">${ product.productname }</td>		
						</tr>
						<tr>
							<th>가격</th>
							<td>${ product.productprice }</td>
							<th>오픈일</th>
							<td>${ product.productopendate }</td>
							<th>마감일</th>
							<td>${ product.productclosedate }</td>
							<th>티켓매수</th>
							<td>${ product.productticketcount }</td>
							<th>남은 티켓 수</th>
							<td>${ product.productremainticketcount }</td>
						</tr>
						<tr>		
							<th>비밀번호</th>
							<td>
								<div class="col-sm-8">
									<input class="form-control" type="password" name="adminpassword" id="adminpassword">
								</div>
							</td>
							<th>조회수</th>
							<td>${ product.productreadcount }</td>
							<th>티켓 수량</th>
							<td>
								<label>수량을 선택하세요<input type="number" name="number_select" min="1" max="4" value="1"> </label>
							</td>
						</tr>	
						
						<tr>		
							<td colspan="4">
									<img src="${product.productimage}" />
							</td>
						</tr>	
						<tr>		
							<td colspan="4">
								<pre>${ product.productcontent }</pre>
							</td>
						</tr>	
					</tbody>
				</table>
			</div>
		</div>
			
			<div class="row my-3">
				<div class="col text-center">
				<a href="priceOrder" class="text-decoration-none link-secondary"> 구매하기 </a>
				
					<input class="btn btn-primary" type="button" value="구매하기" 
						onclick="location.href='priceOrder'"/>  &nbsp;&nbsp;
						
					<input class="btn btn-warning" type="button" id="detailBasket" value="장바구니"> <br><br>
					<input class="btn btn-warning" type="button" id="detailUpdate" value="수정하기"> &nbsp;&nbsp;
					<input class="btn btn-danger" type="button" id="detailDelete" value="삭제하기"> 
					
				<%-- 일반 게시 글 리스트에서 온 요청이면 일반 게시 글 리스트로 돌려 보낸다. --%>
				<c:if test="${ not searchOption }">	
				&nbsp;&nbsp;<input class="btn btn-primary" type="button" value="목록보기" 
						onclick="location.href='productList?pageNum=${pageNum}'"/>
				</c:if>
			<%-- 검색 리스트에서 온 요청이면 검색 리스트의 동일한 페이지로 돌려보낸다. --%>
				<c:if test="${ searchOption }">	
				&nbsp;&nbsp;<input class="btn btn-primary" type="button" value="목록보기" 
						onclick="location.href='productList?pageNum=${pageNum}&type=${ type }&keyword=${ keyword }'"/>
				</c:if>
			</div>		
		</div>
	</div>
</div>	