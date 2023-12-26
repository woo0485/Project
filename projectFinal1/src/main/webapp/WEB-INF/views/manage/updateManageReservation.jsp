<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
 


<div class="row">
	<div class="col">
	
		<div class="row">
			<div class="col-4">
				<jsp:include page="/WEB-INF/views/manage/manageSide.jsp"/>
			</div>
			
			<div class="col-8 text-start mt-5">
				<span class="font-bold p-4"><h3>예약 관리</h3></span>				
				<div class="row">
					<div class="col">
						<table class="table table-hover">
							<thead>
								<tr class="table-secondary">
									<th>예약 번호</th>
									<th>상품 번호</th>
									<th>아이디</th>
									<th>예약 날짜</th>
									<th>예약 티켓 매수</th>
									<th>예약 금액</th>
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