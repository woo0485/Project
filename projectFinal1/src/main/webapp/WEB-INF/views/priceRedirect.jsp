<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
   
  <%
    String id = (String) session.getAttribute("id");
%>
  
  <style>
  .finisth {
   font-size:  60px;
   text-align: center;
   font-style: 2px solid;
  }
  .list {
   font-size:  35px;
    text-align: center;
  }
  
  .table {
   font-size:  20px;
    text-align: center;
  }
  </style>
  
 <br><br>
<h1 class="finisth"> " 결제가 완료되었습니다. " </h1>
<br><br><br><br>

<!-- 
<h2 class="list">  지금까지 결제했던 목록들 </h2>
<br><br>

<c:forEach var="r" items="${reservationList}" >
<table class="table">
<tr>
        <th>날짜</th>
        <th>총 결제 가격</th>
</tr>

<tr>
        <td>${r.reservationdate}</td>
        <td>${r.reservationprice}</td>
</tr>
</table>
</c:forEach>


<c:forEach var="r" items="${reservationList}" >
		 <input type="hidden" name="productno"  id="productno348885435"  value="${r.productno}">  <br> 
		 <input  type="hidden" name="reservationno"  id="reservationno" value="${r.reservationno}"> <br>
		 <input  type="hidden" name="ticketcount"  id="ticketcount" value="${r.ticketcount}"> <br>
		 <input type="hidden" name="reservationprice"  id="reservationprice"  value="${r.reservationprice}"> <br>
		 <input type="hidden" name="reservationdate"  id="reservationdate"  value="${r.reservationdate}"> <br>
</c:forEach>
 -->

    
