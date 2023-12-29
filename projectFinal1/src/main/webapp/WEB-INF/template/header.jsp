<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
	a:link{text-decoration:none;}
	a:visited{text-decoration:none;}
	a:hover{ text-decoration:none;}
</style>

<<<<<<< HEAD
	<div class="row mt-5">	
		<div class="col">
		
			<a href="manageMain" class="align-items-end">관리자 페이지</a>
			
			<div class="row text-end align-items-end "   >
				<span class="col-3"><a href="main" class="col"> <img alt=""src="resources/img/logo.png" style="width: 70%"></a></span>
				
				<span class="col-8 text-center" id="categoryBar">
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
=======

	<div class="row my-3 pt-5">
		<div class="col-10 offset-1 ">
			<div class="row offset-8">
		 	<form class="d-flex" role="search">
		        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
		        <button class="btn btn-outline-success" type="submit">Search</button>
		      </form>
>>>>>>> 49c4979d818baf55afd43c17f27473f4cb239620
			</div>
			
			<div class="row my-3">
				<div class="col-2 align-top">
					<a href="main">
						<img alt="" src="resources/img/logo.png" style="width: 110%">
					</a>
				</div>
				<div class="col d-flex justify-content-around" >
					<nav class="navbar navbar-expand-lg bg-body-tertiary  ">
					  <div class="container-fluid "> 		
						    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
						      <span class="navbar-toggler-icon"></span>
						    </button>
					    <div class="collapse navbar-collapse " id="navbarSupportedContent">
					      <ul class="navbar-nav me-auto mb-2 mb-lg-0 ">
					        <li class="nav-item me-5">
					          <a class="nav-link active" aria-current="page" href="festivalMap">축제 지도</a>
					        </li>
					      
					        <li class="nav-item dropdown me-5">
					          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					           	축제
					          </a>
					          
					          
					          <ul class="dropdown-menu">
					            <li><a class="dropdown-item" href="news">축제 기사</a></li>
					            <li><a class="dropdown-item" href="productList">축제 정보</a></li>
					            <li><a class="dropdown-item" href="gallery">갤러리</a></li>
					          </ul>
					        </li>
					        <li class="nav-item dropdown me-5">
					          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					            	이벤트
					          </a>
					          
					          <ul class="dropdown-menu">
					            <li><a class="dropdown-item" href="#">진행중 이벤트</a></li>
					            <li><a class="dropdown-item" href="#">종료된 이벤트</a></li>
					         	<li><a class="dropdown-item" href="#">당첨자</a></li>
					          </ul>
					         </li>
					        <li class="nav-item dropdown me-5">
					        	<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					            	고객센터
					          	</a>
					           
					          <ul class="dropdown-menu">
					            <li><a class="dropdown-item" href="noticeMain">공지 사항</a></li>
					            <li><a class="dropdown-item" href="inquiryWrite">문의 하기</a></li>
					           	<li><a class="dropdown-item" href="informationUseMain">이용  안내</a></li>
					          </ul>
					        </li>
					        
					        
							    <c:if test="${empty sessionScope.id}">
										<li class="nav-item ms-5">
								          <a href="login" class="row nav-link active" aria-current="page"><i class="bi bi-person-circle" style="font-size: 2em;"></i></a>
								        </li>
								</c:if>
								
								<c:if test="${not empty sessionScope.id}">
									<li class="nav-item dropdown ms-5">
										<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
						            		<i class="bi bi-person-lines-fill" style="font-size: 2em;"></i>
						          		</a>
						           
							          <ul class="dropdown-menu">
							            <li><a class="dropdown-item" href="#">마이페이지</a></li>
							            <li><a class="dropdown-item" href="#">문의 하기</a></li>
							           	<li><a class="dropdown-item" href="logout">로그아웃</a></li>
							          </ul>
							        </li>
								
								</c:if>
								<li class="nav-item ">
						          <a href="manageMain" class="row nav-link active" aria-current="page">관리자 페이지</a>
						        </li>
					     	</ul>
					    </div>
					  </div>
					</nav>
				</div>
			</div>	
		</div>
	</div>						