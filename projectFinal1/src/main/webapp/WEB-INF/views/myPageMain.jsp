<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="my" value="${member}"></c:set>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.th {
		border : none;
	}
</style>
</head>
<body>
	<div class="container text-center">
	 	<div class="row col-auto">
	 		<jsp:include page="/WEB-INF/views/myPageHeader.jsp"></jsp:include>
	 	</div>
	 	<div class="row mt-5">
					<div class="col">
						<table class="table table-hover">
							<thead>
								<tr class="table-danger">
									<th>회원정보</th>
								</tr>
							</thead>
							<tbody class="text-start">
								<c:if test="${sessionScope.id eq my.id}">	
									<tr>
										<th style="border:none;">회원등급</th>
										<td>${my.grade}</td>
										
									</tr>
									<tr>
										<th style="border:none;">아이디</th>
										<td>${my.id}</td>
									</tr>
									<tr>
										<th style="border:none;">비밀번호</th>
										<td>${my.password}</td>
									</tr>
									<tr>
										<th style="border:none;">이름</th>
										<td>${my.name}</td>
									</tr>
									<tr>
										<th style="border:none;">이메일</th>
										<td>${my.email}</td>
									</tr>
									<tr>
										<th style="border:none;">휴대전화</th>
										<td>${my.phonenumber}</td>
									</tr>
								</c:if>
							</tbody>
						</table>
					</div>			
	 	 
	 	 
	 </div>	
</body>
</html>