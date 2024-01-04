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
				<form action="updateManageMemberProcess"
					name="manageMemberUpdateForm" id="manageMemberUpdateForm"
					method="post">
					<div class="row">
						<div class="col-6 text-start" style="font-size:small;">

							<table class="table table-hover">
								<tr class="">
									<td>
										<div class="pt-2">이름</div>
									</td>
									<td>
										<div>
											<input type="text" class="form-control" name="name" id="name"
												placeholder="이름" value="${member.name }"
												style="border-width: 0;" readonly="readonly">
										</div>
									</td>
								</tr>
								<tr class="">
									<td>
										<div class="pt-2">아이디</div>
									</td>
									<td>
										<div>
											<input type="text" class="form-control" name="id" id="id"
												placeholder="아이디" value="${member.id }"
												style="border-width: 0;" readonly="readonly">
										</div>
									</td>
								</tr>
								<tr class="">
									<td>
										<div class="pt-2">이메일</div>
									</td>
									<td>
										<div>
											<input type="text" class="form-control" name="email" id=""
												email"" placeholder="이메일" value="${member.email }"
												style="border-width: 0;">
										</div>
									</td>
								</tr>
								<tr class="">
									<td>
										<div class="pt-2">핸드폰 번호</div>
									</td>
									<td>
										<div>
											<input type="text" class="form-control" name="phonenumber"
												id="phonenumber" placeholder="핸드폰 번호"
												value="${member.phonenumber }" style="border-width: 0;">
										</div>
									</td>
								</tr>
								<tr class="">
									<td>
										<div class="pt-2">누적구매금액</div>
									</td>
									<td>
										<div>
											<input type="text" class="form-control" name="totalpay"
												id="totalpay" placeholder="누적구매금액"
												value="${member.totalpay }원" style="border-width: 0;">
										</div>
									</td>
								</tr>
								<tr class="">
									<td>
										<div class="pt-2">등급</div>
									</td>
									<td>
										<div>
											<select class="form-select" name="grade"
												style="border-width: 0;">
												<option ${member.grade == '1' ? 'selected' : ''}>BLACK</option>
												<option ${member.grade == '2' ? 'selected' : ''}>SILVER</option>
												<option ${member.grade == '3' ? 'selected' : ''}>GOLD</option>
												<option ${member.grade == '4' ? 'selected' : ''}>VIP</option>
											</select>
										</div>
									</td>
								</tr>
								<tr class="">
									<td>
										<div class="pt-2">생성일</div>
									</td>
									<td>
										<div>
											<input type="text" class="form-control" name="joindate"
												id="joindate" placeholder="생성일"
												value="${member.joindate }" style="border-width: 0;">
										</div>
									</td>
								</tr>
								<tr class="">
									<td>
										<div class="pt-2">우편 번호</div>
									</td>
									<td>
										<div>
											<input type="text" class="form-control" name="zipcode"
												id="zipcode" placeholder="우편 번호"
												value="${member.zipcode }" style="border-width: 0;">
										</div>
									</td>
								</tr>
								<tr class="">
									<td>
										<div class="pt-2">주소</div>
									</td>
									<td>
										<div>
											<input type="text" class="form-control" name="address1"
												id="address1" placeholder="주소"
												value="${member.address1 }" style="border-width: 0;">
										</div>
									</td>
								</tr>
								<tr class="">
									<td>
										<div class="pt-2">상세 주소</div>
									</td>
									<td>
										<div>
											<input type="text" class="form-control" name="address2"
												id="address2" placeholder="상세 주소"
												value="${member.address2 }" style="border-width: 0;">
										</div>
									</td>
								</tr>
							</table>
						</div>
					</div>

					<div class="row my-5">
						<div class="col-6 text-center">
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
					
					</form>				
					</div>
				</div>
			</div>
		</div>

