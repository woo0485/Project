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
				<span class="font-bold p-4"><h3>매출 관리</h3></span>				
				<div class="row">
					<div class="col">
						<table class="table table-hover">
							<thead>
								<tr class="table-secondary">
									<th></th>
									<th>날짜</th>
									<th>총 매출</th>								
								</tr>
							</thead>
							<tbody class="text-secondary">								
								
								<c:forEach var="s" items="${Sales}">
									<tr>
										<td>${ s.salesNo }</td>
										<td>${ s.saleDate }</td>
										<td>${ s.salesTotalPrice }</td>									
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