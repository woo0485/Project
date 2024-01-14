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
    const hiddenReservationNo = document.querySelectorAll('input[id^="reservationno"]');
    
    var price;
    
    hiddenReservationPrice.forEach(function(input, index) {
    price = input.value;
    var correspondingElement = document.getElementById('price'+index);
    correspondingElement.innerText = price;

    });
    
    hiddenReservationTicketCount.forEach(function(input, index) {
    	var ticketCount = input.value;
        var correspondingElement = document.getElementById('Ticketcount'+index);
        correspondingElement.innerText = ticketCount;
        
        
        var totalPriceElement = document.getElementById('totalPrice' + index);
        totalPriceElement.innerText = price * ticketCount;
    
    });
    
    hiddenReservationNo.forEach(function(input, index) {
    	var no = input.value;
    	console.log(no);
    	var correspondingElement = document.getElementById('no'+index);
    	correspondingElement.innerText = no;
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
<input type="hidden" value="${sessionScope.id}" id ="sibalID">

	<div class="row col-auto">
	 		<jsp:include page="/WEB-INF/views/myPageHeader.jsp"></jsp:include>
	</div>
					<br><br>
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
			 			<input type="hidden" id="Freservationno" name="reservationno" value="">
			 		</form>
		
		 	<c:forEach var="rep" items="${ReProduct}" varStatus="status">
					 		<div class="row mt-5" style="font-weight: bold;">
						 		<div class="col-auto text-center" style="border: 2px solid black; border-radius : 10px;font-size: large;">
						 		<img src="${rep.productimage }" style="width:140px; height:140px;">
						 		<span style="font-weight: bold">축제명 : </span><span style="display: none;">${rep.productno}</span>
						 			<span style="font-weight: bold;">${rep.productname}</span>
						 			<img src="resources/img/won.png" style="width:30px; height:30px; margin-left:10px; margin-right: 10px;"><span style="font-weight: bold;" id="price${status.index}"></span>원
						 			<span id="id${status.index}"></span>
						 			<img src="resources/img/ticket.png" style="width:40px; height:40px; margin-left:10px; margin-right: 10px;"><span id="Ticketcount${status.index}"></span>장
						 			 총 금액 : <span id="totalPrice${status.index }"></span>원
						 			<input type="button" value="예약취소" class="btn btn-danger cancleTicket">
						 			<input type="hidden" value="${rep.productno}">
						 			<span style="display:none; "id="no${status.index}"></span>			
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