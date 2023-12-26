<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="resources/css/donggyun.css" rel="stylesheet">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
.table {
  border-collapse: collapse;
  border-top: 3px solid #168;
}  
.table th {
  color: #168;
  background: #f0f6f9;
  text-align: center;
  font-size: small;
}
.table th, .table td {
  padding: 10px;
  border: 1px solid #ddd;
}
.table th:first-child, .table td:first-child {
  border-left: 0;
}
.table th:last-child, .table td:last-child {
  border-right: 0;
}
.table tr td:first-child{
  text-align: center;
}
.table caption{caption-side: bottom; display: none;
}

td input:focus {
  outline: none;
}


</style>    
 


<div class="row">
	<div class="col">
	
		<div class="row">
			<div class="col-4">
				<jsp:include page="/WEB-INF/views/manage/manageSide.jsp"/>
			</div>
			
			<div class="col-8 text-start mt-5">
				<span class="font-bold p-4"><h3>예약 수정</h3></span>		
						
				<form id="checkForm" action="updateManageReservationProcess" name="manageReservationUpdateForm" id="manageReservationUpdateForm" method="post">
							<div class="row">
								<div class="col-8 text-start">
																
									<table class="table table-hover">
										<tr class="">
											<td>
												<div class="pt-2">예약 번호</div>
											</td>
											<td>
												<div>
													<input type="text" class="form-control" name="reservationno" id="reservationno" placeholder="예약 번호" value="${reservation.reservationno }"
												style="border-width: 0;">
												</div>
											</td>
										</tr>
										<tr class="">
											<td>
												<div class="pt-2">예약자 아이디</div>
											</td>
											<td>
												<div>
													<input type="text" class="form-control" name="id" id="id" placeholder="아이디" value="${reservation.id }"
												style="border-width: 0;">
												</div>
											</td>
										</tr>
										<tr class="">
											<td>
												<div class="pt-2">상품 번호</div>
											</td>
											<td>
												<div>
													<input type="text" class="form-control" name="productno" id="productno" placeholder="상품 번호" value="${reservation.productno }"
												style="border-width: 0;">
												</div>
											</td>
										</tr>
										<tr class="">
											<td>
												<div class="pt-2">예약 금액</div>
											</td>
											<td>
												<div>
													<input type="text" class="form-control" name="reservationprice" id="reservationprice" placeholder="예약 금액" value="${reservation.reservationprice }"
												style="border-width: 0;">
												</div>
											</td>
										</tr>
										<tr class="">
											<td>
												<div class="pt-2">예약 티켓 수</div>
											</td>
											<td>
												<div>
													<input type="text" class="form-control" name="reservationticketcount" id="reservationticketcount" placeholder="티켓 수" value="${reservation.reservationticketcount }"
												style="border-width: 0;">
												</div>
											</td>
										</tr>
										<tr class="">
											<td>
												<div class="pt-2">예약 날짜</div>
											</td>
											<td>
												<div>
													<input type="text" class="form-control" name="reservationdate" id="reservationdate" placeholder="예약 날짜" value="${reservation.reservationdate }"
												style="border-width: 0;"> 
												</div>
											</td>
										</tr>
									</table>								

								<div class="row my-5">
									<div class="col-6 offset-3 text-center">
										<div class="row">
											<div class="col">
												<input type="submit" value="수정하기" class="btn-3 px-3">												
											</div>
											<div class="col">
												<input type="button" value="뒤로가기" class="btn-3 px-3"
													onclick="javascript:history.back();">												
											</div>					
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>
			
		</div>
	</div>
</div>