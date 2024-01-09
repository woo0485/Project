<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
   
  <%
    String id = (String) session.getAttribute("id");
%>
  
<c:forEach var="r" items="${reservationList}" >
		 reservation 의 productno: <input type="text" name="productno"  id="productno348885435"  value="${r.productno}">  <br> 
		  reservation 의 no: <input  type="text" name="reservationno"  id="reservationno" value="${r.reservationno}"> <br>
		 <input  type="text" name="ticketcount"  id="ticketcount" value="${r.ticketcount}"> <br>
		 <input type="text" name="reservationprice"  id="reservationprice"  value="${r.reservationprice}"> <br>
		 <input type="text" name="reservationdate"  id="reservationdate"  value="${r.reservationdate}"> <br>
</c:forEach>


    
