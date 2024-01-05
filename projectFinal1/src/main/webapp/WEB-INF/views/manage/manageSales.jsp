<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.text.SimpleDateFormat"%>
<script
	src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
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

.table tr td:first-child {
	text-align: center;
}

.table caption {
	caption-side: bottom;
	display: none;
}
</style>



<div class="row">
	<div class="col">

		<div class="row">
			<div class="col-4">
				<jsp:include page="/WEB-INF/views/manage/manageSide.jsp" />
			</div>
			<div class="col-8 text-start mt-5">
				<span class="font-bold p-4"><h3>매출 관리</h3></span>

				
				<div class="row">
					<div class="col-5 pe-5">
					
						<!-- 일 매출 -->
						<table class="table table-hover text-center">
							<thead>
								<tr class="table-secondary">
									<th>날짜</th>
									<th>일 매출</th>
								</tr>
							</thead>
							<tbody class="text-secondary">
								<c:forEach var="r" items="${rList}">
									<tr style="color: black; font-size: small;">
										<td>${ r.reservationdate }</td>
										<td>${ r.totalReservationPrice }원</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>


						<!--일 매출 페이지 네이션 -->
						<div class="row">
							<div class="col my-1 text-center">
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

							<div class="row justify-content-center">
								<div class="col-auto" style="display: none;">
									<select name="type" class="form-select">
										<option value="reservationdate">날짜</option>
									</select>
								</div>
								<div class="col-7">
									<input type="text" name="keyword" class="form-control"
										placeholder="검색할 날짜" style="border-color: #168;">
								</div>
								<div class="col-2">
									<input type="submit" value="검 색" class="custom-btn btn-3 px-3" />
								</div>
							</div>
						</form>
					</div>

					<!-- 월 매출 -->
					<div class="col-5">
						<table class="table table-hover text-center">
							<thead>
								<tr class="table-secondary">
									<th class="px-2">올해 년도</th>
									<th class="px-5">월 매출</th>
									<th></th>

								</tr>
							</thead>
							<tbody class="text-secondary" style="font-size: small">

								<tr style="color: black;">
									<form name="salesWriteForm" id="salesWriteForm"
										action="salesWriteProcess" method="post" class=""
										onsubmit="alert('1월 매출 전송 완료');">
										<c:forEach var="sales1" items="${salesTotalPrice1}">
											<input type="hidden" name="salesDate" value="1월">
											<input type="hidden" name="salesTotalPrice"
												value="${ sales1.salesTotalPrice }">
											<td style="border-left: 0;">1월</td>
											<td>${ sales1.salesTotalPrice }원</td>
											<td><input type="submit" value="DB전송" class="btn py-0"
												id="dbsubmit1" style="font-size: small; color:red;"></td>

										</c:forEach>
									</form>
								</tr>

								<tr style="color: black;">
									<form name="salesWriteForm" id="salesWriteForm"
										action="salesWriteProcess" method="post" class=""
										onsubmit="alert('2월 매출 전송 완료');">
										<c:forEach var="sales2" items="${salesTotalPrice2}">
											<input type="hidden" name="salesDate" value="2월">
											<input type="hidden" name="salesTotalPrice"
												value="${ sales2.salesTotalPrice }">
											<td style="border-left: 0;">2월</td>
											<td>${ sales2.salesTotalPrice }원</td>
											<td><input type="submit" value="DB전송"
												class="btn px-4 py-0" id="dbsubmit2"
												style="font-size: small; color:red;"></td>
										</c:forEach>
									</form>
								</tr>

								<tr style="color: black;">
									<form name="salesWriteForm" id="salesWriteForm"
										action="salesWriteProcess" method="post" class=""
										onsubmit="alert('3월 매출 전송 완료');">
										<c:forEach var="sales3" items="${salesTotalPrice3}">
											<input type="hidden" name="salesDate" value="3월">
											<input type="hidden" name="salesTotalPrice"
												value="${ sales3.salesTotalPrice }">
											<td style="border-left: 0;">3월</td>
											<td>${ sales3.salesTotalPrice }원</td>
											<td><input type="submit" value="DB전송"
												class="btn px-4 py-0" id="dbsubmit3"
												style="font-size: small; color:red;"></td>
										</c:forEach>
									</form>
								</tr>

								<tr style="color: black;">
									<form name="salesWriteForm" id="salesWriteForm"
										action="salesWriteProcess" method="post" class=""
										onsubmit="alert('4월 매출 전송 완료');">
										<c:forEach var="sales4" items="${salesTotalPrice4}">
											<input type="hidden" name="salesDate" value="4월">
											<input type="hidden" name="salesTotalPrice"
												value="${ sales4.salesTotalPrice }">
											<td style="border-left: 0;">4월</td>
											<td>${ sales4.salesTotalPrice }원</td>
											<td><input type="submit" value="DB전송"
												class="btn px-4 py-0" id="dbsubmit4"
												style="font-size: small; color:red;"></td>
										</c:forEach>
									</form>
								</tr>

								<tr style="color: black;">
									<form name="salesWriteForm" id="salesWriteForm"
										action="salesWriteProcess" method="post" class=""
										onsubmit="alert('5월 매출 전송 완료');">
										<c:forEach var="sales5" items="${salesTotalPrice5}">
											<input type="hidden" name="salesDate" value="5월">
											<input type="hidden" name="salesTotalPrice"
												value="${ sales5.salesTotalPrice }">
											<td style="border-left: 0;">5월</td>
											<td>${ sales5.salesTotalPrice }원</td>
											<td><input type="submit" value="DB전송"
												class="btn px-4 py-0" id="dbsubmit5"
												style="font-size: small; color:red;"></td>
										</c:forEach>
									</form>
								</tr>

								<tr style="color: black;">
									<form name="salesWriteForm" id="salesWriteForm"
										action="salesWriteProcess" method="post" class=""
										onsubmit="alert('6월 매출 전송 완료');">
										<c:forEach var="sales6" items="${salesTotalPrice6}">
											<input type="hidden" name="salesDate" value="6월">
											<input type="hidden" name="salesTotalPrice"
												value="${ sales6.salesTotalPrice }">
											<td style="border-left: 0;">6월</td>
											<td>${ sales6.salesTotalPrice }원</td>
											<td><input type="submit" value="DB전송"
												class="btn px-4 py-0" id="dbsubmit6"
												style="font-size: small; color:red;"></td>
										</c:forEach>
									</form>
								</tr>

								<tr style="color: black;">
									<form name="salesWriteForm" id="salesWriteForm"
										action="salesWriteProcess" method="post" class=""
										onsubmit="alert('7월 매출 전송 완료');">
										<c:forEach var="sales7" items="${salesTotalPrice7}">
											<input type="hidden" name="salesDate" value="7월">
											<input type="hidden" name="salesTotalPrice"
												value="${ sales7.salesTotalPrice }">
											<td style="border-left: 0;">7월</td>
											<td>${ sales7.salesTotalPrice }원</td>
											<td><input type="submit" value="DB전송"
												class="btn px-4 py-0" id="dbsubmit7"
												style="font-size: small; color:red;"></td>
										</c:forEach>
									</form>
								</tr>

								<tr style="color: black;">
									<form name="salesWriteForm" id="salesWriteForm"
										action="salesWriteProcess" method="post" class=""
										onsubmit="alert('8월 매출 전송 완료');">
										<c:forEach var="sales8" items="${salesTotalPrice8}">
											<input type="hidden" name="salesDate" value="8월">
											<input type="hidden" name="salesTotalPrice"
												value="${ sales8.salesTotalPrice }">
											<td style="border-left: 0;">8월</td>
											<td>${ sales8.salesTotalPrice }원</td>
											<td><input type="submit" value="DB전송"
												class="btn px-4 py-0" id="dbsubmit8"
												style="font-size: small; color:red;"></td>
										</c:forEach>
									</form>
								</tr>

								<tr style="color: black;">
									<form name="salesWriteForm" id="salesWriteForm"
										action="salesWriteProcess" method="post" class=""
										onsubmit="alert('9월 매출 전송 완료');">
										<c:forEach var="sales9" items="${salesTotalPrice9}">
											<input type="hidden" name="salesDate" value="9월">
											<input type="hidden" name="salesTotalPrice"
												value="${ sales9.salesTotalPrice }">
											<td style="border-left: 0;">9월</td>
											<td>${ sales9.salesTotalPrice }원</td>
											<td><input type="submit" value="DB전송"
												class="btn px-4 py-0" id="dbsubmit9"
												style="font-size: small; color:red;"></td>
										</c:forEach>
									</form>
								</tr>

								<tr style="color: black;">
									<form name="salesWriteForm" id="salesWriteForm"
										action="salesWriteProcess" method="post" class=""
										onsubmit="alert('10월 매출 전송 완료');">
										<c:forEach var="sales10" items="${salesTotalPrice10}">
											<input type="hidden" name="salesDate" value="10월">
											<input type="hidden" name="salesTotalPrice"
												value="${ sales10.salesTotalPrice }">
											<td style="border-left: 0;">10월</td>
											<td>${ sales10.salesTotalPrice }원</td>
											<td><input type="submit" value="DB전송"
												class="btn px-4 py-0" id="dbsubmit10"
												style="font-size: small; color:red;"></td>
										</c:forEach>
									</form>
								</tr>

								<tr style="color: black;">
									<form name="salesWriteForm" id="salesWriteForm"
										action="salesWriteProcess" method="post" class=""
										onsubmit="alert('11월 매출 전송 완료');">
										<c:forEach var="sales11" items="${salesTotalPrice11}">
											<input type="hidden" name="salesDate" value="11월">
											<input type="hidden" name="salesTotalPrice"
												value="${ sales11.salesTotalPrice }">
											<td style="border-left: 0;">11월</td>
											<td>${ sales11.salesTotalPrice }원</td>
											<td><input type="submit" value="DB전송"
												class="btn px-4 py-0" id="dbsubmit11"
												style="font-size: small; color:red;"></td>
										</c:forEach>
									</form>
								</tr>
								<tr style="color: black;">
									<form name="salesWriteForm" id="salesWriteForm"
										action="salesWriteProcess" method="post" class=""
										onsubmit="alert('12월 매출 전송 완료');">
										<c:forEach var="sales12" items="${salesTotalPrice12}">
											<input type="hidden" name="salesDate" value="12월">
											<input type="hidden" name="salesTotalPrice"
												value="${ sales12.salesTotalPrice }">
											<td style="border-left: 0;">12월</td>
											<td>${ sales12.salesTotalPrice }원</td>
											<td><input type="submit" value="DB전송"
												class="btn px-4 py-0" id="dbsubmit12"
												style="font-size: small; color:red;"></td>
										</c:forEach>
									</form>
								</tr>

							</tbody>
						</table>
					</div>
				</div>
				
				
				<div class="row">
					<div class="col">						
						<div class="row my-4">
							<div class="col-4 me-3"
								style="width: 350px; height: 150px;">
								<canvas id="myChart4"></canvas>
							</div>
							<div class="col-4"
								style="width: 350px; height: 150px;">
								<canvas id="myChart5"></canvas>
							</div>
						</div>
						
						<!-- 일 매출 베스트 -->
						<script>
							// 차트를 그럴 영역을 dom요소로 가져온다.
							var chartArea = document.getElementById('myChart4')
									.getContext('2d');
							// 차트를 생성한다. 
							var myChart = new Chart(chartArea, {
								// ①차트의 종류(String)
								type : 'bar',
								// ②차트의 데이터(Object)
								data : {
									// ③x축에 들어갈 이름들(Array)
									labels : [ 											
										<c:if test="${ empty rListBest }">	
											0,0,0,0,0,0,0,0,0,0,0,0
										</c:if>

											<c:if test="${not empty rListBest}">
										    <c:forEach var="rListBest" items="${rListBest}">									     											    
									       		'${rListBest.reservationdate}',
										    </c:forEach>
										</c:if>										
									],
									// ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
									datasets : [ {
										// ⑤dataset의 이름(String)
										label : '일 매출 최고의 날',
										// ⑥dataset값(Array)
																									
										data : [ 
											
											<c:if test="${ empty rListBest }">	
												0,0,0,0,0,0,0,0,0,0,0,0
											</c:if>
		
											<c:if test="${not empty rListBest}">
											    <c:forEach var="rListBest" items="${rListBest}">									     
											            ${rListBest.totalReservationPrice},
											    </c:forEach>
											</c:if>									
											],
									
										// ⑦dataset의 배경색(rgba값을 String으로 표현)
										backgroundColor: [
			                                //색상
		
											  'rgba(255, 99, 132, 0.2)',
										      'rgba(255, 159, 64, 0.2)',
										      'rgba(255, 205, 86, 0.2)',
										      'rgba(75, 192, 192, 0.2)',
										      'rgba(54, 162, 235, 0.2)',
										      'rgba(153, 102, 255, 0.2)'
		
			                            ],
			                            borderColor: [
			                                //경계선 색상
		
			                            	'rgba(255, 99, 132, 0.2)',
			                                'rgba(255, 159, 64, 0.2)',
			                                'rgba(255, 205, 86, 0.2)',
			                                'rgba(75, 192, 192, 0.2)',
			                                'rgba(54, 162, 235, 0.2)',
			                                'rgba(153, 102, 255, 0.2)'   
			
			                            ],
										// ⑨dataset의 선 두께(Number)
										borderWidth : 1
									} ]
								},
								// ⑩차트의 설정(Object)
								options : {
									// ⑪축에 관한 설정(Object)
									scales : {
										// ⑫y축에 대한 설정(Object)
										y : {
											// ⑬시작을 0부터 하게끔 설정(최소값이 0보다 크더라도)(boolean)
											beginAtZero : true
										}
									}
								}
							});
						</script>
						
						<!-- 월 매출 베스트 -->
						<script>
							// 차트를 그럴 영역을 dom요소로 가져온다.
							var chartArea = document.getElementById('myChart5')
									.getContext('2d');
							// 차트를 생성한다. 
							var myChart = new Chart(chartArea, {
								// ①차트의 종류(String)
								type : 'bar',
								// ②차트의 데이터(Object)
								data : {
									// ③x축에 들어갈 이름들(Array)
									labels : [ 											
										<c:if test="${ empty sListBest }">	
											0,0,0,0,0,0,0,0,0,0,0,0
										</c:if>

											<c:if test="${not empty sListBest}">
										    <c:forEach var="sListBest" items="${sListBest}">									     											    
									       		'${sListBest.salesYear}년  ${sListBest.salesDate}',
										    </c:forEach>
										</c:if>										
									],
									// ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
									datasets : [ {
										// ⑤dataset의 이름(String)
										label : '월 매출 최고의 달',
										// ⑥dataset값(Array)
																									
										data : [ 
											
											<c:if test="${ empty sListBest }">	
												0,0,0,0,0,0,0,0,0,0,0,0
											</c:if>
		
											<c:if test="${not empty sListBest}">
											    <c:forEach var="sListBest" items="${sListBest}">									     
											            ${sListBest.salesTotalPrice},
											    </c:forEach>
											</c:if>									
											],
									
										// ⑦dataset의 배경색(rgba값을 String으로 표현)
										backgroundColor: [
			                                //색상
		
											  'rgba(255, 99, 132, 0.2)',
										      'rgba(255, 159, 64, 0.2)',
										      'rgba(255, 205, 86, 0.2)',
										      'rgba(75, 192, 192, 0.2)',
										      'rgba(54, 162, 235, 0.2)',
										      'rgba(153, 102, 255, 0.2)'
		
			                            ],
			                            borderColor: [
			                                //경계선 색상
		
			                            	'rgba(255, 99, 132, 0.2)',
			                                'rgba(255, 159, 64, 0.2)',
			                                'rgba(255, 205, 86, 0.2)',
			                                'rgba(75, 192, 192, 0.2)',
			                                'rgba(54, 162, 235, 0.2)',
			                                'rgba(153, 102, 255, 0.2)'    
			
			                            ],
										// ⑨dataset의 선 두께(Number)
										borderWidth : 1
									} ]
								},
								// ⑩차트의 설정(Object)
								options : {
									// ⑪축에 관한 설정(Object)
									scales : {
										// ⑫y축에 대한 설정(Object)
										y : {
											// ⑬시작을 0부터 하게끔 설정(최소값이 0보다 크더라도)(boolean)
											beginAtZero : true
										}
									}
								}
							});
						</script>	
							 
					</div>
				</div>
			</div>
		</div>
	</div>

</div>
</div>