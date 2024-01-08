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
										<c:if test ="${my.grade eq 0 }">
										<td style="border:none;"><span style="font-weight: bold;">일반</span></td>
										</c:if>
										<c:if test ="${my.grade eq 1 }">
										<td style="border:none;"><span style="font-weight: bold;">BLACK</span></td>
										</c:if>
										<c:if test ="${my.grade eq 2 }">
										<td style="border:none;"><span style="font-weight: bold;">SILVER</span></td>
										</c:if>
										<c:if test ="${my.grade eq 3 }">
										<td style="border:none;"><span style="font-weight: bold;">GOLD</span></td>
										</c:if>
										<c:if test ="${my.grade eq 4 }">
										<td style="border:none;"><span style="font-weight: bold;">VIP</span></td>
										</c:if>
										
									</tr>
									<tr>
										<th style="border:none;">아이디</th>
										<td style="border:none;">${my.id}</td>
									</tr>
									<tr>
										<th style="border:none;">비밀번호</th>
										<td style="border:none;">*****</td>
									</tr>
									<tr>
										<th style="border:none;">이름</th>
										<td style="border:none;">${my.name}</td>
									</tr>
									<tr>
										<th style="border:none;">이메일</th>
										<td style="border:none;">${my.email}</td>
									</tr>
									<tr>
										<th style="border:none;">휴대전화</th>
											<c:if test="${my.phonenumber eq null}">
												<td style="border:none;">010 - 0000 - 0000</td>
											</c:if>
												<td style="border:none;">${my.phonenumber}</td>
									</tr>
									<tr>
										<th style="border:none;">주소</th>
												<td style="border:none;">${my.address1} - ${my.address2}</td>

									</tr>
									
								</c:if>
							</tbody>
						</table>
					</div>			 	 
	 	</div>
	 </div>		
</body>
</html>