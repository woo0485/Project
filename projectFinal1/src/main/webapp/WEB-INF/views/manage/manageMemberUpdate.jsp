<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="resources/js/donggyun.js"></script>     

	<!-- Content -->
	<div class="row">
		<div class="col">
		
			<div class="row">
				<div class="col-4">
					<jsp:include page="/WEB-INF/views/manage/manageSide.jsp"/>
				</div>
				
				<div class="col-8 text-start mt-5">
					<span class="font-bold p-4"><h3>회원 수정</h3></span>		
					
						<form id="checkForm" action="updateManageMemberProcess" name="manageMemberUpdateForm" id="manageMemberUpdateForm" method="post">
							<div class="row">
								<div class="col-8 offset-2">
															
									<div class="row">
										<div class="col-8">
											<input type="text" class="form-control" name="id" id="id" placeholder="아이디" value="${member.id }">
										</div>
										
										<div class="row">
											<div class="col-8">
												<input type="text" class="form-control" name="name" id="name" placeholder="이름" value="${member.name }">
											</div>					
										</div>
										
										<div class="row">
											<div class="col-8">
												<input type="text" class="form-control" name="phonenumber" id="phonenumber" placeholder="전화번호"
												value="${member.phonenumber }">
											</div>					
										</div>
										
										<div class="row">
											<div class="col">							
												<div class="row">
													<div class="col-8">
														<input type="text" class="form-control" name="email" id="email" placeholder="이메일"
														value="${member.email }">
													</div> 
			
												</div>						
											</div>					
										</div>	
										
										<div class="row">
											<div class="col-5">
												<input type="text" class="form-control" name="totalpay" id="totalpay" placeholder="누적구매금액"
												value="${member.totalpay}">
											</div>					
										</div>
										
										<div class="row">
											<div class="col-5">
												
												<select class="form-select" name="grade">
													<option ${member.grade == 'SILVER' ? 'selected' : ''} >SILVER</option>
													<option ${member.grade == 'GOLD' ? 'selected' : ''} >GOLD</option>
													<option ${member.grade == 'DIA' ? 'selected' : ''} >DIA</option>
												</select>
												
											</div>					
										</div>
																		
			
									</div>
								</div>					
							</div>
									
						
						<div class="row my-5">
							<div class="col-6 offset-2 text-center">
								<div class="row">
									<div class="col">
										<input type="submit" value="수정하기" class="btn btn-outline-secondary">												
									</div>
									<div class="col">
										<input type="button" value="뒤로가기" class="btn btn-outline-secondary"
											onclick="javascript:history.back();">												
									</div>					
								</div>
							</div>
						</div>
					</form>
							
					<div class="row my-3">
						<div class="col-10 border-top pt-3 text-end">
						</div>
					</div>	
							
												
				</div>	
			</div>			
		</div>			
	</div>		