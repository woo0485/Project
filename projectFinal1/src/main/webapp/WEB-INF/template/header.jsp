<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
	a:link{text-decoration:none;}
	a:visited{text-decoration:none;}
	a:hover{ text-decoration:none;}
</style>

<div class="row my-3 pt-5">
		<div class="col-10 offset-1 ">
			<div class="row offset-8">
		 	<form class="d-flex" role="search" action="mainSearch">
		        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="searchWord">
		        <button class="btn btn-outline-dark" type="submit">Search</button>
		      </form>
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
					          <li><a class="dropdown-item" href="customerMain">고객 센터</a></li>
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
								
					        <c:if test="${sessionScope.userType == 'Member' }">
								
									<li class="nav-item dropdown ms-5">
										<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
						            		<i class="bi bi-person-lines-fill" style="font-size: 2em;"></i>
						          		</a>
						           
							          <ul class="dropdown-menu">
							            <li><a class="dropdown-item" href="myPageMain?id=${sessionScope.id}">마이페이지</a></li>
							           	<li><a class="dropdown-item" href="#">장바구니</a></li>
							           	<li><a class="dropdown-item" href="logout">로그아웃</a></li>
							          </ul>
							        </li>
								
					        </c:if>
					        
							<c:if test="${sessionScope.userType =='Admin' }">	
							
								<li class="nav-item dropdown me-5">
						        	<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
						            	관리자
						          	</a>
						           
						          <ul class="dropdown-menu">
						         	 <li><a class="dropdown-item" href="manageMain">관리자 페이지</a></li>
						            <li><a class="dropdown-item" href="logout">로그아웃</a></li>
						            <li><a class="dropdown-item" href="adminUser">관리자 추가</a></li>
						           
						          </ul>
						        </li>
							
						     </c:if>  
						      
					     	</ul>
					    </div>
					  </div>
					</nav>
				</div>
			</div>	
		</div>
	</div>						