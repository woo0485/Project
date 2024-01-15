<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 
	jQuery, bootstrap 관련된 모든 js 파일은 
	WEB-INF/index.jsp 에 참조하고 있으므로 여기서 별도로 참조할 필요 없음 - 주의할 것 두 번씩 실행됨
	그리고 index.jsp에 이미 head, body 태그 등이 있으므로 모두 생략해야 함
-->
<div class="row my-5">
	<div class="col">
		<div class="row my-3">
			<div class="col">		
				<h1 class="text-center fw-bold fs-3">주문 완료</h1>
			</div>
		</div>
		<div class="row my-3">
			<div class="col" id="basketWrap">
				 <table class="table table-hover" >
					<thead class="table-secondary">
						<tr class="text-center row">
							<th class="col-7">상품명</th>
							<th class="col">주문수량</th>
							<th class="col">주문금액</th>						
						</tr>		
					</thead>
					<c:if test="${not empty basketList}">
					<tbody id="basketTableBody">
						<c:forEach var="b" items="${basketList}" >
						<tr class="basketData row">
							<td  id= "productNameTd" class="col-7">
								<div class="row h-100 align-items-center">
									<div class="col">
										<img src="${b.productImage}"  width="90"  height="90" />
										${ b.productName }
									</div>
								</div>	
							</td>				
							<td id= "productSelectNumber" class="col">
								<div class="row h-100 text-center align-items-center">
									<div class="col">${b.basketProductCount }장</div>
								</div>				
							</td>				
							<td class="col">
								<div class="row h-100 text-center align-items-center">
									<div class="col totalPriceWon">${b.totalPrice}원</div>
								</div>	
							</td>							
						</tr>
						</c:forEach>						
					</tbody>	
					</c:if>
				</table>
				<c:if test="${empty basketList}">
				<div class="row my-5">
					<div class="col">						
						<h3 class="col text-center fs-5 fw-bold">주문한 상품이 없습니다.</h3>													
					</div>
				</div>
				<div class="row my-3">
					<div class="col text-end">						
						<input type="button" class="btn btn-outline-primary" value="축제정보 보기" onclick="location.href='productList'">												
					</div>
				</div>
				</c:if>
				<c:if test="${not empty basketList}">
				<div class="row my-3">
					<div class="col my-3">
						<h3 class="fs-3 fw-bold text-end" id="basketTotalPrice">총 주문금액 : ${basketTotalPrice}원</h3>
					</div>
				</div>
				<%-- 세부 결제 정보 출력 또는 티켓 사용법 등 안내 문구
				<div class="row my-3">
					<div class="col offset-1 my-3">
						<h3 class="fs-5 fw-bold">주문시 유의 사항 : </h3>
						<ul>
							<li>주문한 상품의 재고 상태를 확인해주세요.</li>
							<li>주문 전 배송지 정보를 정확하게 입력해주세요.</li>
							<li>주문이 완료되면 주문 확인 메일이 발송됩니다.</li>
							<li>주문 취소 및 환불 규정을 확인해주세요.</li>
							<li>기타 문의사항은 고객센터로 문의해주세요.</li>
						</ul>
					</div>
				</div>
				  --%>
				<div class="row my-3">
					<div class="col text-end">
						<input type="button" class="btn btn-outline-primary" value="축제정보 보기" onclick="location.href='productList'">
						<input type="button" class="btn btn-outline-success" value="축제기사 보기" onclick="location.href='news'">																		
					</div>
				</div>
				</c:if>
			</div>
		</div>		
	</div>
</div>
