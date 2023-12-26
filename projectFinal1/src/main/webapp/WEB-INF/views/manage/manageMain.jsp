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
				<jsp:include page="/WEB-INF/views/manage/manageSide.jsp" />
			</div>
			<div class="col-6 text-start mt-5">
				<span class="fw-bold p-2"><h3>관리페이지</h3></span>
				
				<div class="row">
					<div class="col border mb-4">		
						<div class="row">
							<div class="col my-2 p-2">
								<span>조회수가 높은  상품</span>
							</div>
						</div>
						<div class="row">
							<div class="col p-2">
								상품1
							</div>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col border mb-5">		
						<div class="row">
							<div class="col my-2 p-2">
								<span>총 매출</span>
							</div>
						</div>
						<div class="row">
							<div class="col p-2">
								123213123123원
							</div>
						</div>
					</div>
				</div>





				

				<div class="row">
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
							labels : [ '1월', '2월', '3월', '4월', '5월',
									'6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
							// ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
							datasets : [ {
								// ⑤dataset의 이름(String)
								label : '월 매출 그래프',
								// ⑥dataset값(Array)
								data : [ 12, 19, 3, 5, 2, 3 ,12, 19, 3, 5, 2, 3 ],
								// ⑦dataset의 배경색(rgba값을 String으로 표현)
								backgroundColor: [
	                                //색상
	                                'rgba(255, 99, 132, 0.2)',

	                            ],
	                            borderColor: [
	                                //경계선 색상
	                                'rgba(255, 99, 132, 1)',
	
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