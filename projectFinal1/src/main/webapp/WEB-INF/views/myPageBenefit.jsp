<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.text.DecimalFormat" %>

<c:set var="my" value="${member}"></c:set>
<c:set var="mt" value="${formattedNumber}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container text-center">
	 	<div class="row col-auto">
	 		<jsp:include page="/WEB-INF/views/myPageHeader.jsp"></jsp:include>
	 	</div>
		<div class="row text-center">
			<div class="col">
				<c:if test = "${sessionScope.id eq my.id}">
						<c:if test = "${my.grade eq 2 }">
							<div class="row">
								<div class="col">
								${my.id} 님의 회원등급은 <span style="font-weight: bold;">SILVER</span> 입니다.
								</div>
								<div class="col">
								현재 까지 이용하신 금액은 ${mt}이며, 다음 등급까지 남은 금액은 ${my.totalpay == my.totalpay ? 3000000 - my.totalpay : ''} 입니다.
								</div>
							</div>
							<span>
							SILVER 등급 : 구매금액 800,000원이상 3,000,000원 미만 또는, 구매건수 3건 이상 8건 미만 일시
	
	  						혜택적립 : 추가 1%
	
	  						혜택할인 : 추가 2% (300,000원이상 구매시)
	  						</span>
						</c:if>			
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>