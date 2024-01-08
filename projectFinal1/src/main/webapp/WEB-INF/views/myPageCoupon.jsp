<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="my" value="${MemberCoupon}"></c:set>
<c:set var="cu" value="${Coupon}"></c:set>    
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
	 	<c:if test="${fn:length(my) == 0}">
							    <div class="row">
							        <div class="col">
							            GALAGO에서 발급받은 쿠폰이 없습니다!
							        </div>
							    </div>
		</c:if>
			
				
	 		<c:forEach var="my" items="${MemberCoupon}" >
				${my.couponno} - 쿠폰테이블 기존쿠폰번호<br>
				${my.membercouponno} - 멤버테이블 쿠폰번호<br>
				${my.id }- 아이디<br>
				${my.couponopendate}<br>
				${my.couponclosedate}<br>
			</c:forEach>
			<br>
			<c:forEach var="cu" items="${Coupon}">
				${cu.couponname}
				${cu.coupondiscountrate }
			</c:forEach>
		
</body> 
</html>