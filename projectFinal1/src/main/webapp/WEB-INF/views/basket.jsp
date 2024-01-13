<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title> 장바구니 </title>
	
<link href="resources/bootstrap/bootstrap.min.css" rel="stylesheet" >
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script src="resources/bootstrap/bootstrap.bundle.min.js"></script>		
	
<style>
.total {
	font-size: 40px;
}
.nobasket {
	font-size: 50px;
	text-align: center;
}
.orderCheck {
	font-size: 20px;
	text-align: center;
}
.BasketTable { 
	font-size: 15px;
	text-align: center;
}
.basketimformation {
text-align: center;
}
.totalprice{
font-size: 40px;
}
.productName38 {
	text-align: center;
}
.basketProductCount {
   width: 50px;
   height: 50px;
}
 #productNameTd {
 font-size: 20px;
 }
#productSelectNumber {
font-size: 20px;
}
.calculation2 {
text-align: center;
font-weight: bold;
}
.finalbuttonss {
display: flex;
justify-content: center;
gap: 30px;
}
.totalPriceWon {
text-align: center;
font-weight: bold;
font-size: 25px;
}
.deleteBasketProductNo, .updateBasketProductNoCount {
height: 40px;
font-size: 20px;
}
thead {
text-align: center;
}
.basketData {
vertical-align:middle;
}

</style>
</head>
<!--  장바구니에서 제품 등록 버튼 클릭시 쓸 폼 -->
<body>
 <script src="resources/bootstrap/bootstrap.bundle.min.js"></script>	
 <!--  ################      장바구니에서 상품 수량 변경 및 삭제  폼  ######################### -->	
 
<form name="updateDeleteForm" id="updateDeleteForm" >
<br><br>
 <c:if test="${empty basketList}">
    <p class="nobasket">장바구니에 담긴 상품이 없습니다.</p>
</c:if>

<!--//////////////////////  여기서부터 장바구니에 있는 목록 보여주는 뷰 /////////////////////////-->
	<!--  상품정보 테이블 -->
	<br>
	<div id="basketimformation">
	<c:if test="${not empty basketList}">
	<table class="table table-light table-striped table-hover" >
			<thead>
				<tr>
					<th>상품명</th>
					<th>수량</th>
					<th>주문금액</th>
					<th>선택</th>
				</tr>		
			</thead>
			
<tbody id="basketTableBody">
			<c:forEach var="b" items="${basketList}" >
			<tr class="basketData">
				<td  id= "productNameTd">
						<img src="${b.productImage}"  width="90"  height="90" /> 	&nbsp;&nbsp;
						${ b.productName }
				</td>
				
				<td id= "productSelectNumber">
					<input type="number"   max="${ product.productremainticketcount }"  min="1" 
							value="${b.basketProductCount }" 
							class="basketProductCount"
							name="basketProductCount" 
							data-basketProductCount="${b.basketProductCount }" > &nbsp;&nbsp;
					<input type="button" class="btn btn-outline-dark updateBasketProductNoCount" 
								data-basketno="${b.basketNo }"  data-productno="${b.productNo}" value="선택">	
				</td>
				
				<td>
					<div class="totalPriceWon">${b.totalPrice}원</div>	
				</td>
		
				 
				<td>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
					<input type="button"  class="btn btn-outline-dark deleteBasketProductNo"    
								data-basketno="${b.basketNo }"  data-productno="${b.productNo}"  value="삭제">
						 &nbsp;&nbsp;
				</td>
			
				</tr>
				</c:forEach>
</tbody>
		</table>
		</c:if>
		<!--  여기까지 상품정보테이블이였다. --> 
		<br><br><br>
		
<c:if test="${not empty basketList}">
		<div class="orderCheck">
			주문 시 유의사항: <br>
    1. 주문한 상품의 재고 상태를 확인해주세요.<br>
    2. 주문 전 배송지 정보를 정확하게 입력해주세요.<br>
    3. 주문이 완료되면 주문 확인 메일이 발송됩니다.<br>
    4. 주문 취소 및 환불 규정을 확인해주세요.<br>
    5. 기타 문의사항은 고객센터로 문의해주세요.
		</div><br>
</c:if>	 
	</div>

<c:if test="${not empty basketList}">
	<!--  결제예정금액 테이블 --><br><br>
	<div class="calculation2">
		<div class="totalprice"> 총 상품금액</div>
		<div class="total"> ${basketTotalPrice}원</div>
	</div>
</c:if>
</form>
<!--//////////////////////  여기서부터 장바구니에 있는 목록 보여주는 뷰  끝 ~~~~~ /////////////////////////-->
<br><br>
<!--        /////////////////  전체 상품 삭제하기  ////////////////           -->
<div  class=" finalbuttonss">
<c:if test="${not empty basketList}"> <br><br>
<form name="deleteBasketAll" id="deleteBasketAll"   action="deleteBasketAll"  method="post" >
	    <input type="hidden" name="id" id="rId345dfgdfgd34" value="${sessionScope.id}">
	    <input class="btn btn-outline-danger" type="submit"  name="deleteBasketAll"  id="deleteBasketAll" value="장바구니 비우기">
</form>
</c:if>

<br>
<!-- @@@@@@@@@@@  상품 주문으로 가는 폼  이게 진짜!!!!!! @@@@@@@@@@@@@@@ -->
<c:if test="${not empty basketList}">
	<form name="priceForm" id="priceForm"  action="priceOrder" method="post" >
		<input type="hidden" name="id" id="rId" value="${sessionScope.id}">
		<c:forEach var="b" items="${basketList}" >
			<input type="text" name="basketNo"  id="basketno"  value="${b.basketNo}">  
			<input type="text" name="productNo" id="productno01" value="${b.productNo}"> 
			<input type="text" name="basketProductCount"  id="basketProductCount" value="${b.basketProductCount}"> 
			<input type="text" name="productPrice"  id="productprice"  value="${b.productPrice}"> 
			<input type="text" name="productName"  id="productname"  value="${b.productName}"> 
			<input type="text" name = "baskettotalptice" id = "baskettotalprice" value = "${b.totalPrice }">
		</c:forEach>
	
		<input type="submit" value="전체상품주문하기"  class="btn btn-outline-primary">
	</form>
	</c:if>
</div>	
<!--  남은 티켓 수 보내는 폼  -->
<form name="dfgfdg" action="dfgfdg"> 
	<c:forEach var="p" items="${productList}" varStatus="status">
 남은 티켓 수: <input type="text" value="${ p.productremainticketcount }">
 </c:forEach>
	</form>
	
	</body>
	</html>
