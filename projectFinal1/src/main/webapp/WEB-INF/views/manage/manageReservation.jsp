<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
</style>

<div class="row">
	<div class="col">
	
		<div class="row">
			<div class="col-4">
				<jsp:include page="/WEB-INF/views/manage/manageSide.jsp"/>
			</div>
			
			<div class="col-8 text-start mt-5" id="reservationPage">
				<span class="font-bold p-4"><h3>예약 관리</h3></span>			
				
				<form name="checkForm" id="checkForm">
					<input type="hidden" name="reservationno" id="reservationno" value="${ r.reservationno }"> 
					<input type="hidden" name="pageNum" value="${ pageNum }" />

					<div class="row justify-content-center mb-5">
						<div class="col-auto">
							<select name="type" class="form-select" style="border-color:#168;">
								<option value="reservationno">예약 번호</option>
								<option value="id">아이디</option>
								<option value="reservationdate">예약 날짜</option>
							</select>
						</div>
						<div class="col-3">
							<input type="text" name="keyword" class="form-control" style="border-color:#168;"/>
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
					<div class="col">
						<table class="table table-hover">
							<thead>
								<tr class="table-secondary text-center" style="color:black; font-size:small;">
									<th>예약 번호</th>
									<th>아이디</th>
									<th>상품 번호</th>
									<th>예약 금액</th>
									<th>예약 티켓 수</th>
									<th>예약 날짜</th>
									<th></th>
									<th></th>
								</tr>
							</thead>
							<tbody class="text-secondary">	
							
							
							<!--검색 요청이면서 요청 게시글이 있는 경우 -->
							<c:if test="${searchOption and not empty rList }">						
								
								<c:forEach var="r" items="${rList}">
									<tr class="text-center" style="color:black; font-size:small;">
										<td>${ r.reservationno }</td>
										<td>${ r.id }</td>
										<td>${ r.productno }번</td>
										<td>${ r.reservationprice }원</td>
										<td>${ r.reservationticketcount }장</td>
										<td>${ r.reservationdate }</td>						
										<td>
										<a href="updateManageReservation?reservationno=${ r.reservationno }"
												class="btn btn-outline-warning py-0" role="button" style="font-size:small;">예약 수정</a>
										</td>
										<td><button type="button" class="btn btn-outline-danger py-0" 
										id="reservationDelete" data-no="${ r.reservationno }" style="font-size:small;">예약 취소</button></td>
										
									</tr>
								</c:forEach>							
							</c:if>	
							
							<!--일반 리스트 요청일 때 요청 게시글이 있는 경우 -->
							<c:if test="${not searchOption and not empty rList }">						
								
								<c:forEach var="r" items="${rList}">
									<tr class="text-center" style="color:black; font-size:small">
										<td>${ r.reservationno }</td>
										<td>${ r.id }</td>
										<td>${ r.productno }번</td>
										<td>${ r.reservationprice }원</td>
										<td>${ r.reservationticketcount }장</td>
										<td>${ r.reservationdate }</td>						
										<td>
										<a href="updateManageReservation?reservationno=${ r.reservationno }"
												class="btn btn-outline-warning py-0" role="button" style="font-size:small;">예약 수정</a>
										</td>
										<td><button type="button" class="btn btn-outline-danger py-0" 
										id="reservationDelete" data-no="${ r.reservationno }" style="font-size:small;">예약 취소</button></td>
										
									</tr>
								</c:forEach>							
							</c:if>	
							
							
							<!-- 검색 요청일 때 게시 글이 없는 경우 -->
							<c:if test="${ searchOption and empty rList }">
								<tr>
									<td colspan="10" class="text-center">"${ keyword }"가 포함된
										검색이 존재하지 않습니다.</td>
								</tr>
							</c:if>


							<!--일반 리스트 요청일 때 게시 글이 없는 경우 -->
							<c:if test="${not searchOption and empty rList }">
								<tr>
									<td colspan="10" class="text-center">게시글이 존재하지 않습니다.</td>
								</tr>
							</c:if>
								
							</tbody>
						</table>
					</div>
				</div>
				
				
			<!-- 검색 요청이면서 검색된 리스트가 존재할 경우 페이지 네이션 -->
			<c:if test="${searchOption and not empty rList}">
				<div class="row">
					<div class="col text-center my-5">
						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center">
	
								<c:if test="${ startPage > pageGroup }">
									<li class="page-item"><a class="page-link"
										href="manageReservation?pageNum=${startPage - pageGroup }">Pre</a></li>
								</c:if>
	
								<c:forEach var="i" begin="${startPage}" end="${endPage}">
									<c:if test="${i == currentPage}">
										<li class="page-item active" aria-current="page"><span
											class="page-link">${i}</span></li>
									</c:if>
	
									<c:if test="${i != currentPage}">
										<li class="page-item"><a class="page-link"
											href="manageReservation?pageNum=${i}">${i}</a></li>
									</c:if>
								</c:forEach>
	
								<c:if test="${ endPage < pageCount }">
									<li class="page-item"><a class="page-link"
										href="manageReservation?pageNum=${endPage + 1}">Next</a></li>
								</c:if>
	
							</ul>
						</nav>
					</div>
				</div>
			</c:if>
				
			<!-- 검색 요청이면서 검색된 리스트가 존재할 경우 페이지 네이션 -->
			<c:if test="${not searchOption and not empty rList}">
				<div class="row">
					<div class="col text-center my-5">
						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center">
	
								<c:if test="${ startPage > pageGroup }">
									<li class="page-item"><a class="page-link"
										href="manageReservation?pageNum=${startPage - pageGroup }">Pre</a></li>
								</c:if>
	
								<c:forEach var="i" begin="${startPage}" end="${endPage}">
									<c:if test="${i == currentPage}">
										<li class="page-item active" aria-current="page"><span
											class="page-link">${i}</span></li>
									</c:if>
	
									<c:if test="${i != currentPage}">
										<li class="page-item"><a class="page-link"
											href="manageReservation?pageNum=${i}">${i}</a></li>
									</c:if>
								</c:forEach>
	
								<c:if test="${ endPage < pageCount }">
									<li class="page-item"><a class="page-link"
										href="manageReservation?pageNum=${endPage + 1}">Next</a></li>
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
