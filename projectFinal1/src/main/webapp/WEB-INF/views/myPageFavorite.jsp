<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ga" value="${Gallery}"></c:set>
<c:set var="pr" value="${Product}"></c:set>    
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
	 	<c:forEach var="ga" items="${Gallery}" >
		 	<div class="row">
		 		<div class="col">
		 			${ga.galleryno}<br>
		 			${ga.id} <br>
		 			${ga.gallerytitle }<br>
		 			${ga.galleryimage}<br>
		 		</div>
		 	</div>
 		</c:forEach>
 		<div>
 			<span> 여기서부터는 상품 즐착</span>
 			<br><br><br>
 		</div>
 		<c:forEach var="pr" items="${Product}">
 			<div class="row">
 				<div class="col">
 					${pr.productno}<br>
 					${pr.productname}<br>
 					<image src="${pr.productimage}"><br>
 				</div>
 			</div>
 		</c:forEach>
</body>
</html>