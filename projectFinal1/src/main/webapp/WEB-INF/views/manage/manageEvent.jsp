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
			
			<div class="col-8 text-start mt-5">
				<span class="font-bold p-4"><h3>이벤트 관리</h3></span>				
				<div class="row">
					<div class="col">
						<table class="table table-hover">
							<thead>
								<tr class="table-secondary">
									<th>아이디</th>
									<th>이름</th>
									<th>휴대폰 번호</th>
									<th>이메일</th>
									<th>쿠폰 번호</th>
									<th>쿠폰 기한</th>
								</tr>
							</thead>
							<tbody class="text-secondary">								
								
								<c:forEach var="m" items="${Member}">
									<tr>
										<td>${ m.id }</td>
										<td>${ m.password }</td>
										<td>${ m.name }</td>
										<td>${ b.phoneNember }</td>
										<td>${ b.totalPay }</td>
										<td>${ b.memberGrade }</td>
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