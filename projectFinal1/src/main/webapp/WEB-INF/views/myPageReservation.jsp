<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="re" value="${Reservation}"></c:set>
<c:set var="rep" value="${ReProduct}"></c:set>    
    
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
	 	<c:forEach var="rep" items="${ReProduct}" >
		 	<div class="row">
		 		<div class="col">
		 		<form name="DeleteForm" id="deleteForm" action="delete">
		 			<input type="hidden" name="productno" value="${rep.productno}">
					<input type="button" name>
		 		</form>
		 			${rep.productno}<br>
		 			${rep.productname} <br>
		 			${rep.productcontent }<br>
		 			<img src="${rep.productimage }"><br>
		 		</div>
		 	</div>
 		</c:forEach>


</body>
</html>