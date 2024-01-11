<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ga" value="${Gallery}"></c:set>
<c:set var="pr" value="${Product}"></c:set>    
<!DOCTYPE html>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<html>
<head>
<style>
#productname {
  display : block;
  margin-left : 15px;
  width: 270px; 
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

#wrap-col {
  display : block;
  margin-left : 15px;
  width: 270px; 
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

		<div class="row col-auto">
	 		<jsp:include page="/WEB-INF/views/myPageHeader.jsp"></jsp:include>
	 	</div>
	 	<br><br>
	 	<li style="color:red;"><a class="text-decoration-none fontblack" href="myPageFavorite1?id=${sessionScope.id}"><i class="fas fa-crown"></i> 축제</a></li>
	 	<li><a class="text-decoration-none fontblack" href="myPageFavorite?id=${sessionScope.id}"><i class="fas fa-image"></i> 갤러리</a></li>
	 	<br><br><br><br>
 		
 		<c:if test="${fn:length(pr) == 0}">
							    <div class="row">
							        <div class="col">
							            GALAGO에서 즐겨찾기 하신 축제정보가 없습니다! 어서 빨리 GALAGO에서 다양한 축제를 즐겨보세요!
							        </div>
							    </div>
		</c:if>
 		
 		<div class="container text-center">
							<div class="row row-cols-4">
								<c:forEach var="pr" items="${Product}" >
									<div class="col text-center">					
										<span id="productname" style="font-weight: bold;">${pr.productname}</span>
										<a href="galleryRedirect"><img src="${pr.productimage}" style="width:270px; height:230px;"></a>
									    <p id="wrap-col">주소 : ${pr.productlocation }</p>
									    <br><br>
									</div>
								</c:forEach>
							</div>				
						</div>	
 		
 		
</body>
</html>