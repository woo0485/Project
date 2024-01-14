<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="re" value="${Reservation}"></c:set>
<c:set var="rep" value="${ReProduct}"></c:set>    
    
<!DOCTYPE html>
<html>
<head>
<script>
document.addEventListener('DOMContentLoaded', function() {
	const hiddenReservationPrice = document.querySelectorAll('input[id^="reservationprice"]');
	const hiddenId = document.querySelectorAll('input[id^="id"]');
    const hiddenReservationTicketCount = document.querySelectorAll('input[id^="reservationticketcount"]');
    
    hiddenReservationPrice.forEach(function(input, index) {
    var price = input.value;
    var correspondingElement = document.getElementById('price'+index);
    correspondingElement.innerText = price;

    });
    
    hiddenReservationTicketCount.forEach(function(input, index) {
        var Ticketcount = input.value;
        console.log(Ticketcount);
        var correspondingElement = document.getElementById('Ticketcount'+index);
        correspondingElement.innerText = Ticketcount;
        });
    
    hiddenId.forEach(function(input, index) {
        var id = input.value;
        console.log(id);
        var correspondingElement = document.getElementById('id'+index);
        correspondingElement.innerText = '예약자 : ' + id;
        });
});
</script>
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
			 			<input type="hidden" id="ticketcount" name="reservationticketcount" value="">
			 			<input type="hidden" id="reservationno" name="reservationno" value="">
			 		</form>
		
		 	<c:forEach var="rep" items="${ReProduct}" varStatus="status">
					 		<div class="row">
						 		<div class="col" style="border: 2px dotted pink;">
						 		<span style="font-weight: bold">상품 이름 : </span><span style="display: none;">${rep.productno}</span>
						 			<span style="font-weight: bold;">${rep.productname}</span>
						 			<img src="${rep.productimage }" style="width:50px; height:50px;">
						 			<span id="price${status.index}"> </span>
						 			<span id="id${status.index }"></span>
						 			<span id="Ticketcount${status.index}"></span>
						 			<input type="button" id="cancleTicket${status.index}" value="예약취소" class="btn btn-danger">
						 		</div>
						 	</div>	
	 		</c:forEach>
 		
 		
 		<c:forEach var="re" items="${Reservation}" varStatus="status">
 					<input type="hidden" id="cancleTicket2${status.index }" value="예약취소" class="btn btn-danger">
			 		<input type="hidden" value="${re.reservationno}" id="reservationno${status.index}">
			 		<input type="hidden" value="${re.reservationprice}" id="reservationprice${status.index}">
			 		<input type="hidden" value="${re.id}" id="id${status.index}">
			 		<input type="hidden" value="${re.reservationticketcount}" id="reservationticketcount${status.index}">
		</c:forEach>

</body>
</html>