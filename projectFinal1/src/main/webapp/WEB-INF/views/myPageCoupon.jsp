<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="my" value="${membercoupon}"></c:set>
<c:set var="coupon" value="${coupon}"></c:set>    
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
	 	
			${my.couponno}-쿠폰테이블 기존쿠폰번호
			${my.membercouponno} - 멤버테이블 쿠폰번호
			${my.id }- 아이디
			${my.couponopendate}
			${my.couponclosedate}<br>
		
	
			${coupon.couponname} - 쿠폰테이블 이름
			${coupon.couponno} - 쿠폰테이블에서 가져온 기존 쿠폰번호

</body> 
</html>