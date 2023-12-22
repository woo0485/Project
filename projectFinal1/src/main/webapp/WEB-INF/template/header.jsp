<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
ul {
	list-style: none;
	padding-left: 0px;
}
</style>

<div class="row">
	
	
	<div class="col text-end ">
		<a href="login">로그인</a>
		<a href="memberJoin">회원 가입</a>
	</div>

</div>

<div class="col p-5">
	<div class="container row" id="categoryBar">
		<table>
			<thead>
				<tr class="test-bottom">
					<th class=""><a href="main" class="col"> <img alt=""
							src="resources/img/logo.png" style="width: 200px;">
					</a></th>
					<th class="col">축제 지도</th>
					<th class="col">축제</th>
					<th class="col">이벤트</th>
					<th class="col">고객센터</th>
					<th class="col">관리 페이지</th>

				</tr>
			</thead>
			<tbody hidden="" id="categoryBarDetail" class="bg-light">
				<tr>
					<td></td>
					<td></td>
					<td>
						<ul class="">
							<li class=""><a class="" href="#">축제 기사</a></li>
							<li class=""><a class="" href="productList">축제 정보</a></li>
							<li class=""><a class="" href="#">갤러리</a></li>
						</ul>
					</td>
					<td>
						<ul class="">
							<li class=""><a class="" href="#">진행중 이벤트</a></li>
							<li class=""><a class="" href="#">종료된 이벤트</a></li>
							<li class=""><a class="" href="#">당첨자</a></li>
						</ul>
					</td>
					<td>

						<ul class="">
							<li class=""><a class="" href="#">공지 사항</a></li>
							<li class=""><a class="" href="#">상품 문의</a></li>
							<li class=""><a class="" href="#">1:1 문의</a></li>
						</ul>
					</td>
					<td></td>
				</tr>

			</tbody>
		</table>
	</div>
</div>
