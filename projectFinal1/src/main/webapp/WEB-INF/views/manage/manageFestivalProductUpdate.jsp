<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="resources/css/donggyun.css" rel="stylesheet">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

.table tr td:first-child {
	text-align: center;
}

.table caption {
	caption-side: bottom;
	display: none;
}

td input:focus {
	outline: none;
}
</style>



<div class="row">
	<div class="col">

		<div class="row">
			<div class="col-4">
				<jsp:include page="/WEB-INF/views/manage/manageSide.jsp" />
			</div>

			<div class="col-8 text-start mt-5">
				<span class="font-bold p-4"><h3>상품 수정</h3></span>

				<form id="checkForm" action="manageFestivalProductUpdateProcess"
					name="manageFestivalProductUpdateForm" id="manageFestivalProductUpdateForm"
					method="post">
					<div class="row">
						<div class="col-8 text-start">

							<table class="table table-hover" style="font-size:small;">
								<tr>
									<td>
										<div class="pt-2">상품명</div>
									</td>
									<td>
										<div>
											<input type="text" class="form-control" name="productname"
												id="productname" placeholder="상품명"
												value="${FestivalProduct.productname }"
												style="border-width: 0;" readonly="readonly">
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="pt-2">상품 가격</div>
									</td>
									<td>
										<div>
											<input type="text" class="form-control" name="productprice"
												id="productprice" placeholder="상품 가격"
												value="${FestivalProduct.productprice }"
												style="border-width: 0;" readonly="readonly">
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="pt-2">위치</div>
									</td>
									<td>
										<div>
											<input type="text" class="form-control" name="productlocation"
												id="productlocation" placeholder="위치"
												value="${FestivalProduct.productlocation }"
												style="border-width: 0;" readonly="readonly">
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="pt-2">시작 하는 날</div>
									</td>
									<td>
										<div>
											<input type="text" class="form-control" name="productopendate"
												id="productopendate" placeholder="시작 하는 날"
												value="${FestivalProduct.productopendate }"
												style="border-width: 0;" readonly="readonly">
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="pt-2">끝나는 날</div>
									</td>
									<td>
										<div>
											<input type="text" class="form-control" name="productclosedate"
												id="productclosedate" placeholder="끝나는 날"
												value="${FestivalProduct.productclosedate }"
												style="border-width: 0;" readonly="readonly">
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="pt-2">즐겨찾기 수</div>
									</td>
									<td>
										<div>
											<input type="text" class="form-control" name="productbookmarkcount"
												id="productbookmarkcount" placeholder="즐겨찾기 수"
												value="${FestivalProduct.productbookmarkcount }"
												style="border-width: 0;" readonly="readonly" readonly="readonly">
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="pt-2">조회 수</div>
									</td>
									<td>
										<div>
											<input type="text" class="form-control" name="productreadcount"
												id="productreadcount" placeholder="조회 수"
												value="${FestivalProduct.productreadcount }"
												style="border-width: 0;" readonly="readonly">
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="pt-2">티켓 수</div>
									</td>
									<td>
										<div>
											<input type="text" class="form-control" name="productticketcount"
												id="productticketcount" placeholder="티켓 수"
												value="${FestivalProduct.productticketcount }"
												style="border-width: 0;">
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="pt-2">남은 티켓 수</div>
									</td>
									<td>
										<div>
											<input type="text" class="form-control" name="productremainticketcount"
												id="productremainticketcount" placeholder="남은 티켓 수"
												value="${FestivalProduct.productremainticketcount }"
												style="border-width: 0;">
										</div>
									</td>
								</tr>
		
							</table>
						</div>
					</div>


					<div class="row my-3">
						<div class="col-8 text-center">
							<div class="row">
								<div class="col text-end">
									<input type="submit" value="수정하기" class="btn-3 px-3">
								</div>
								<div class="col text-start">
									<input type="button" value="뒤로가기" class="btn-3 px-3"
										onclick="javascript:history.back();">
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-8 border-top py-3 text-end mt-4">
							<input type="hidden" name="productno" value="${FestivalProduct.productno }">							
							<button type="button" class="btn btn-outline-danger py-1" id="ManageProductDelete">상품 삭제</button>
						</div>
					</div>
				</form>

			</div>
		</div>
	</div>
</div>