<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:set var="my" value="${member}"></c:set>
<c:set var="mt" value="${formattedNumber}"></c:set>
<c:set var="fmp" value="${fmp}"></c:set>
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
	 	<br><br><br>
		<div class="row text-center">
			<div class="col">
				<c:if test = "${sessionScope.id eq my.id}">
						<c:if test = "${my.grade eq 0 }">
							<div class="row">
								<div class="col">
								${my.name} 님의 회원등급은 <span style="font-weight: bold;">일반</span> 입니다.
								</div>
								<div class="row">
									<div class="col">
									현재 까지 이용하신 금액은 ${mt}원 이며, 다음 등급까지 남은 금액은 ${fmp}원 입니다.
									</div>
								</div>
							</div>
							<span>
							일반 등급 : 구매금액 500,000원 미만
							
							아쉽게도 일반 등급은 혜택이 없습니다.
	
	  						
	  						</span>
						</c:if>
						<c:if test = "${my.grade eq 1 }">
							<div class="row">
								<div class="col">
								${my.name} 님의 회원등급은 <span style="font-weight: bold;">BLACK</span> 입니다.
								</div>
								<div class="row">
									<div class="col">
									현재 까지 이용하신 금액은 ${mt}원 이며, 다음 등급까지 남은 금액은 ${fmp}원 입니다.
									</div>
								</div>
							</div>
							<span>
							BLACK 등급 : 구매금액 500,000원이상 800,000원 미만
	  						혜택할인 : 추가 2% (300,000원이상 구매시)
	  						</span>
						</c:if>
						<c:if test = "${my.grade eq 2 }">
							<div class="row">
								<div class="col">
								${my.name} 님의 회원등급은 <span style="font-weight: bold;">SILVER</span> 입니다.
								</div>
								<div class="row">
									<div class="col">
									현재 까지 이용하신 금액은 ${mt}원 이며, 다음 등급까지 남은 금액은 ${fmp}원 입니다.
									</div>
								</div>
							</div>
							<span>
							SILVER 등급 : 구매금액 800,000원이상 3,000,000원 미만
	  						혜택할인 : 추가 2% (300,000원이상 구매시)
	  						</span>
						</c:if>
						<c:if test = "${my.grade eq 3 }">
							<div class="row">
								<div class="col">
								${my.name} 님의 회원등급은 <span style="font-weight: bold;">GOLD</span> 입니다.
								</div>
								<div class="row">
									<div class="col">
									현재 까지 이용하신 금액은 ${mt}원 이며, 다음 등급까지 남은 금액은 ${fmp}원 입니다.
									</div>
								</div>
							</div>
							<span>
							GOLD 등급 : 구매금액 3,000,000원이상 5,000,000원 미만
	  						혜택할인 : 추가 3% (300,000원이상 구매시)
	  						</span>
						</c:if>
						<c:if test = "${my.grade eq 4 }">
							<div class="row">
								<div class="col">
								${my.name} 님의 회원등급은 <span style="font-weight: bold;">VIP</span> 입니다.
								</div>
								<div class="row">
									<div class="col">
									현재 까지 이용하신 금액은 ${mt}원 이며, 다음 등급까지 남은 금액은 ${fmp}원 입니다.
									</div>
								</div>
							</div>
							<span>
							VIP 등급 : 구매금액 5,000,000원이상	
	  						혜택할인 : 추가 5% (300,000원이상 구매시)
	  						</span>
						</c:if>			
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>