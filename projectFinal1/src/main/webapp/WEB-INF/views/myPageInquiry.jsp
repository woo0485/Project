<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="qu" value="${Question}"></c:set>    
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
	<c:forEach var="qu" items="${Question}" >
		<div class="row">
			<div class="col">
				${qu.questionNo}<br>
				${qu.id}<br>
				${qu.questionTitle}<br>
				${qu.questionContent}<br>
				${qu.questionDate}<br>
				<c:if test="${qu.questionCategory eq 'individual'}">
				 	개인문의<br>
				</c:if>
				<c:if test="${qu.questionCategory eq 'Product'}">
				 	상품문의<br>
				</c:if>
				${qu.email}<br>
				${qu.answerProgress}<br>
				${qu.answerTitle}<br>
				${qu.answerTitle}<br>
				${qu.answerDate}<br>
				${qu.toEmail}<br> 	
			</div>
		</div>
	</c:forEach>
	
	
</body>
</html>