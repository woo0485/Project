<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="re" value="${Reservation}"></c:set>
<c:set var="rep" value="${ReProduct}"></c:set>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row col-auto">
	 		<jsp:include page="/WEB-INF/views/myPageHeader.jsp"></jsp:include>
	</div>
					<br><br><br>
							<c:if test="${fn:length(re) == 0}">
							    <div class="row">
							        <div class="col text-center">
							           <p style="font-weight: bold;"> 예매하신 축제 상품이 없습니다! 어서 빨리 GALAGO에서 다양한 축제를 즐겨보세요! </p>
							        </div>
							    </div>
							</c:if>
					
					<form name="DeleteForm" id="deleteForm" action="mydelete">
					<input type="hidden" id="id" name="id" value="${sessionScope.id}">
			 			<input type="hidden" id="productno" name="productno" value="">
			 			<input type="hidden" id="reservationticketcount" name="reservationticketcount" value="">
			 			<input type="hidden" id="reservationno" name="reservationno" value="">
			 		</form>
	 	<c:forEach var="rep" items="${ReProduct}">
			 	<div class="row">
			 		<div class="col">
			 		<input type="button" id="cancleTicket" value="예약취소" class="btn btn-danger">
			 		<span>${rep.productno}</span>
			 			${rep.productname} <br>
			 			${rep.productcontent }<br>
			 			<img src="${rep.productimage }"><br>
			 		</div>
			 	</div>
 		</c:forEach>
 		<c:forEach var="re" items="${Reservation}">
 					<input type="hidden" id="cancleTicket2" value="예약취소" class="btn btn-danger">
 					<span>${re.reservationticketcount}</span>
			 		<span style="display:none;">${re.reservationno }</span>
		</c:forEach>

</body>
</html>