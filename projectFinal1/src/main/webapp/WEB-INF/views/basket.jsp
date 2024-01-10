<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="resources/css/hyunju.css" rel="stylesheet" >
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="resources/js/hyunju.js"></script>
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.3.1.min.js" type="application/javascript"></script>
<style>
.total {
	font-size: 30px;
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
</style>
<!--  장바구니에서 제품 등록 버튼 클릭시 쓸 폼 -->

 <!--  ################      장바구니에서 상품 수량 변경 및 삭제  폼  ######################### -->	
 <!-- <form name="updateDeleteForm" id="updateDeleteForm"  action="updateDeleteForm"> -->
<form name="updateDeleteForm" id="updateDeleteForm" >
	    <input type="hidden" name="id" id="rId34534" value="${sessionScope.id}">

<br><br>
 <c:if test="${empty basketList}">
    <p class="nobasket">장바구니에 담긴 상품이 없습니다.</p>
</c:if>


<!--//////////////////////  여기서부터 장바구니에 있는 목록 보여주는 뷰 /////////////////////////-->
	<!--  상품정보 테이블 -->
	<br>
	<div>
	<c:if test="${not empty basketList}">
		<table class="BasketTable">
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
			
		<tbody>
		<c:forEach var="b" items="${basketList}" >
			<tr>
				<td>
				<!--  	<input type="checkbox"  name="checkbox">-->
				</td>
			<td>
			<!-- ${b.basketno } -->
					<img src="${b.productImage}"  width="50" height="50" />
				</td>
				
				<td>
					${ b.productName }
				</td>
				
				<td>
					${ b.productPrice }원 &nbsp;&nbsp;
				</td>
				
				<td>
	<!-- $$$$$$$$$$$  버튼이 반복문 안에서 있기 때문에 class 이름이 줘야한다. 아이디는 고유한 번호이기 떄문에 !!!!!!  $$$$$$$$$$ -->
					<input type="number"   max="${ product.productremainticketcount }"  min="1" value="${b.basketProductCount }" 
					class="basketProductCount"
					name="basketProductCount" 
					data-basketProductCount="${b.basketProductCount }">
					
					<!-- 
					<input type="text" name="basketProductNo"  value="${b.basketProductNo}"
					class="basketProductNo"
					data-basketProductNo="${b.basketProductNo }">
					 -->
				<!--  원래 쓰던 수량 변경 버튼
				<input class="updateBasketProductnoCount btn btn-danger"   type="button"  
					name="updateBasketProductnoCount" 
					value="변경"  data-no="${b.basketno }">
				 -->
				
					<input type="button" class="updateBasketProductnoCount" data-basketno="  ${b.basketno }"  value="변경">
	<!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
				</td>
				
				<td  id= "productPrice38">
					${b.productPrice * (b.basketProductCount)}원
				</td>
				
				<td>
				<input class="btn btn-danger"  type="text" name="deleteBasketProductno"  id="deleteBasketProductno" value="삭제">
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
		<div>
		<!--<input class="btn btn-danger" type="text"  name="deleteBasketAll"  id="deleteBasketAll" value="장바구니 비우기">  -->
		</div>
	</div>

<c:if test="${not empty basketList}">
	<!--  결제예정금액 테이블 --><br><br>
	<table class="calculation2">
		<tr>
			<th>총 상품금액</th>
		</tr>
		
		<!-- ~~~~~~~~~~~~~ 금액 계산 ~~~~~~~~~~~~ -->
	<c:set var="num1" value="${b.productPrice}" />
		<tr>
			<!--  총 수량 -->
	<c:set var="totalAmount" value="0" />
  		 <c:forEach var="b" items="${basketList}">
   			 <c:set var="subtotal" value="${b.productPrice * b.basketProductCount}" />
   			 <c:set var="totalAmount" value="${totalAmount + subtotal}" />
		</c:forEach>
			<td class="total">${totalAmount}원</td>
		</tr>
		</table>
</c:if>
<!--//////////////////////  여기서부터 장바구니에 있는 목록 보여주는 뷰  끝 ~~~~~ /////////////////////////-->
</form>


<c:if test="${not empty basketList}">
<!--        ///////////////// 전체 상품 삭제하기  ////////////////           --> <br><br>
<form name="deleteBasketAll" id="deleteBasketAll"   action="deleteBasketAll"  method="post" >
	    <input type="hidden" name="id" id="rId345dfgdfgd34" value="${sessionScope.id}">
	    <input class="btn btn-danger" type="submit"  name="deleteBasketAll"  id="deleteBasketAll" value="장바구니 비우기">
</form>
</c:if>

<!--  ################   장바구니에서 상품 수량 변경 및 삭제   끝 ~~ ##################### -->	
<br>

<c:if test="${not empty basketList}">
	<!-- @@@@@@@@@@@  상품 주문으로 가는 폼  이게 진짜!!!!!! @@@@@@@@@@@@@@@ -->
	<form name="priceForm" id="priceForm"  action="priceOrder" method="post" >
	<input type="hidden" name="id" id="rId" value="${sessionScope.id}">
	<c:forEach var="b" items="${basketList}" >
		<input type="hidden" name="basketno"  id="basketno"  value="${b.basketno}">  
		<input type="hidden" name="productno" id="productno01" value="${b.basketProductNo}"> 
		<input type="hidden" name="basketProductCount"  id="basketProductCount" value="${b.basketProductCount}"> 
		<input type="hidden" name="productprice"  id="productprice"  value="${b.productPrice}"> 
		<input type="hidden" name="productname"  id="productname"  value="${b.productName}"> 
	</c:forEach>
	
		<input type="submit" value="전체상품주문하기" class="btn btn-primary">
	</form>
	</c:if>
	
	<!--@@@@@@  예약 테이블을 단순히 보여지는 페이지로 넘김 - priceOrderFinish 페이지로 넘김 @@@@@@-->
	<form name="ReservationForm" id="ReservationForm"  action="reservation" method="post" >
		<input type="hidden" name="id" id="rId036" value="${sessionScope.id}"> <br>
	
	<c:forEach var="b" items="${basketList}" >
    	<input type="hidden" name="productno" id="productno45345345" value="${b.basketProductNo}"> 
   		 <input type="hidden" name="basketproductcount" id="basketproductcount5645645" value="${b.basketProductCount}">
   		 <input type="hidden" name="productprice" id="productprice324324" value="${b.productPrice}">
	</c:forEach>
	
	<input type="submit" value="단순히 결제한 예약정보 (reservation 테이블)보기" class="btn btn-danger">	
	
	</form>
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->

<!-- ################  장바구니 속  상품 수량 변경 및 삭제 ajax로 처리하게끔  #################### -->  
<!--  
<script>
$(document).ready(function() {

	 $(".updateBasketProductnoCount").click(function() {
		 // $$$$$$ 여기서도 버튼의 아이디 이름이 아니라 class이름으로 받아오면된다.!!!!!!!!
		 
		 // 해당하는 수량도 반복문 안에서니까 class이름으로 받아와야한다!!!!!
		 //const val = $("#basketProductCount").val();
		// const id =$("#rId34534").val();
		 //const productno = $("#productno0134").val();
		 
		 // ********* 변경 버튼 이 반복문에 돌아가니까 ~~~
		// const basketno = $(this).data("no");
		const basketno = $(this).data("no");
		// basketproductcount 테스트
		const basketProductCount = document.getElementsByName('basketProductCount')[0].value;
		//const basketProductCount = $(this).data("basketProductCount");
	
		 // id는 session에 저장되어있으니까 안해도됨
		 const id =$("#rId34534").val();
		 
		 console.log("bakset페이지에서 id " , id);
		 console.log("bakset페이지에서 basketno " , basketno);
		 console.log("bakset페이지에서 변경된 수량 " , basketProductCount);
		 // $$$$$$$$$$$$$$$$$$ 여기까지 id랑 basketno랑 수량이랑 다 넘어감 !!!1 $$$$$$$$$$$$$$$
		 /*
		 $.ajax({
	            type: "POST",
	            url: "updateDeleteForm",  // 서버의 매핑 주소
	            data: {
	            	"id" : id ,
	            	"basketProductCount" : basketProductCount,
	            	"basketno" : basketno
	            },
	            success: function(response) {
	                // 서버에서 받은 응답 처리
	                console.log("서버 응답: " + response);
	                // 필요한 동작 수행 (예: 화면 갱신, 리다이렉트 등)
	                window.location.href = 'updateDeleteForm?id=' +id + '&basketno=' +basketno + '&basketProductCount=' + basketProductCount;
	            },
	            error: function(xhr, error, msg) {
	                console.error("장바구니에서 상품 수량 변경 및 삭제 에러 발생: " + error + ". " + msg);
	            }
	        });
		// console.log("bakset페이지에서" + val);	
	*/
	    });
});
	</script>
-->