<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">

a:link{text-decoration:none;}
a:visited{text-decoration:none;}
a:hover{ text-decoration:none;}

</style>

	<div class="row mt-5">	
		<div class="col">
			<a href="#">관리자 페이지</a>
			<div class="row row-cols-6 text-end align-items-end"  id="categoryBar" >
				<span class="col"><a href="main" class="col"> <img alt=""src="resources/img/logo.png" style="width: 200px;"></a></span>
				<span class="col pe-0"><strong><a href="festivalMap">축제 지도</a></strong></span>
				<span class="col"><strong>축제</strong></span>
				<span class="col"><strong>이벤트</strong></span>
				<span class="col"><a href="customerMain" class="col"><strong>고객센터</strong></a></span>
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
			
			<div class="row row-cols-6" id="categoryBarDetail" style="display: none; ">
				<div class="col offset-5">
					<div class="row"><a class="" href="news">축제 기사</a></div>
					<div class="row"><a class="" href="productList">축제 정보</a></div>
					<div class="row"><a class="" href="gallery">갤러리</a></div>
				</div>
				<div class="col">
					<div class="row"><a class="" href="#">진행중 이벤트</a></div>
					<div class="row"><a class="" href="#">종료된 이벤트</a></div>
					<div class="row"><a class="" href="#">당첨자</a></div>
				</div>
				<div class="col">
					<div class="row"><a class="" href="#">공지 사항</a></div>
					<div class="row"><a class="" href="#">상품 문의</a></div>
					<div class="row"><a class="" href="#">1:1 문의</a></div>
				</div>
				<c:if test="${not empty sesstionScope.id }">
					<div class="col">
						<div class="row"><a class="" href="noticeMain">공지 사항</a></div>
						<div class="row"><a class="" href="inquiryWrite">상품 문의</a></div>
						<div class="row"><a class="" href="informationUseMain">이용 안내</a></div>
					</div>
				</c:if>
			</div>
			
		</div>
	</div>
						