<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<link href="resources/css/side.css" rel="stylesheet" >
<style>
.bg {
	
	background-color:#EDEEF0;
}
.fontblack{
	color:#333333;
}
</style>
<!-- content 영역 -->
<div class="row my-5" id="global-content">		
	<div class="col-6 offset-3 font bg">		
		<div class="row">
			<div class="col text-center fw-bold">
				<div class="row">
					<div class="col border-bottom my-5 pb-4">
						<i class="bi bi-folder-check"></i>
						<a class="text-decoration-none fontblack ps-3" href="manageMain">관리자 메인</a>
					</div>
				</div>										
				<div class="row">
					<div class="col-4 text-end">
						<i class="bi bi-graph-up-arrow"></i>
					</div>	
					<div class="col-8 text-start">						  	
					    <a class="text-decoration-none fontblack" href="manageSales">매출 관리</a>
					</div>
				</div>
				<div class="row pt-5">
					<div class="col-4 text-end">
						<i class="bi bi-people"></i>
					</div>	
					<div class="col-8 text-start">						  	
					    <a class="text-decoration-none fontblack" href="manageMember">회원 관리</a>
					</div>
				</div>
				<div class="row pt-5">
					<div class="col-4 text-end">
						<i class="bi bi-folder-check"></i>
					</div>	
					<div class="col-8 text-start">						  	
					    <a class="text-decoration-none fontblack" href="manageReservation">예약 관리</a>
					</div>
				</div>
				<div class="row pt-5">
					<div class="col-4 text-end">
						<i class="bi bi-basket"></i>
					</div>	
					<div class="col-8 text-start">						  	
					    <a class="text-decoration-none fontblack" href="manageEvent">이벤트 관리</a>
					</div>
				</div>
				<div class="row pt-5">
					<div class="col-4 text-end">
						<i class="bi bi-cart-check"></i>
					</div>	
					<div class="col-8 text-start">						  	
					    <a class="text-decoration-none fontblack" href="manageProduct?qestionCategory=product">상품 문의함</a>
					</div>
				</div>
				<div class="row pt-5">
					<div class="col-4 text-end">
						<i class="bi bi-chat-right-text"></i>
					</div>	
					<div class="col-8 text-start">						  	
					    <a class="text-decoration-none fontblack" href="manageIndividual?qestionCategory=individual">1:1 문의함</a>
					</div>
				</div>
				
				<div class="row">
					<div class="col border-top my-5 pt-4">
						<i class="bi bi-exclamation-circle"></i>
						<span class="ps-3">관리자님</span>
					</div>
				</div>
			</div>	
		</div>
	</div>
</div>
