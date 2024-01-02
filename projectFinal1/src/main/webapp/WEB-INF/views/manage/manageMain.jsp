<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
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
				<jsp:include page="/WEB-INF/views/manage/manageSide.jsp" />
			</div>
			<div class="col-6 text-start mt-5">
				<span class="fw-bold p-2"><h3>관리페이지</h3></span>
				
				<div class="row">
					<div class="col border-end text-center mb-2 pe-5">		
						<div class="row">
							<div class="col mt-2 p-2">
								<span><h4>조회수가 높은  상품</h4></span>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<ol class="text-start" >
									<c:forEach var="pp" items="${manageProductCountList}">										
										<li class="ps-2">${pp.productname }</li>
									</c:forEach>
								</ol>				
							</div>
						</div>
					</div>
				
					<div class="col text-center mb-5">		
						<div class="row">
							<div class="col mt-2 p-2">
								<span><h4>DB 총 매출</h4></span>
							</div>
						</div>
						<div class="row">
							<div class="col p-3">
								<c:if test="${ empty salesList }">									
										<span>월 매출을 DB로 넣어주세요.</span>
								</c:if>
								
								<c:set var = "total" value = "0" />
								<c:if test="${ not empty salesList }">
									<c:forEach var="s" items="${salesList}">										
										<c:set var= "total" value="${total + s.salesTotalPrice}"/>
									</c:forEach>
									<c:out value="${total}원"/>
								</c:if>				
							</div>
						</div>
					</div>
				</div>
				

				<!-- 차트 -->
				<div class="row mt-5">
					<div class="col" style="width:10px; height:10px;">
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
								
								<c:forEach var="s2" items="${salesList}">
									'${ s2.salesDate }',
								</c:forEach>
								
							],
							// ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
							datasets : [ {
								// ⑤dataset의 이름(String)
								label : '월 매출 그래프',
								// ⑥dataset값(Array)
																							
								data : [ 
									<c:if test="${ empty salesList }">	
										0,0,0,0,0,0,0,0,0,0,0,0
									</c:if>
									<c:if test="${ not empty salesList }">	
										<c:forEach var="s" items="${salesList}">
											${ s.salesTotalPrice },
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


			</div>
		</div>
	</div>
</div>