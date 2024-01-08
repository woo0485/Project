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
					
						<c:if test="${fn:length(re) == 0}">
							    <div class="row">
							        <div class="col">
							            예매하신 축제 상품이 없습니다! 어서 빨리 GALAGO에서 다양한 축제를 즐겨보세요!
							        </div>
							    </div>
							</c:if>
					
					<form name="DeleteForm" id="deleteForm" action="mydelete">
					<input type="hidden" id="id" name="id" value="${sessionScope.id}">
			 			<input type="hidden" id="productno" name="productno" value="">
			 			<input type="hidden" id="reservationticketcount" name="reservationticketcount" value="">
			 		</form>
	 	<c:forEach var="rep" items="${ReProduct}" >
	 		<c:forEach var="re" items="${Reservation}">	
			 	<div class="row">
			 		<div class="col">
			 		<input type="button" id="cancleTicket" value="예약취소" class="btn btn-danger">
			 		<span>${rep.productno}</span>
			 		<span>${re.reservationticketcount}</span><br>
			 			${rep.productname} <br>
			 			${rep.productcontent }<br>
			 			<img src="${rep.productimage }"><br>
			 		</div>
			 	</div>
		 	</c:forEach>
 		</c:forEach>


</body>
</html>