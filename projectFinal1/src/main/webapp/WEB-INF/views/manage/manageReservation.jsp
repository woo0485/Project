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
</style>

<div class="row">
	<div class="col">
	
		<div class="row">
			<div class="col-4">
				<jsp:include page="/WEB-INF/views/manage/manageSide.jsp"/>
			</div>
			
			<div class="col-8 text-start mt-5" id="reservationPage">
				<span class="font-bold p-4"><h3>예약 관리</h3></span>				
				<div class="row">
					<div class="col">
						<table class="table table-hover">
							<thead>
								<tr class="table-secondary text-center" style="color:black;">
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
								
								<c:forEach var="r" items="${rList}">
									<tr class="text-center" style="color:black;">
										<td>${ r.reservationno }</td>
										<td>${ r.id }</td>
										<td>${ r.productno }번</td>
										<td>${ r.reservationprice }원</td>
										<td>${ r.reservationticketcount }장</td>
										<td>${ r.reservationdate }</td>
										<td>
										<a href="updateManageReservation?reservationno=${ r.reservationno }"
												class="btn btn-outline-warning py-0" role="button">예약 수정</a>
										</td>
										<td><button type="button" class="btn btn-outline-danger py-0" 
										id="reservationDelete" data-no="${ r.reservationno }">예약 취소</button></td>
										
									</tr>
								</c:forEach>							
								
							</tbody>
						</table>
					</div>
				</div>
			</div>
			
		</div>

	</div>
</div>
