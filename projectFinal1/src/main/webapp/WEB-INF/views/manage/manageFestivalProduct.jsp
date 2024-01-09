<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="resources/css/donggyun.css" rel="stylesheet">
<style>
.table {
  border-collapse: collapse;
  border-top: 3px solid #168;
}  
.table th {
  color: #168;
  background: #f0f6f9;
  text-align: center;
  font-size: small;
}
.table th, .table td {
  padding: 10px;
  border: 1px solid #ddd;
}
.table th:first-child, .table td:first-child {
  border-left: 0;
}
.table th:last-child, .table td:last-child {
  border-right: 0;
}
.table tr td:first-child{
  text-align: center;
}
.table caption{caption-side: bottom; display: none;
}

div table tbody td {
	max-width: 200px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}
</style>      

	<!-- content -->
	<div class="row">
		<div class="col">
		
			<div class="row">
				<div class="col-4">
					<jsp:include page="/WEB-INF/views/manage/manageSide.jsp"/>
				</div>
				
				
				<div class="col-8 text-start mt-5">
					<span class="font-bold p-4"><h3>상품 관리</h3></span>	
					
					<form name="checkForm" id="checkForm">
					<input type="hidden" name="pageNum" value="${ pageNum }" />

					<div class="row justify-content-center mb-5">
						<div class="col-auto">
							<select name="type" class="form-select" style="border-color:#168;">
								<option value="productname">상품명</option>
								<option value="productprice">가격</option>
								<option value="productlocation">위치</option>
							</select>
						</div>
						<div class="col-3">
							<input type="text" name="keyword" class="form-control" 
								style="border-color:#168;">
						</div>
						<div class="col-auto">
							<input type="submit" value="검 색" class="custom-btn btn-3 px-3" />
						</div>
					</div>
				</form>
								
					<!-- 검색 요청일 경우 -->
				<c:if test="${searchOption}">
					<div class="row mb-4">
						<div class="col text-center">"${keyword}" 검색 결과</div>
					</div>
				</c:if>


				<div class="row">
					<div class="col text-center">
						<table class="table table-hover">
							<thead>
								<tr class="table-secondary">
									<th>상품명</th>
									<th style="width:80px;">가격</th>
									<th>지역</th>									
									<th style="width:100px;">티켓 수</th>
									<th style="width:200px;">남은 티켓 수</th>
									<th></th>	
									<th></th>					
								</tr>
							</thead>
							<tbody class="text-secondary">

								<!--검색 요청이면서 요청 게시글이 있는 경우 -->
								<c:if test="${searchOption and not empty pList }">

									<c:forEach var="p" items="${pList}">

										<tr style="color:black; font-size:small;">
											<td>${ p.productname }</td>
											<td>${ p.productprice }원</td>
											<td>${ p.productlocation }</td>											
											<td>${ p.productticketcount }</td>
											<td>${ p.productremainticketcount }</td>																						
											<td><a href="update?productno=${ p.productno }&pageNum=${currentPage}&adminpassword=1234"
												class="btn btn-outline-warning py-0" role="button" style="font-size:small;" id="ManageProductUpdate">상품 수정</a></td>
											<td><button type="button" class="manageProductDelete btn btn-outline-danger py-0" 
												data-no="${ p.productno }" style="font-size:small;">상품 삭제</button></td>													
										</tr>
									</c:forEach>
								</c:if>

								<!--일반 리스트 요청일 때 요청 게시글이 있는 경우 -->
								<c:if test="${not searchOption and not empty pList }">

									<c:forEach var="p" items="${pList}">

										<tr style="color:black; font-size:small;">
											<td>${ p.productname }</td>
											<td>${ p.productprice }원</td>
											<td>${ p.productlocation }</td>											
											<td>${ p.productticketcount }</td>
											<td>${ p.productremainticketcount }</td>											
											<td><a href="update?productno=${ p.productno }&pageNum=${currentPage}&adminpassword=1234"
												class="btn btn-outline-warning py-0" role="button" style="font-size:small;" id="ManageProductUpdate">상품 수정</a></td>
											<td><button type="button" class="manageProductDelete btn btn-outline-danger py-0" 
												data-no="${ p.productno }" style="font-size:small;">상품 삭제</button></td>													
										</tr>
									</c:forEach>
								</c:if>


								<!-- 검색 요청일 때 게시 글이 없는 경우 -->
								<c:if test="${ searchOption and empty pList }">
									<tr>
										<td colspan="10" class="text-center">"${ keyword }"가 포함된
											검색이 존재하지 않습니다.</td>
									</tr>
								</c:if>


								<!--일반 리스트 요청일 때 게시 글이 없는 경우 -->
								<c:if test="${not searchOption and empty pList }">
									<tr>
										<td colspan="10" class="text-center">회원이 존재하지 않습니다.</td>
									</tr>
								</c:if>

							</tbody>
						</table>
					</div>
				</div>


				<!-- 검색 요청이면서 검색된 리스트가 존재할 경우 페이지 네이션 -->
				<c:if test="${searchOption and not empty pList}">
					<div class="row">
						<div class="coltext-center my-5">
							<nav aria-label="Page navigation example">
								<ul class="pagination justify-content-center">

									<c:if test="${ startPage > pageGroup }">
										<li class="page-item"><a class="page-link"
											href="manageFestivalProduct?pageNum=${startPage - pageGroup }">Pre</a></li>
									</c:if>

									<c:forEach var="i" begin="${startPage}" end="${endPage}">
										<c:if test="${i == currentPage}">
											<li class="page-item active" aria-current="page"><span
												class="page-link">${i}</span></li>
										</c:if>

										<c:if test="${i != currentPage}">
											<li class="page-item"><a class="page-link"
												href="manageFestivalProduct?pageNum=${i}">${i}</a></li>
										</c:if>
									</c:forEach>

									<c:if test="${ endPage < pageCount }">
										<li class="page-item"><a class="page-link"
											href="manageFestivalProduct?pageNum=${endPage + 1}">Next</a></li>
									</c:if>

								</ul>
							</nav>
						</div>
					</div>
				</c:if>


				<!-- 일반 게시글 요청이면서 검색된 리스트가 존재할 경우 페이지네이션  -->
				<c:if test="${not searchOption and not empty pList}">
					<div class="row">
						<div class="col text-center my-5">
							<nav aria-label="Page navigation example">
								<ul class="pagination justify-content-center">

									<c:if test="${ startPage > pageGroup }">
										<li class="page-item"><a class="page-link"
											href="manageFestivalProduct?pageNum=${startPage - pageGroup }">Pre</a></li>
									</c:if>

									<c:forEach var="i" begin="${startPage}" end="${endPage}">
										<c:if test="${i == currentPage}">
											<li class="page-item active" aria-current="page"><span
												class="page-link">${i}</span></li>
										</c:if>

										<c:if test="${i != currentPage}">
											<li class="page-item"><a class="page-link"
												href="manageFestivalProduct?pageNum=${i}">${i}</a></li>
										</c:if>
									</c:forEach>

									<c:if test="${ endPage < pageCount }">
										<li class="page-item"><a class="page-link"
											href="manageFestivalProduct?pageNum=${endPage + 1}">Next</a></li>
									</c:if>

								</ul>
							</nav>
						</div>
					</div>
				</c:if>
					
					
					
					
				</div>		
			</div>
		</div>
	</div>