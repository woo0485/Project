<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="resources/css/hyunju.css" rel="stylesheet" >
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="resources/js/hyunju.js"></script>
<c:forEach var="p" items="${productList}" varStatus="status">
${p.productname }
</c:forEach>

<!-- https://doublesprogramming.tistory.com/137 -->
	<!--  상품정보 테이블 -->
	<div>
		<table>
		<thead>
			<tr>
				<th>구매상품</th>
				<th><span>이미지</span></th>
				<th>판매가</th>
				<th>수량</th>
				<th>합계</th>
				<th>선택</th>
			</tr>		
			</thead>
			
		<tbody>
		<c:forEach var="b" items="${basketList}" varStatus="status">
			<tr>
				<td>
					<input type="checkbox"  name="checkbox">
				</td>
				
				<td>
					${ p.productname }
				</td>
				
				<td>
					<img src="${p.productimage}"  width="50" height="50" />
				</td>
				<td><span>0</span>원</td>
				
				<td>
					<input type="number"  value="${b.basketproductcount }"  max="4" min="1" maxlength="3">
					<input type="submit" value="변경" class="btn btn-primary">		
				</td>
				
				<td>
					<button>삭제</button>
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
		
		<tr>
			<td>0 원</td>
			<td>0 원</td>
		</tr>
		</table>
	<!--  결제예정금액 테이블 끝--><br>
		
		<div>
			<button>전체상품주문</button>
			<button>선택상품주문</button>
		</div>
	
	<!--  결제예정금액 테이블 끝-->