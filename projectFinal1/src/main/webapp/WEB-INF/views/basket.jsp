<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="resources/css/hyunju.css" rel="stylesheet" >
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="resources/js/hyunju.js"></script>
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.3.1.min.js" type="application/javascript"></script>

<!--  장바구니에서 제품 등록 버튼 클릭시 쓸 폼 -->
<!-- 
form name="checkBasketForm" id="checkBasketForm"  action="checkBasketForm">
		<input type="hidden" name="id" id="rId02" value="${sessionScope.id}">
	<c:forEach var="b" items="${basketList}" >
		<input type="hidden" name="basketno"  id="basketno02"  value="${b.basketno}">  
		 <input type="hidden" name="productno" id="productno02" value="${b.basketProductNo}">  
		 <input type="hidden" name="basketProductCount"  id="basketProductCount02" value="${b.basketProductCount}"> 
		 <input type="hidden" name="productprice"  id="productprice02"  value="${b.productPrice}"> 
		 <input type="hidden" name="productname"  id="productname02"  value="${b.productName}"> 
	</c:forEach>
</form>
 -->

<!--/////////////  결제하기로 보낼 폼으로 보내면서 동시에 reservation 테이블에 정보 추가하기???////////////////-->
<form name="priceForm" id="priceForm"  action="priceOrder" method="post" >
	<input type="hidden" name="id" id="rId" value="${sessionScope.id}">
	<c:forEach var="b" items="${basketList}" >
		<input type="hidden" name="basketno"  id="basketno"  value="${b.basketno}">  
		<input type="hidden" name="productno" id="productno01" value="${b.basketProductNo}"> 
		<input type="hidden" name="basketProductCount"  id="basketProductCount" value="${b.basketProductCount}"> 
		<input type="hidden" name="productprice"  id="productprice"  value="${b.productPrice}"> 
		<input type="hidden" name="productname"  id="productname"  value="${b.productName}"> 
	</c:forEach>
	<c:forEach var="r" items="${basketList}" >
	
	</c:forEach>

<!--///////////////////  결제하기로 보낼 폼  끝 //////////////////////////-->

	<!--  상품정보 테이블 --><br>
	<div>
		<table>
		<thead>
			<tr>
				<th></th>
				<th>이미지</th>
				<th>상품</th>
				<th>판매가</th>
				<th>수량</th>
				<th>합계</th>
				<th>선택</th>
			</tr>		
			</thead>
			
		<!-- @@@@@@@@@@@  상품 주문으로 가는 폼  @@@@@@@@@@@@@@@ -->
	
		<tbody>
		<c:forEach var="b" items="${basketList}" >
			<tr>
				<td>
					<input type="checkbox"  name="checkbox">
				</td>
			<td>
					<img src="${b.productImage}"  width="50" height="50" />
				</td>
				
				<td>
					${ b.productName }
				</td>
				
				<td>
					${ b.productPrice }원 &nbsp;&nbsp;
				</td>
				
				<td>
				<!-- 
				<input type="number"  value="${b.basketProductCount }"  max="4" min="1" maxlength="3">
				 -->
					<input type="number"  value="${b.basketProductCount }" >
					<input type="submit" value="변경(지금안됨)" class="btn btn-primary">		
				</td>
				
				<td>
					${b.productPrice * b.basketProductCount}원
				</td>
				
				<td>
				<input class="btn btn-danger" type="button"  name="deleteBasket"  id="deleteBasket" value="삭제(지금안됨)">
				</td>
				
			</tr>
			</c:forEach>
		</tbody>

		</table>
		
		<!--  여기까지 상품정보테이블이였다. -->
		<br><br>
		<div>
			<span> 할인 적용 금액은 주문서 작성의 결제 예정 금액에서 확인 가능합니다. (여기서 확인 못한다는 뜻)</span>
		</div>
		<br><br>
		
		<div>
			<button>장바구니 비우기</button>
		</div>
	</div>
	
	<!--  결제예정금액 테이블 --><br>
	<table class="calculation2">
		<tr>
			<th>총 상품금액</th>
			<th>결제예상금액</th>
		</tr>
		
		<!-- ~~~~~~~~~~~~~ 금액 계산 ~~~~~~~~~~~~ -->
	<c:set var="num1" value="${b.productPrice}" />
		<tr>
			<td>${b.productPrice * b.basketProductCount}원</td>
			<td>0 원</td>
		</tr>
		</table>
	
	<!-- @@@@@@@@@@@  상품 주문으로 가는 폼  @@@@@@@@@@@@@@@ -->
	<br>
	<!--  상품 주문으로 가는 폼 -->
		<div>
			<input type="submit" value="전체상품주문테스트" class="btn btn-primary">
			<button>선택상품주문</button>
		</div>
		</form>
	<!--  결제예정금액 테이블 끝-->
