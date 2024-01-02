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

#tr td:hover{
  background-color:#FFFFFF;
}

input {
	outline:none;
	border:none;
	}
input:focus {
	outline:none;
	border:none;
}	
</style>

	<div class="row">
		<div class="col-4">
			<jsp:include page="/WEB-INF/views/manage/manageSide.jsp"/>
		</div>
		
		<div class="col-8 text-start mt-5">
			<span class="font-bold p-4"><h3>쿠폰 관리</h3></span>		
			
			<form name="checkForm" id="checkForm">
				<input type="hidden" name="pageNum" value="${ pageNum }" />

				<div class="row justify-content-center mb-5">
					<div class="col-auto">
						<select name="type" class="form-select" style="border-color:#168;">
							<option value="id">아이디</option>
							<option value="couponno">쿠폰 번호</option>
							<option value="couponopendate">발행일</option>
							<option value="couponclosedate">만료일</option>
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
				<div class="col">
					<table class="table table-hover">
						<thead>
							<tr class="table-secondary">
								<th>아이디</th>
								<th>쿠폰 번호</th>
								<th>발행일</th>
								<th>만료일</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody class="text-secondary text-center" id="tbody" style="font-size:small;">
						
							<!--검색 요청이면서 요청 게시글이 있는 경우 -->
							<c:if test="${searchOption and not empty memberCouponList }">
							<c:forEach var="m" items="${memberCouponList}" varStatus="s">
								<input type="hidden" class="text-center" id="memberCouponId_${s.count}" value="${ m.membercouponno }">
								<tr id="tr" style="color:black;">									
										<td><input type="text" class="text-center" id="couponId_${s.count}" name="couponId" value="${ m.id }" style="border-width: 0; width:70px;" readonly="readonly"></td>
										<td><input type="text" class="text-center" id="couponno_${s.count}" name="couponno" value="${ m.couponno }" style="border-width: 0; width:70px;"></td>
										<td><input type="text" class="text-center" id="couponopendate_${s.count}" name="couponopendate" value="${ m.couponopendate }" style="border-width: 0;"></td>
										<td><input type="text" class="text-center" id="couponclosedate_${s.count}" name="couponclosedate" value="${ m.couponclosedate }" style="border-width: 0;"></td>
										<td><button type="button" class="btn btn-outline-warning py-0 manageMemberCouponUpdate" 
											id="manageMemberCouponUpdate" data-no="${s.count}" style="font-size:small;">쿠폰 수정</button></td>
										<td><button type="button" class="btn btn-outline-danger py-0" 
											id="manageMemberCouponDelete" data-no="${ m.membercouponno}" style="font-size:small;">쿠폰 삭제</button></td>	
									</tr>									
							</c:forEach>
							</c:if>
							
							<!--검색 요청이면서 요청 게시글이 있는 경우 -->
							<c:if test="${not searchOption and not empty memberCouponList }">
							<c:forEach var="m" items="${memberCouponList}" varStatus="s">
								<input type="hidden" class="text-center" id="memberCouponId_${s.count}" value="${ m.membercouponno }">
								<tr id="tr" style="color:black;">									
										<td><input type="text" class="text-center" id="couponId_${s.count}" name="couponId" value="${ m.id }" style="border-width: 0; width:70px;" readonly="readonly"></td>
										<td><input type="text" class="text-center" id="couponno_${s.count}" name="couponno" value="${ m.couponno }" style="border-width: 0; width:70px;"></td>
										<td><input type="text" class="text-center" id="couponopendate_${s.count}" name="couponopendate" value="${ m.couponopendate }" style="border-width: 0;"></td>
										<td><input type="text" class="text-center" id="couponclosedate_${s.count}" name="couponclosedate" value="${ m.couponclosedate }" style="border-width: 0;"></td>
										<td><button type="button" class="btn btn-outline-warning py-0 manageMemberCouponUpdate" 
											id="manageMemberCouponUpdate" data-no="${s.count}" style="font-size:small;">쿠폰 수정</button></td>
										<td><button type="button" class="btn btn-outline-danger py-0" 
											id="manageMemberCouponDelete" data-no="${ m.membercouponno}" style="font-size:small;">쿠폰 삭제</button></td>	
									</tr>									
							</c:forEach>
							</c:if>
							
							<!-- 검색 요청일 때 게시 글이 없는 경우 -->
								<c:if test="${ searchOption and empty memberCouponList }">
									<tr>
										<td colspan="10" class="text-center">"${ keyword }"가 포함된
											검색이 존재하지 않습니다.</td>
									</tr>
								</c:if>

								<!--일반 리스트 요청일 때 게시 글이 없는 경우 -->
								<c:if test="${not searchOption and empty memberCouponList }">
									<tr>
										<td colspan="10" class="text-center">게시물이 존재하지 않습니다.</td>
									</tr>
								</c:if>
							
															
						</tbody>
					</table>			
				</div>
			</div>
			
			
				<!-- 검색 요청이면서 검색된 리스트가 존재할 경우 페이지 네이션 -->
				<c:if test="${searchOption and not empty memberCouponList}">				
					<div class="row">
						<div class="col text-center my-5">
							<nav aria-label="Page navigation example">
								<ul class="pagination justify-content-center">
		
									<c:if test="${ startPage > pageGroup }">
										<li class="page-item"><a class="page-link"
											href="manageCoupon?pageNum=${startPage - pageGroup }">이전</a></li>
									</c:if>
		
									<c:forEach var="i" begin="${startPage}" end="${endPage}">
										<c:if test="${i == currentPage}">
											<li class="page-item " aria-current="page"><span
												class="page-link">${i}</span></li>
										</c:if>
		
										<c:if test="${i != currentPage}">
											<li class="page-item"><a class="page-link"
												href="manageCoupon?pageNum=${i}">${i}</a></li>
										</c:if>
									</c:forEach>
		
									<c:if test="${ endPage < pageCount }">
										<li class="page-item"><a class="page-link"
											href="manageCoupon?pageNum=${endPage + 1}">다음</a></li>
									</c:if>
		
								</ul>
							</nav>
						</div>
					</div>
				</c:if>
				
				<!-- 검색 요청이면서 검색된 리스트가 존재할 경우 페이지 네이션 -->
				<c:if test="${not searchOption and not empty memberCouponList}">				
					<div class="row">
						<div class="col text-center my-5">
							<nav aria-label="Page navigation example">
								<ul class="pagination justify-content-center">
		
									<c:if test="${ startPage > pageGroup }">
										<li class="page-item"><a class="page-link"
											href="manageCoupon?pageNum=${startPage - pageGroup }">이전</a></li>
									</c:if>
		
									<c:forEach var="i" begin="${startPage}" end="${endPage}">
										<c:if test="${i == currentPage}">
											<li class="page-item " aria-current="page"><span
												class="page-link">${i}</span></li>
										</c:if>
		
										<c:if test="${i != currentPage}">
											<li class="page-item"><a class="page-link"
												href="manageCoupon?pageNum=${i}">${i}</a></li>
										</c:if>
									</c:forEach>
		
									<c:if test="${ endPage < pageCount }">
										<li class="page-item"><a class="page-link"
											href="manageCoupon?pageNum=${endPage + 1}">다음</a></li>
									</c:if>
		
								</ul>
							</nav>
						</div>
					</div>
				</c:if>
			
			
		</div>				
	</div>
	
	