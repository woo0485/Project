<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.3.1.min.js" type="application/javascript"></script>
<link href="resources/css/hyunju.css" rel="stylesheet" >
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="resources/js/hyunju.js"></script>
<body>
<h1>예약 정보 테이블 </h1>

<c:forEach var="r" items="${reservationList}" >
		 reservation 의 productno: <input type="text" name="productno"  id="productno348885435"  value="${r.productno}">  <br> 
		  reservation 의 no: <input  type="text" name="reservationno"  id="reservationno" value="${r.reservationno}"> <br>
		 <input  type="text" name="ticketcount"  id="ticketcount" value="${r.ticketcount}"> <br>
		 <input type="text" name="reservationprice"  id="reservationprice"  value="${r.reservationprice}"> <br>
		 <input type="text" name="reservationdate"  id="reservationdate"  value="${r.reservationdate}"> <br>
</c:forEach>

텅 비었어요

</body>
</html>
