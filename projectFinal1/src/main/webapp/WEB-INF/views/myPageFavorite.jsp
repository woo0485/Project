<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	 	<c:if test="${fn:length(ga) == 0}">
							    <div class="row">
							        <div class="col">
							            GALAGO에서 즐겨찾기 하신 갤러리 게시물이 없습니다!
							        </div>
							    </div>
		</c:if>
	 	
	 	<c:forEach var="ga" items="${Gallery}" >
		 	<div class="row">
		 		<div class="col">
		 			${ga.galleryno}<br>
		 			작성자 ${ga.id} <br>
		 			${ga.gallerytitle}<br>
		 			${ga.galleryimage}<br>
		 		</div>
		 	</div>
 		</c:forEach>
 		<div>
 			
 			<br><br><br>
 		</div>
 		<c:if test="${fn:length(pr) == 0}">
							    <div class="row">
							        <div class="col">
							            GALAGO에서 즐겨찾기 하신 축제정보가 없습니다! 어서 빨리 GALAGO에서 다양한 축제를 즐겨보세요!
							        </div>
							    </div>
		</c:if>
 		
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