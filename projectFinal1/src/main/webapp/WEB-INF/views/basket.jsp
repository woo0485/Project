<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- https://doublesprogramming.tistory.com/137 -->
	<!-- content 영역 -->
	<div class="row my-5" id="global-content">		
		<div class="offset-1 col-10">
		<h2> 장바구니 확인</h2>
		<c:choose>
			<c:when test="${basket.basketproductcount  == 0}">
			장바구니가 비어있습니다.
			</c:when>
		
		</c:choose>
		
		</div>
	</div>	