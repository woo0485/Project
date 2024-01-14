<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="my" value="${MemberCoupon}"></c:set>
<c:set var="cu" value="${Coupon}"></c:set>  
  
<!DOCTYPE html>
<html>
<head>
<style>

#soso {
  border: 5px solid #bbb; 
  border-radius: 15px; 
}

.container {
  padding: 2px 16px;

}


.expire {
  color: red;
}

</style>
<script>
document.addEventListener('DOMContentLoaded', function() {
	const hiddenCouponNameInputs = document.querySelectorAll('input[id^="couponname"]');
	const hiddenCouponDiscountRateInputs = document.querySelectorAll('input[id^="coupondiscountrate"]');
    
    hiddenCouponNameInputs.forEach(function(input, index) {
    var name = input.value;
    var correspondingElement = document.getElementById('name'+index);
    correspondingElement.innerText = name;

    });
    
    hiddenCouponDiscountRateInputs.forEach(function(input, index) {
    var discountRate = input.value;
    var correspondingElement = document.getElementById('discountrate'+index);
    correspondingElement.innerText = discountRate + '% 할인쿠폰';
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
	 	<br><br>
	 	<c:if test="${fn:length(my) == 0}">
							    <div class="row">
							        <div class="col">
							            GALAGO에서 발급받은 쿠폰이 없습니다!
							        </div>
							    </div>
		</c:if>
			
							
					 			<div class="coupon">
						 			<div class="row">
				 						<c:forEach var="my" items="${MemberCoupon}" varStatus="status">
								 			<div class="col-3 offset-1" id="soso">
											  		<p style="text-align : center;"><img src="resources/img/logo.png" alt="GALAGO" style="width:120px; height:70px;"></p>
											    	<h3 style="text-align: center;" id="name${status.index}"></h3>											  										    
											    	<h4 style="text-align: center;" id="discountrate${status.index}"></h4>
											    	<p style="text-align: right;">사용자 : <span style="font-weight: bold;">${my.id}</span> 님</p>									  	
											    	<p>쿠폰 수령일 - ${my.couponopendate}</p>
											    	<p class="expire">쿠폰 만료일 - ${my.couponclosedate}</p>									  	
											</div>
										</c:forEach>
									</div>
								</div> 
			
			
			<br>
			<c:forEach var="cu" items="${Coupon}" varStatus="status">
				<input type="hidden" value="${cu.couponname}" id="couponname${status.index}">
				<input type="hidden" value="${cu.coupondiscountrate}" id="coupondiscountrate${status.index}">
			</c:forEach>
		
</body> 
</html>