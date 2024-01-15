<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
  .contentiamge {
    position: relative;
  }
  .productcontent {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate( -50%, -50% );
    color: white;
  }
  </style>

<!-- content 영역 ~~~~~~~~~~~~~  -->
<div class="row my-5" id="global-content">
	<div class="offset-1 col-10">
	<!--  ########## 장바구니에 추가할 때 form #############-->
		<form name="addBasket" id="addBasket"  action="addBasket" method="post" >
			<input type="hidden" name="id" id="rId" value="${sessionScope.id}"> 
			<input type="hidden" name="productNo" id="productno01" value="${product.productno}"> 
			<input type="hidden" name="productPrice" id="productprice01" value="${product.productprice}"> 

<!-- @@@@@@@@ 게시 글 상세보기 영역  @@@@@@@@@@-->
		<table>
		<tr>
			<td><c:choose>
						<c:when test="${fn:contains(product.productimage,'http')}">
							<img src="${product.productimage}"  class="productimage"  width="400" height="450" style="margin-right: 90px;"/><br>
						</c:when>
						<c:otherwise>
							<img src="resources/upload/${product.productimage}"  class="productimage"  width="400" height="450" style="margin-right: 90px;"/> <br>
						</c:otherwise>
					</c:choose>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td> 
		<td>
		
		<!--  북마크 비동기 테스트 -->
		<div id="recommend" class="text-end">
		<div id="bookmark" class="btnCommend text-primary"  style="cursor: pointer;">
			<div class="productbookmarkcount" style="font-size:15px">
					<img src="resources/img/bookmark.png"  width="40" height="35" />
					북마크 수 : ${ product.productbookmarkcount } 
			</div>
		</div>
		</div>
		<!--  북마크 비동기 테스트 -->
					
		<!--  오른쪽에 뜨는 축제 정보 글 한묶음 -->
		<h1 class="mb-0">${ product.productname }</h1> <br><br>
		<h5 class="mt-0">기간 ${ product.productopendate } ~ ${ product.productclosedate } </h5><br>
		<h5>금액 ${ product.productprice }원</h5><br>
		
		<!--  ############ 여기서부터는 회원 아이디 로그인했을 때만 구매버튼 보이게 한다 (장바구니) ############## -->	
		<c:if test="${not empty sessionScope.id}">	
		<!--  수량 선택  남은 수량 : productremainticketcount -->
			<label for="basketproductcount" class="form-label">수량을 선택하시오 </label> &nbsp;&nbsp;
			<!-- **** max 에  남은 티켓 수를 넣어줘야한다.??????? **** -->
			<input type="number"  value="1" name="basketProductCount"  id="basketProductCount" min="1" max="${ product.productremainticketcount }" >
			<!--  수량 선택 끝--> <br><br>
			<input type="submit" value="장바구니 담기" class="btn btn-primary">	
		</c:if>	
		<br><br>
				전체 티켓 수: ${ product.productticketcount} &nbsp&nbsp&nbsp&nbsp
				남은 티켓 수: ${ product.productremainticketcount } &nbsp&nbsp&nbsp&nbsp
				조회수: ${ product.productreadcount } 
				<!--  축제 정보 글 한묶음 끝 -->
			</td>
		</tr>
		</table>
	</form>
		<br><br><br>			
		<!-- ///////////  축제 정보 이미지와 내용  //////////// -->
		<div class="contentiamge">
				<c:choose>
						<c:when test="${fn:contains(product.productimage,'http')}">
							<img src="${product.productimage}"  class="productimage"  width="100%"/><br>
						</c:when>
						<c:otherwise>
							<img src="resources/upload/${product.productimage}"  class="productimage"  width="100%"/> <br>
						</c:otherwise>
					</c:choose><br>
		</div>
		<div class="row">
			<div class="col fs-4">${product.productcontent}</div>
		</div>

	</div>
		</div>
		
<!-- @@  여기서부터는 관리자가 수정 삭제할 수 있게 하는.....  @@-->
<!-- 관리자 로그인 XXXXXX  (임시로 관리자 로그인되었을 때 안되었을 때 둘 다 보이게 함 최종때는 수정할 것임)-->
	
	 <c:if test="${sessionScope.userType =='Admin' }">
			<div class="row my-3">
			<div class="col text-center">
	<!--  수정하려면 비밀번호 입력하는 영역 -->
		<div>
			수정하기 폼으로 이동하거나, 삭제하려면 관리자 비밀번호를 입력하시오. 
			<input class="form-control" type="password" name="adminpassword" id="adminpassword">
		</div>
		<br>
		<!--  수정하려면 비밀번호 입력하는 영역  끝-->
				<input class="btn btn-warning" type="button" id="detailUpdate" value="수정 폼 이동"> &nbsp;&nbsp; 
				<input class="btn btn-danger" type="button" id="detailDelete" value="삭제하기">

				<%-- 일반 게시 글 리스트에서 온 요청이면 일반 게시 글 리스트로 돌려 보낸다. --%>
				<c:if test="${ not searchOption }">	
				&nbsp;&nbsp;
						<input class="btn btn-primary" type="button"
									value="목록보기"
									onclick="location.href='productList?pageNum=${pageNum}'" />
				</c:if>
				<%-- 검색 리스트에서 온 요청이면 검색 리스트의 동일한 페이지로 돌려보낸다. --%>
				<c:if test="${ searchOption }">	
				&nbsp;&nbsp;
						<input class="btn btn-primary" type="button"
									value="목록보기"
									onclick="location.href='productList?pageNum=${pageNum}&type=${ type }&keyword=${ keyword }'" />
				</c:if>
			</div>
		</div>
	</c:if>
		
<!-- 관리자 로그인되었을 때  OOOOOOOOOO -->							
	<c:if test="${not empty sessionScope.adminid}">
		<div class="row my-3">
			<div class="col text-center">
	<!--  수정하려면 비밀번호 입력하는 영역 -->
		<div>
			수정하기 폼으로 이동하거나, 삭제하려면 관리자 비밀번호를 입력하시오. 
			<input class="form-control" type="password" name="adminpassword" id="adminpassword">
		</div>
		<br>
		<!--  수정하려면 비밀번호 입력하는 영역  끝-->
				<input class="btn btn-warning" type="button" id="detailUpdate" value="수정 폼 이동"> &nbsp;&nbsp; 
				<input class="btn btn-danger" type="button" id="detailDelete" value="삭제하기">

				<%-- 일반 게시 글 리스트에서 온 요청이면 일반 게시 글 리스트로 돌려 보낸다. --%>
				<c:if test="${ not searchOption }">	
				&nbsp;&nbsp;
						<input class="btn btn-primary" type="button"
						value="목록보기"
						onclick="location.href='productList?pageNum=${pageNum}'" />
				</c:if>
				<%-- 검색 리스트에서 온 요청이면 검색 리스트의 동일한 페이지로 돌려보낸다. --%>
				<c:if test="${ searchOption }">	
				&nbsp;&nbsp;
						<input class="btn btn-primary" type="button"
						value="목록보기"
						onclick="location.href='productList?pageNum=${pageNum}&type=${ type }&keyword=${ keyword }'" />
				</c:if>
			</div>
		</div>
	</c:if>

