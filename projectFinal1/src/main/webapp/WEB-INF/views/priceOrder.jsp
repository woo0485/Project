<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<link href="resources/css/side.css" rel="stylesheet" >

<script src="https://cdn.bootpay.co.kr/js/bootpay-3.3.1.min.js" type="application/javascript"></script>
<script>
  //실제 복사하여 사용시에는 모든 주석을 지운 후 사용하세요
  BootPay.request({
      price: '100', //실제 결제되는 가격
 
      // 관리자로그인 -> 결제설치 -> 인증키 및 보안 -> WEB Application ID
      application_id: "6577e3b8e57a7e001a59ffc9",
 
      name: '블링블링 마스카라', //결제창에서 보여질 이름
      pg: 'nicepay',
      method: 'card', //결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작합니다.
      show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
      items: [
          {
              item_name: '나는 아이템', //상품명
              qty: 1, //수량
              unique: '123', //해당 상품을 구분짓는 primary key
              price: 100, //상품 단가
          }
      ],
      order_id: '고유order_id_1234', //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
  }).error(function (data) {
      //결제 진행시 에러가 발생하면 수행됩니다.
      console.log(data);
  }).cancel(function (data) {
      //결제가 취소되면 수행됩니다.
      console.log(data);
  }).close(function (data) {
      // 결제창이 닫힐때 수행됩니다. (성공,실패,취소에 상관없이 모두 수행됨)
      console.log(data);
  }).done(function (data) {
      //결제가 정상적으로 완료되면 수행됩니다
      //비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하시길 추천합니다.
      console.log(data);
  });
</script>

<!-- content 영역 -->
<div class="row my-5" id="global-content">		
	<div class="col">
		<div class="row">
			<div class="col-2 offset-1 font bg">		
				<div class="row">
					<div class="col text-center fw-bold">
						<div class="row">
							<div class="col border-bottom my-5 pb-4">
								<i class="bi bi-folder-check"></i>
								<span class="ps-3">관리자 페이지</span>
							</div>
						</div>										
						<div class="row pt-5">
							<div class="col-4 text-end">
								<i class="bi bi-graph-up-arrow"></i>
							</div>	
							<div class="col-8 text-start">						  	
							    <a class="nav-link active" href="#">매출 관리</a>
							</div>
						</div>
						<div class="row pt-5">
							<div class="col-4 text-end">
								<i class="bi bi-people"></i>
							</div>	
							<div class="col-8 text-start">						  	
							    <a class="nav-link active" href="#">회원 관리</a>
							</div>
						</div>
						<div class="row pt-5">
							<div class="col-4 text-end">
								<i class="bi bi-folder-check"></i>
							</div>	
							<div class="col-8 text-start">						  	
							    <a class="nav-link active" href="#">예약 관리</a>
							</div>
						</div>
						<div class="row pt-5">
							<div class="col-4 text-end">
								<i class="bi bi-balloon"></i>
							</div>	
							<div class="col-8 text-start">						  	
							    <a class="nav-link active" href="#">축제 관리</a>
							</div>
						</div>
						<div class="row pt-5">
							<div class="col-4 text-end">
								<i class="bi bi-basket"></i>
							</div>	
							<div class="col-8 text-start">						  	
							    <a class="nav-link active" href="#">이벤트 관리</a>
							</div>
						</div>
						<div class="row pt-5">
							<div class="col-4 text-end">
								<i class="bi bi-cart-check"></i>
							</div>	
							<div class="col-8 text-start">						  	
							    <a class="nav-link active" href="#">상품 문의</a>
							</div>
						</div>
						<div class="row pt-5">
							<div class="col-4 text-end">
								<i class="bi bi-chat-right-text"></i>
							</div>	
							<div class="col-8 text-start">						  	
							    <a class="nav-link active" href="#">1:1 문의</a>
							</div>
						</div>
						
						<div class="row">
							<div class="col border-top my-5 pt-4">
								<i class="bi bi-exclamation-circle"></i>
								<span class="ps-3">관리자님</span>
							</div>
						</div>
					</div>	
				</div>
			</div>
			

			
			<div class="col-8">
			2
			</div>
		</div>
	</div>
</div>
