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
	max-width: 300px;
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
					<span class="font-bold p-4"><h3>상품 문의함</h3></span>				
					<div class="row">
						<div class="col">
							<table class="table table-hover">
								<thead>
									<tr class="table-secondary text-center">
										<th class="px-4" style="width:100px;">아이디</th>
										<th class="" style="width:350px;">문의 제목</th>
										<th class="" style="width:150px;">이메일</th>
										<th class="" style="width:150px;">문의 날짜</th>
									</tr>
								</thead>
								<tbody class="text-secondary">								
									
									<c:forEach var="i" items="${iList}">
										<tr style="color:black;">
											<td class="text-center">${ i.id }</td>
											<td class="px-4"><a href="manageProductDetail?questionNo=${i.questionNo}&pageNum=${currentPage}" 
												class="text-decoration-none" style="color:black;">${ i.questionTitle }</a></td>
											<td class="text-center">${ i.email }</td>
											<td class="text-center">${ i.questionDate }</td>										
										</tr>
									</c:forEach>							
									
								</tbody>
							</table>
						</div>
					</div>
					
					<!-- 페이지네이션 -->
					<div class="row">
						<div class="col offset-1 text-center my-5">
							<nav aria-label="Page navigation example">
								<ul class="pagination justify-content-center">

									<c:if test="${ startPage > pageGroup }">
										<li class="page-item"><a class="page-link"
											href="manageProduct?pageNum=${startPage - pageGroup }&qestionCategory=${qestionCategory}">Pre</a></li>
									</c:if>

									<c:forEach var="i" begin="${startPage}" end="${endPage}">
										<c:if test="${i == currentPage}">
											<li class="page-item active" aria-current="page"><span
												class="page-link">${i}</span></li>
										</c:if>

										<c:if test="${i != currentPage}">
											<li class="page-item"><a class="page-link"
												href="manageProduct?qestionCategory=${qestionCategory}&pageNum=${i}">${i}</a></li>
										</c:if>
									</c:forEach>

									<c:if test="${ endPage < pageCount }">
										<li class="page-item"><a class="page-link"
											href="manageProduct?pageNum=${endPage + 1}&qestionCategory=${qestionCategory}">Next</a></li>
									</c:if>

								</ul>
							</nav>
						</div>
					</div>
					
					
					
					
				</div>		
			</div>
		</div>
	</div>