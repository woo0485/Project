<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="resources/css/donggyun.css" rel="stylesheet">
<style type="text/css">
div table tbody td {
	max-width: 250px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}
.font {
	font-size: small;
	color: #999999;
}

.fontblack{
	color: #333333;
}
.dateFont {
	font-size: small;
	color: #999999;
	
}
</style>
    



<div class="row">
	<div class="col">
	
		<div class="row">
			<div class="col-3">
				<jsp:include page="/WEB-INF/views/manage/customer/customerSide.jsp"/>
			</div>
			
			<div class="col-9 text-start mt-5">
				<div class="row" id="global-content">
					<div class="col-10  text-start border-2 border-dark border-bottom pb-3">
						<span class="fw-bold fs-2">고객센터</span>
					</div>					
				</div>	
					
			<div class="row">
				<div class="col-10 text-start my-3 border-1 border-dark border-bottom pb-3">
					<span class="font text-secondary"><i class="bi bi-exclamation-triangle"></i>
					어려움이나 궁금한 점이 있으신가요?</span>
				</div>
			</div>
			
			<div class="row my-5 offset-1">				
				<div class="col-3 border-end text-center">
					<div><a href="inquiryWrite"><img src="resources/img/inquiryImg.JPG"></a></div>
					<div><a href="inquiryWrite" class="text-decoration-none fontblack"><span class="fw-bold">문의하기</span></a></div>
				</div>
				<div class="col-3 border-end text-center">
					<div><a href="informationUseDetail?informationUseNo=1&pageNum=1"><img src="resources/img/CouponImg.JPG"></a></div>
					<div><a href="informationUseDetail?informationUseNo=1&pageNum=1" class="text-decoration-none fontblack"><span class="fw-bold">쿠폰안내</span></a></div>
				</div>
				<div class="col-3 text-center">
					<div><a href="informationUseDetail?informationUseNo=2&pageNum=1"><img src="resources/img/GradeImg.JPG"></a></div>
					<div><a href="informationUseDetail?informationUseNo=2&pageNum=1" class="text-decoration-none fontblack"><span class="fw-bold">등급안내</span></a></div>
				</div>
				
			</div>
					
					
			<div class="row my-5">
				<div class="col-4 ">
						<table class="table">
						<thead>
							<tr>
								<th class="py-2 border-2 border-dark border-bottom"><h4>공지사항</h4></th>
								<th class="py-2 text-end border-2 border-dark border-bottom"><h4><a href="noticeMain" class="fontblack">
								<i class="bi bi-plus-lg"></i></a></h4></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="n" items="${nList2}">
								<tr class="text-start">									
									<td class="text-start fw-bold py-3"><a
										href="noticeDetail?noticeNo=${n.noticeNo}&pageNum=${currentPage}"
										class="text-decoration-none fontblack py-3">${ n.noticeTitle }</a></td>
									<td class="text-end py-3"><span class="dateFont">${n.noticeUploadDate}</span></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
					
					
				<div class="col-4 offset-1">
					<table class="table">
						<thead>
							<tr>
								<th class="py-2 border-2 border-dark border-bottom"><h4>이용 안내</h4></th>
								<th class="py-2 text-end border-2 border-dark border-bottom"><h4><a href="informationUseMain" class="fontblack">
								<i class="bi bi-plus-lg"></i></a></h4></th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="i" items="${iList2}">
							<tr class="text-start">
								<tr class="text-start">									
									<td class="text-start fw-bold py-3"><a
										href="informationUseDetail?informationUseNo=${i.informationUseNo}&pageNum=${currentPage}"
										class="text-decoration-none fontblack py-3">${i.informationUseTitle }</a></td>
									<td class="text-end py-3"><span class="dateFont">${i.informationUseDate}</span></td>
								</tr>
							</tr>
						</c:forEach>
					</tbody>
					</table>
				</div>						
			</div>
			
			<div class="row">
				<div class="col-10 text-center">		
					<div class="row ps-5">
						<div class="col">
							<span class="fs-4">
								<i class="bi bi-chat-left-text fs-2 font pe-2 text-success text-opacity-50"></i>GALAGO톡<br>채팅상담서비스
							</span>
						</div>
						<div class="col">
							<span class="fs-4">
								<i class="bi bi-telephone-fill fs-3 font pe-2 text-success text-opacity-50"></i>고객센터<br>전화상담서비스
							</span>
						</div>
					</div>
				</div>		
			</div>	
			
			<div class="row">
				<div class="col-10 text-center mt-3 mb-5">						
					<div class="row ps-5">
					
						<div class="col ">
							<div class="">
								<span class="font ps-1">전화상담 가능시간은</span><br>
								<span class="font ps-1">평일(월~금) 9:00~18:00</span><br>
								<span class="fs-4 ps-1">1234-5678</span><br>
							</div>
						</div>
						
						<div class="col">
							<div class="">
								<span class="font ps-1">채팅상담 가능시간은</span><br>
								<span class="font ps-1">평일(월~금) 9:00~18:00</span><br>
								<span class="font ps-1">주말 및 공휴일 휴무</span><br>
								<span class="font ps-1"><input type="button" class="btn-3 px-5 py-0 my-2" id="chatBtn" value="채팅 시작"></span>
							</div>
						</div>
											
					</div>
				</div>
			</div>
			
			
			</div>								
		</div>
	</div>
</div>