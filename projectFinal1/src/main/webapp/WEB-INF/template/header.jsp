<%@ page language="java" contentType="text/html; charset=UTF-8"pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">

a:link{text-decoration:none;}
a:visited{text-decoration:none;}
a:hover{ text-decoration:none;}

</style>

	<div class="row mt-5">	
		<div class="col">
		
			<a href="#" class="align-items-end">관리자 페이지</a>
			<div class="row text-end align-items-end"  id="categoryBar" >
				<span class="col-3"><a href="main" class="col"> <img alt=""src="resources/img/logo.png" style="width: 80%"></a></span>
				
				<span class="col-8 text-center">
					<strong class="m-5"><a href="festivalMap">축제 지도</a></strong>
					<strong class="m-5">축제</strong>
					<strong class="m-5">이벤트</strong>
					<a href="customerMain" class="col m-5"><strong>고객센터</strong></a>
				</span>
				
				<c:if test="${empty sessionScope.id}">
					<span class="col">
						<a href="login" class="row"><i class="bi bi-person-circle" style="font-size: 3em;"></i></a>
					</span>
				</c:if>
				<c:if test="${not empty sessionScope.id}">
					<span class="col">
						<i class="bi bi-person-lines-fill" style="font-size: 3em;"></i>
					</span>
				</c:if>
			</div>
			
			<div class="row" id="categoryBarDetail" style="display: none; ">
			
				<div class="col categoryDetail text-start me-1">
					<div class="row-rows-col-4 offset-5">
						<a class="col m-5" href="news">축제 기사</a>
						<a class="col me-3" href="#">진행중 이벤트</a>
						<a class="col m-5" href="noticeMain">공지 사항</a>
							<c:if test="${not empty sessionScope.id}">
						<a class="col" href="#">마이페이지</a>
						</c:if>
					</div>
				
				
					<div class="row-8 offset-5">
					<a class="col m-5" href="productList">축제 정보</a>
					<a class="col me-3" href="#">종료된 이벤트</a>
					<a class="col m-5" href="inquiryWrite">상품 문의</a>	
					<c:if test="${not empty sessionScope.id}">
						<a class="col" href="#">2</a>
					</c:if>
					</div>
				 
					<div class="row-8 offset-5">
						<a class="col m-5" href="gallery">갤러리</a>
						<a class="col m-5" href="#">당첨자</a>
						<a class="col m-5" href="informationUseMain">이용  안내</a>
						<c:if test="${not empty sessionScope.id}">
							<a class="col" href="logout">로그아웃</a>
						</c:if>
					</div>
				</div>
				
			</div>
			
		</div>
	</div>
									