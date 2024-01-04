<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="resources/css/donggyun.css" rel="stylesheet">
<script src="resources/js/donggyun.js"></script>
<style type="text/css">
div table tbody td {
	max-width: 560px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}
.font {
	font-size: small;
	color: #999999;
}
.table {
  border-collapse: collapse;
  border-top: 3px solid #168;
}  
.table th {
  color: #168;
  background: #f0f6f9;
  text-align: center;
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

	<!-- content -->
	<div class="row">
		<div class="col-3">
			<jsp:include page="/WEB-INF/views/manage/customer/customerSide.jsp" />
		</div>		
		<div class="col-9 text-start mt-5">
			<div class="row">
				<div class="col-10 text-start border-2 border-dark border-bottom pb-3">
					<span class="fw-bold fs-2">공지사항</span>
				</div>
			</div>

			<div class="row">
				<div class="col-10 text-start my-3 border-1 border-dark border-bottom pb-3">
					<span class="font text-secondary"><i
						class="bi bi-shield-exclamation"></i> GALAGO 업데이트 정보등 다양한 소식을
						알려드립니다.</span>
				</div>
			</div>

			<div class="row">
				<div class="col-10 text-center">
					<div class="col-2 offset-10 mt-3">
						<a href="noticeWrite"
							class="text-decoration-none text-danger link-secondary border border-danger rounded px-4 py-2">공지
							작성</a>
					</div>
					<table class="table mt-4">
						<thead>
							<tr>
								<th class="py-3">NO</th>
								<th class="py-3 text-center">제목</th>
								<th class="py-3">등록일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="n" items="${nList}">
								<tr class="text-start">
									<td class="py-3 text-center">${n.noticeNo}</td>
									<td class="py-3 px-5 text-start"><a
										href="noticeDetail?noticeNo=${n.noticeNo}&pageNum=${currentPage}"
										class="text-decoration-none link-black fontbold">${ n.noticeTitle }</a></td>
									<td class="py-3 text-end"><span class="font">${n.noticeUploadDate}</span></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			
			<!-- 페이지 네이션 -->
			<div class="row">
				<div class="col-8 my-4 text-center">
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">

							<c:if test="${ startPage > pageGroup }">
								<li class="page-item"><a class="page-link"
									href="noticeMain?pageNum=${startPage - pageGroup }">이전</a></li>
							</c:if>

							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<c:if test="${i == currentPage}">
									<li class="page-item " aria-current="page"><span
										class="page-link">${i}</span></li>
								</c:if>

								<c:if test="${i != currentPage}">
									<li class="page-item"><a class="page-link"
										href="noticeMain?pageNum=${i}">${i}</a></li>
								</c:if>
							</c:forEach>

							<c:if test="${ endPage < pageCount }">
								<li class="page-item"><a class="page-link"
									href="noticeMain?pageNum=${endPage + 1}">다음</a></li>
							</c:if>

						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>	