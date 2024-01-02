<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
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
			<div class="col-8 text-start mt-5">
				<span class="font-bold p-4"><h3>매출 관리</h3></span>	
			
				<div class="row">
					<div class="col-5 pe-5">		
					
						<table class="table table-hover text-center">
							<thead>
								<tr class="table-secondary">
									<th>날짜</th>
									<th>일 매출</th>								
								</tr>
							</thead>
							<tbody class="text-secondary">							
								<c:forEach var="r" items="${rList}">
									<tr style="color:black; font-size:small;">
										<td>${ r.reservationdate }</td>
										<td>${ r.totalReservationPrice }원</td>								
									</tr>
								</c:forEach>							
							</tbody>
						</table>
						
						
						<!--일 매출 페이지 네이션 -->
						<div class="row">
							<div class="col my-3 text-center">
								<nav aria-label="Page navigation example">
									<ul class="pagination justify-content-center">
			
										<c:if test="${ startPage > pageGroup }">
											<li class="page-item"><a class="page-link"
												href="manageSales?pageNum=${startPage - pageGroup }">이전</a></li>
										</c:if>
			
										<c:forEach var="i" begin="${startPage}" end="${endPage}">
											<c:if test="${i == currentPage}">
												<li class="page-item " aria-current="page"><span
													class="page-link">${i}</span></li>
											</c:if>
			
											<c:if test="${i != currentPage}">
												<li class="page-item"><a class="page-link"
													href="manageSales?pageNum=${i}">${i}</a></li>
											</c:if>
										</c:forEach>
			
										<c:if test="${ endPage < pageCount }">
											<li class="page-item"><a class="page-link"
												href="manageSales?pageNum=${endPage + 1}">다음</a></li>
										</c:if>
			
									</ul>
								</nav>
							</div>
						</div>
						
					<form name="checkForm" id="checkForm">
						<input type="hidden" name="pageNum" value="${ pageNum }" />
	
						<div class="row justify-content-center mb-5">
							<div class="col-auto" style="display:none;">
								<select name="type" class="form-select">
									<option value="reservationdate">날짜</option>						
								</select>
							</div>
							<div class="col-7">
								<input type="text" name="keyword" class="form-control" placeholder="검색할 날짜"/ style="border-color:#168;">
							</div>
							<div class="col-2">
								<input type="submit" value="검 색" class="custom-btn btn-3 px-3" />
							</div>
						</div>
					</form>
	
					
				</div>
					
					<div class="col-5 me-5">
						<table class="table table-hover text-center">
							<thead>
								<tr class="table-secondary">
									<th class="px-4">2023년</th>
									<th class="px-5">매출</th>								
									<th>
										<c:if test="${ not empty dbSalesTotalPrice }">
											<button type="button" class="btn py-0" id="dbAllDelete" style="font-size:small; color:red;">초기화</button>
										</c:if>
									</th>
								
								</tr>
							</thead>
							<tbody class="text-secondary" style="font-size:small">	
							
								<tr style="color:black;">
									<form name="salesWriteForm" id="salesWriteForm" action="salesWriteProcess"
									 method="post" class="" onsubmit="alert('1월 매출 전송 완료');">						
										<c:forEach var="sales1" items="${salesTotalPrice1}">											
											<input type="hidden" name="salesDate" value="1월">
											<input type="hidden" name="salesTotalPrice" value="${ sales1.salesTotalPrice }">
											<td style="border-left: 0;">1월</td>																													
											<td>${ sales1.salesTotalPrice }원</td>																				
											<td><input type="submit" value="DB전송" class="btn py-0" id="dbsubmit1" style="font-size:small"></td>
											
										</c:forEach>
									</form>										
								</tr>
								
								<tr style="color:black;">
									<form name="salesWriteForm" id="salesWriteForm" action="salesWriteProcess"
									 method="post" class="" onsubmit="alert('2월 매출 전송 완료');">
									<c:forEach var="sales2" items="${salesTotalPrice2}">			
										<input type="hidden" name="salesDate" value="2월">
										<input type="hidden" name="salesTotalPrice" value="${ sales2.salesTotalPrice }">												
										<td style="border-left: 0;">2월</td>																		
										<td>${ sales2.salesTotalPrice }원</td>											
										<td><input type="submit" value="DB전송" class="btn px-4 py-0" id="dbsubmit2" style="font-size:small"></td>																						
									</c:forEach>									
									</form>
								</tr>
								
								<tr style="color:black;">
									<form name="salesWriteForm" id="salesWriteForm" action="salesWriteProcess"
									 method="post" class="" onsubmit="alert('3월 매출 전송 완료');">
									<c:forEach var="sales3" items="${salesTotalPrice3}">	
										<input type="hidden" name="salesDate" value="3월">
										<input type="hidden" name="salesTotalPrice" value="${ sales3.salesTotalPrice }">					
										<td style="border-left: 0;">3월</td>									
										<td>${ sales3.salesTotalPrice }원</td>	
										<td><input type="submit" value="DB전송" class="btn px-4 py-0" id="dbsubmit3" style="font-size:small"></td>																								
									</c:forEach>
									</form>
								</tr>
								
								<tr style="color:black;">
									<form name="salesWriteForm" id="salesWriteForm" action="salesWriteProcess"
									 method="post" class="" onsubmit="alert('4월 매출 전송 완료');">
									<c:forEach var="sales4" items="${salesTotalPrice4}">	
										<input type="hidden" name="salesDate" value="4월">
										<input type="hidden" name="salesTotalPrice" value="${ sales4.salesTotalPrice }">				
										<td style="border-left: 0;">4월</td>									
										<td>${ sales4.salesTotalPrice }원</td>
										<td><input type="submit" value="DB전송" class="btn px-4 py-0" id="dbsubmit4" style="font-size:small"></td>															
									</c:forEach>
									</form>
								</tr>
								
								<tr style="color:black;">
									<form name="salesWriteForm" id="salesWriteForm" action="salesWriteProcess"
									 method="post" class="" onsubmit="alert('5월 매출 전송 완료');">
									<c:forEach var="sales5" items="${salesTotalPrice5}">
										<input type="hidden" name="salesDate" value="5월">
										<input type="hidden" name="salesTotalPrice" value="${ sales5.salesTotalPrice }">						
										<td style="border-left: 0;">5월</td>									
										<td>${ sales5.salesTotalPrice }원</td>
										<td><input type="submit" value="DB전송" class="btn px-4 py-0" id="dbsubmit5" style="font-size:small"></td>																								
									</c:forEach>
									</form>
								</tr>
								
								<tr style="color:black;">
									<form name="salesWriteForm" id="salesWriteForm" action="salesWriteProcess"
									 method="post" class="" onsubmit="alert('6월 매출 전송 완료');">
									<c:forEach var="sales6" items="${salesTotalPrice6}">	
										<input type="hidden" name="salesDate" value="6월">
										<input type="hidden" name="salesTotalPrice" value="${ sales6.salesTotalPrice }">				
										<td style="border-left: 0;">6월</td>									
										<td>${ sales6.salesTotalPrice }원</td>
										<td><input type="submit" value="DB전송" class="btn px-4 py-0" id="dbsubmit6" style="font-size:small"></td>															
									</c:forEach>
									</form>
								</tr>
								
								<tr style="color:black;">
									<form name="salesWriteForm" id="salesWriteForm" action="salesWriteProcess"
									 method="post" class="" onsubmit="alert('7월 매출 전송 완료');">
									<c:forEach var="sales7" items="${salesTotalPrice7}">	
										<input type="hidden" name="salesDate" value="7월">
										<input type="hidden" name="salesTotalPrice" value="${ sales7.salesTotalPrice }">					
										<td style="border-left: 0;">7월</td>									
										<td>${ sales7.salesTotalPrice }원</td>	
										<td><input type="submit" value="DB전송" class="btn px-4 py-0" id="dbsubmit7" style="font-size:small"></td>														
									</c:forEach>
									</form>
								</tr>
								
								<tr style="color:black;" >
									<form name="salesWriteForm" id="salesWriteForm" action="salesWriteProcess"
									 method="post" class="" onsubmit="alert('8월 매출 전송 완료');">
									<c:forEach var="sales8" items="${salesTotalPrice8}">	
										<input type="hidden" name="salesDate" value="8월">
										<input type="hidden" name="salesTotalPrice" value="${ sales8.salesTotalPrice }">				
										<td style="border-left: 0;">8월</td>									
										<td>${ sales8.salesTotalPrice }원</td>	
										<td><input type="submit" value="DB전송" class="btn px-4 py-0" id="dbsubmit8" style="font-size:small"></td>														
									</c:forEach>
									</form>
								</tr>
								
								<tr style="color:black;">
									<form name="salesWriteForm" id="salesWriteForm" action="salesWriteProcess"
									 method="post" class="" onsubmit="alert('9월 매출 전송 완료');">
									<c:forEach var="sales9" items="${salesTotalPrice9}">		
										<input type="hidden" name="salesDate" value="9월">
										<input type="hidden" name="salesTotalPrice" value="${ sales9.salesTotalPrice }">			
										<td style="border-left: 0;">9월</td>									
										<td>${ sales9.salesTotalPrice }원</td>
										<td><input type="submit" value="DB전송" class="btn px-4 py-0" id="dbsubmit9" style="font-size:small"></td>															
									</c:forEach>
									</form>
								</tr>
								
								<tr style="color:black;">
									<form name="salesWriteForm" id="salesWriteForm" action="salesWriteProcess"
									 method="post" class="" onsubmit="alert('10월 매출 전송 완료');">
									<c:forEach var="sales10" items="${salesTotalPrice10}">
										<input type="hidden" name="salesDate" value="10월">
										<input type="hidden" name="salesTotalPrice" value="${ sales10.salesTotalPrice }">					
										<td style="border-left: 0;">10월</td>									
										<td>${ sales10.salesTotalPrice }원</td>
										<td><input type="submit" value="DB전송" class="btn px-4 py-0" id="dbsubmit10" style="font-size:small"></td>															
									</c:forEach>
									</form>
								</tr>
								
								<tr style="color:black;">
									<form name="salesWriteForm" id="salesWriteForm" action="salesWriteProcess"
									 method="post" class="" onsubmit="alert('11월 매출 전송 완료');">
									<c:forEach var="sales11" items="${salesTotalPrice11}">	
										<input type="hidden" name="salesDate" value="11월">
										<input type="hidden" name="salesTotalPrice" value="${ sales11.salesTotalPrice }">				
										<td style="border-left: 0;">11월</td>									
										<td>${ sales11.salesTotalPrice }원</td>		
										<td><input type="submit" value="DB전송" class="btn px-4 py-0" id="dbsubmit11" style="font-size:small"></td>																								
									</c:forEach>
									</form>
								</tr>
								<tr style="color:black;">		
									<form name="salesWriteForm" id="salesWriteForm" action="salesWriteProcess"
									 method="post" class="" onsubmit="alert('12월 매출 전송 완료');">							
									<c:forEach var="sales12" items="${salesTotalPrice12}">	
										<input type="hidden" name="salesDate" value="12월">
										<input type="hidden" name="salesTotalPrice" value="${ sales12.salesTotalPrice }">				
										<td style="border-left: 0;">12월</td>									
										<td>${ sales12.salesTotalPrice }원</td>		
										<td><input type="submit" value="DB전송" class="btn px-4 py-0" id="dbsubmit12" style="font-size:small"></td>																																			
									</c:forEach>
									</form>
								</tr>			
											
							</tbody>
						</table>
					</div>
				</div>					

				</div>
			</div>
		</div>

	</div>
</div>