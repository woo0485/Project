<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<!-- Content -->
<div class="row">
	<div class="col">

		<div class="row">
			<div class="col-4">
				<jsp:include page="/WEB-INF/views/manage/manageSide.jsp" />
			</div>

			<div class="col-8 text-start mt-5">
				<span class="font-bold p-4"><h3>회원 수정</h3></span>
				<form action="updateManageMemberProcess" name="manageMemberUpdateForm" id="manageMemberUpdateForm" method="post">
					<div class="row">
						<div class="col-6 text-start" style="font-size:small;">

							<table class="table table-hover">
								<tr class="">
									<td>
										<div class="py-1">이름</div>
									</td>
									<td>
										<div class="text-start fs-6 py-1">
											${member.name }
										</div>
									</td>
								</tr>
								<tr class="">
									<td>
										<div class="py-1">아이디</div>
									</td>
									<td>
										<div class="text-start fs-6 py-1">
											${member.id }
										</div>
									</td>
								</tr>
								<tr class="">
									<td>
										<div class="py-1">이메일</div>
									</td>
									<td>
										<div class="text-start fs-6 py-1">
											${member.email }
										</div>
									</td>
								</tr>
								<tr class="">
									<td>
										<div class="py-1">핸드폰 번호</div>
									</td>
									<td>
										<div class="text-start fs-6 py-1">
											${member.phonenumber }
										</div>
									</td>
								</tr>
								<tr class="">
									<td>
										<div class="py-1">누적구매금액</div>
									</td>
									<td>
										<div class="text-start fs-6 py-1">
											${member.totalpay }원
										</div>
									</td>
								</tr>
								<tr class="">
									<td>
										<div class="py-1">회원 등급</div>
									</td>
									<td>
										<div class="text-start fs-6 py-1">
											<c:if test="${member.grade == 0}">일반</c:if>
											<c:if test="${member.grade == 1}">BLACK</c:if>
											<c:if test="${member.grade == 2}">SILVER</c:if>
											<c:if test="${member.grade == 3}">GOLD</c:if>
											<c:if test="${member.grade == 4}">VIP</c:if>
										</div>
									</td>
								</tr>
								<tr class="">
									<td>
										<div class="py-1">생성일</div>
									</td>
									<td>
										<div class="text-start fs-6 py-1">
											${member.joindate }
										</div>
									</td>
								</tr>
								<tr class="">
									<td>
										<div class="py-1">우편 번호</div>
									</td>
									<td>
										<div class="text-start fs-6 py-1">
											${member.zipcode }
										</div>
									</td>
								</tr>
								<tr class="">
									<td>
										<div class="py-1">주소</div>
									</td>
									<td>
										<div class="text-start fs-6 py-1">
											${member.address1 }
										</div>
									</td>
								</tr>
								<tr class="">
									<td>
										<div class="py-1">상세 주소</div>
									</td>
									<td>
										<div class="text-start fs-6 py-1">
											${member.address2 }
										</div>
									</td>
								</tr>
							</table>
						</div>
					</div>

					<div class="row my-3">
						<div class="col-6 text-start">							
							<div class="col my-4 ms-2">
								<input class="custom-btn btn-3 px-4" type="button" value="목록" style="font-size:small;" onclick="history.back();"/>
							</div>							
						</div>
					</div>
					
					</form>				
					</div>
				</div>
			</div>
		</div>

