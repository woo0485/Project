<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div class="row">
	<div class="col-10 offset-1">
		<form action="adminUserAdd" method="post">
			<div class="row">
				<div class="col"><p>관리자 이름:</p></div>
				<div class="col">
					<input type="text" name=adminname >
				</div>
				<div class="col"><p> 관리자 아이디:</p></div>
				<div class="col">
				  	<input type="text" name=adminid >
				</div>
				<div class="col"><p>관리자 비밀번호:</p></div>
				<div class="col">
					<input type="password" name=adminpassword> 
				</div>
				<div class="col"><button>등록</button></div>
			</div>
		</form>
		<div class="row">
			<div class="col">
			<c:forEach var="adminList" items="${adminList}">
				<div class="row">
					<div class="col"><p>관리자 이름:</p></div>
					<div class="col">
						<input type="text" name=adminname value="${adminList.adminname}">
					</div>
					<div class="col"><p> 관리자 아이디:</p></div>
					<div class="col">
					  	<input type="text" name=adminid value="${adminList.adminid}">
					</div>
				</div>
			</c:forEach>
			</div>
		</div>
		
	</div>
</div>