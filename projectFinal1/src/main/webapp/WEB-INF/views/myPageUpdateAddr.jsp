<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
			<div class="row col-auto">
			 		<jsp:include page="/WEB-INF/views/myPageHeader.jsp"></jsp:include>
			</div>
			
			
			<div class="row mt-5">
						<div class="col-2 offset-md-1 form-label"><p>우편번호 *</p></div>
							
						<div class="col-5 border-bottom">
							<input type="text" class="form-control border-0" name="zipcode"
									id="zipcode" maxlength="5" readonly data-code="false" style="height: 50px;" >
						</div>
						<div class="col-4">
							<input type="button" class="btn btn btn-outline-dark" id="btnZipcode" 
									onclick="findAddr()" value="우편번호 찾기">
						</div>
					</div>
					
					<div class="row my-3">
						<div class="col-2 offset-md-1 form-label"><p>자택주소 *</p></div>
						<div class="col-7 border-bottom">
							<input type="text" class="form-control border-0"  name="address1" id="address1"
							 readonly>
						</div>
					</div>
					<div class="row my-4 ">
						<div class="col-2 offset-md-1 form-label"><p>상세주소  </p></div>
						<div class="col-7 border-bottom">
							<input type="text" class="form-control border-0" name="address2" id="address2">
						</div>
					</div>
</body>
</html>