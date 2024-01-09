<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Calendar"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    Calendar calendar = Calendar.getInstance();
    int currentYear = calendar.get(Calendar.YEAR);
    pageContext.setAttribute("currentYear", currentYear);
%>
<script
	src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
<link href="resources/css/donggyun.css" rel="stylesheet">
<script src="resources/js/donggyun.js"></script>
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

.button99 {
	top: 50%;
	background-color: white;
	border-color: #168;
	color: red;
	border-radius: 10px;
	padding: 15px;
	min-height: 10px;
	min-width: 60px;
}

.button99:hover {
	border-color: red;
}
</style>


<div class="row">
	<div class="col">

		<div class="row">
			<div class="col-4">
				<jsp:include page="/WEB-INF/views/manage/manageSide.jsp" />
			</div>
			<div class="col-6 text-start mt-5">
				<h3>관리페이지</h3>

				<div class="row">
					<div class="col text-center mb-2">
						<div class="row">
							<div class="col mt-2 p-2">
								<span class=" fs-5">조회수가 높은 상품</span>
							</div>
						</div>

						<div class="row">
							<div class="col" style="font-size: small;">
								<table class="table">
									<tr>
										<th style="width:60px;">순위</th>
										<th>상품 이름</th>
									</tr>
									<c:forEach var="pp" items="${manageProductCountList}"
										varStatus="loop">
										<tr>
											<td>${loop.index + 1}</td>
											<td>${pp.productname}</td>
										</tr>
									</c:forEach>
								</table>
							</div>
						</div>
					</div>



					<div class="col text-center ms-5">
						<div class="row">
							<div class="col mt-2 pt-2">
								<div class="row">
									<div class="col">
										<span class=" fs-5">연도별 매출</span>
									</div>
								</div>
							</div>

						</div>

						<div class="row">
							<div class="col">
								<table class="table text-center mt-2" style="font-size: small;">
									<thead>
										<tr>
											<th>연도</th>
											<th>총 매출</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${empty salesList}">
										<tr>
											<td><c:out value="${currentYear}" />년</td>
											<td>0원</td>
										</tr>
										</c:if>
										<c:if test="${not empty salesList}">
										<tr>
											<td><c:out value="${currentYear}" />년</td>
											<td><c:set var="total" value="0" /> <c:forEach var="s"
													items="${salesList}">
													<c:set var="total" value="${total + s.salesTotalPrice}" />
												</c:forEach> <fmt:formatNumber value="${total}" pattern="#,##0원" /></td>
										</tr>
										</c:if>
										<tr>
											<td><c:out value="${currentYear-1}" />년</td>
											<td><c:set var="total" value="0" /> <c:forEach
													var="last" items="${lastYearSalesList}">
													<c:set var="total" value="${total + last.salesTotalPrice}" />
												</c:forEach> <fmt:formatNumber value="${total}" pattern="#,##0원" /></td>
										</tr>
										<tr>
											<td><c:out value="${currentYear-2}" />년</td>
											<td><c:set var="total" value="0" /> <c:forEach
													var="lastYearBefore" items="${yearBeforeLastSalesList2}">
													<c:set var="total"
														value="${total + lastYearBefore.salesTotalPrice}" />
												</c:forEach> <fmt:formatNumber value="${total}" pattern="#,##0원" /></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>

					</div>
				</div>
				
				
				<div class="row">
					<div class="col border rounded-3 pt-4 mt-4 text-center" style="height:650px; width:400px; background-color:#F0FFFF;">		
					<span class=" fs-5">연도별 매출 차트</span>
					<c:if test="${ not empty salesList }">
						<div class="text-end" style="margin-top:-30px;">
							<button type="button" class="button99 py-0 mt-4"
								data-bs-toggle="modal" data-bs-target="#myModal" style="font-size:small; color:black;">중복 차트 삭제</button>
						</div>	
					</c:if>	
					<c:set var="currentYear"
						value="<%= Calendar.getInstance().get(Calendar.YEAR) %>" />
											
					<!-- 올해 매출 차트 -->
					<div class="row my-3">
						<div class="col-10 ps-5 ms-5 pt-4"
							style="width: 550px; height: 480px; margin-bottom: -220px;">
							<canvas id="myChart"></canvas>
						</div>
					</div>
					<script>
						// 차트를 그럴 영역을 dom요소로 가져온다.
						var chartArea = document.getElementById('myChart')
								.getContext('2d');
						// 차트를 생성한다. 
						var myChart = new Chart(chartArea, {
							// ①차트의 종류(String)
							type : 'bar',
							// ②차트의 데이터(Object)
							data : {
								// ③x축에 들어갈 이름들(Array)
								labels : [ 
									<c:set var="currentYear" value="<%= Calendar.getInstance().get(Calendar.YEAR) %>" />			
									<c:forEach var="sales" items="${salesList}">
								        <c:if test="${sales.salesYear == currentYear}">
								        '${ sales.salesYear }년 ${ sales.salesDate }', 
								        </c:if>
								    </c:forEach>									
								],
								// ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
								datasets : [ {
									// ⑤dataset의 이름(String)
									label : '올해 월 매출' ,
									// ⑥dataset값(Array)
																								
									data : [ 
										<c:set var="currentYear" value="<%= Calendar.getInstance().get(Calendar.YEAR) %>" />
										<c:if test="${ empty salesList }">	
											0,0,0,0,0,0,0,0,0,0,0,0
										</c:if>
	
										<c:if test="${not empty salesList}">
										    <c:forEach var="sales" items="${salesList}">
										        <c:if test="${sales.salesYear == currentYear}">
										            ${sales.salesTotalPrice},
										        </c:if>
										    </c:forEach>
										</c:if>									
										],
								
									// ⑦dataset의 배경색(rgba값을 String으로 표현)
									backgroundColor: [
		                                //색상
	
									      'rgba(75, 192, 192, 0.2)',
	
		                            ],
		                            borderColor: [
		                                //경계선 색상
	
		                                'rgb(75, 192, 192)',    
		
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
	
					<!-- 작년 매출 차트 -->
					<div class="row">
						<div class="col-10 ps-5 ms-5">
	
							<div class="row my-3 mb-5">
								<div class="col" style="width: 200px; height: 200px;">
									<canvas id="myChart2"></canvas>
								</div>
							</div>
							<script>
							// 차트를 그럴 영역을 dom요소로 가져온다.
							var chartArea = document.getElementById('myChart2')
									.getContext('2d');
							// 차트를 생성한다. 
							var myChart = new Chart(chartArea, {
								// ①차트의 종류(String)
								type : 'bar',
								// ②차트의 데이터(Object)
								data : {
									// ③x축에 들어갈 이름들(Array)
									labels : [ 
										<c:set var="currentYear" value="<%= Calendar.getInstance().get(Calendar.YEAR) %>" />			
										<c:forEach var="lastYear" items="${lastYearSalesList}">
									        
									        '${ lastYear.salesYear }년 ${ lastYear.salesDate }', 
									        
									    </c:forEach>									
									],
									// ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
									datasets : [ {
										// ⑤dataset의 이름(String)
										label : '작년 월 매출',
										// ⑥dataset값(Array)
																									
										data : [ 
											<c:set var="currentYear" value="<%= Calendar.getInstance().get(Calendar.YEAR) %>" />			
											    <c:forEach var="lastYear" items="${lastYearSalesList}">									        
											            ${lastYear.salesTotalPrice},									        
											    </c:forEach>
																			
											],
									
										// ⑦dataset의 배경색(rgba값을 String으로 표현)
										backgroundColor: [
			                                //색상
		
											'rgba(54, 162, 235, 0.2)'
		
			                            ],
			                            borderColor: [
			                                //경계선 색상
		
			                            	'rgba(54, 162, 235, 0.2)'
			
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
</div>





<!-- 버튼 클릭시 모달 생김 -->
<div class="modal" id="myModal">
	<div class="modal-dialog modal-sm modal-dialog-centered">
		<!-- modal-sm modal-lg modal-xl 모달 사이즈 -->
		<!-- modal-dialog-centered 화면 가운데 -->
		<!-- modal-dialog-scrollable 스크롤 기능 -->
		<div class="modal-content">
			<div class="modal-header">
				<span class=""><h4>중복 차트 삭제</h4></span>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
			<div class="modal-body text-center">

				<c:set var="currentYear"
					value="<%=Calendar.getInstance().get(Calendar.YEAR)%>" />
				<c:if test="${not empty salesList}">				
						<div class="row">
							<div class="col text-center">
								<div style="color:red; font-size:small;"><i class="bi bi-exclamation-triangle"></i>
									월 매출을 중복으로 DB전송 했을 경우<br>월 매출 차트가 중복으로 올라갑니다<br>월 매출 차트는 하나만 되도록 사용 해주시길 바랍니다.</div>
								<c:forEach var="sales" items="${salesList}">
									<c:if test="${sales.salesYear == currentYear}">
										<div class="my-2">											
											<button type="button" data-salesNo="${sales.salesNo}"
												class="dbAllDelete button99 py-2 px-3 rounded"
												style="font-size: small; color: black;">
												${sales.salesYear}년 ${sales.salesDate} 매출 삭제</button>
										</div>	
									</c:if>
								</c:forEach>
							</div>
						</div>					
				</c:if>
			</div>
			<div class="modal-footer">
				<button type="button" class="button99 px-4 py-1 ms-5"
					data-bs-dismiss="modal" style="color: black;">닫기</button>
			</div>
		</div>

	</div>
</div>