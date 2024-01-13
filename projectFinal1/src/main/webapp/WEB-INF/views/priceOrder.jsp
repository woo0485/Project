<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 결제 창 </title>
</head>
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.3.1.min.js" type="application/javascript"></script>
<link href="resources/css/hyunju.css" rel="stylesheet" >
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="resources/js/hyunju.js"></script>
<body>
<input type="hidden" name="id" id="rId43543036" value="${sessionScope.id}"> <br>
<input type="text" value="${basketList.size()}" id="basketListSize">
<c:forEach var="b" items="${basketList}" varStatus="status">
    <input type="text" name="productNo" value="${b.productNo}" data-productno="${b.productNo }"  id="productno">  <br>
    <input type="text"  value=" ${basketTotalPrice}"  id ="dsf34">
    <input type="text" name="totalPrice" value="${b.totalPrice}" data-totalprice="${b.totalPrice}" id="totalprice"  class="totalprice">  <br>
    <input type="text" name="basketProductCount" value="${b.basketProductCount}" data-basketproductcount="${b.basketProductCount }" 
    id="basketproductcount" class="basketproductcount">  <br>
</c:forEach>

<script>
////////////// 여기서부터는 hj가 추가한 것 ////////////////////////////////////////////////////
/*
 let id = $("#rId43543036").val();
 const productNo =  $(this).data("productno");  
 const basketProductCount =  $(this).data("basketproductcount");  
 const totalPrice = $(this).data("totalprice");  
*/
let productNo = document.getElementById("productno").value;
let id = document.getElementById("rId43543036").value;
let totalPrice = document.getElementById("dsf34").value;
let basketProductCount = document.getElementById("basketproductcount").value;

//###############################################################################
  //실제 복사하여 사용시에는 모든 주석을 지운 후 사용하세요
  BootPay.request({
      price: totalPrice , //실제 결제되는 가격 => 뷰에서 보여줘야하니까 일단 설정해줌
 	
      // 관리자로그인 -> 결제설치 -> 인증키 및 보안 -> WEB Application ID
      application_id: "6577e3b8e57a7e001a59ffc9",
 	
      name: '결제되는 상품 이름'  , //결제창에서 보여질 이름 @@@@@ 이거 수정하애함 @@@@@@
      pg: 'nicepay',
      method: 'card', //결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작합니다.
      show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
      items: [
          {
              item_name: "김민수", 
           	  qty: 0, //수량
              unique: 'productNo', //해당 상품을 구분짓는 primary key
              price: totalPrice , // 결재가격
          }
      ],
      order_id: 'memberId', //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
      // 고유번호는 그냥 id + 날짜 시간에서 같이 합쳐서 쓰면된다고 함
      
  }).error(function (data) {
      //결제 진행시 에러가 발생하면 수행됩니다.
      console.log(data);
      data: '결제 진행시 에러가 발생하였습니다.';
  }).cancel(function (data) {
      //결제가 취소되면 수행됩니다.
      console.log(data);
      data: '결제가 취소되었습니다..';
  }).close(function (data) {
      // 결제창이 닫힐때 수행됩니다. (성공,실패,취소에 상관없이 모두 수행됨)
      console.log(data);
 
      $.ajax({
          url: 'insertReservation',  // 적절한 URL로 변경하세요.
          type: 'POST',
         
       	 data: {
              "id": id   ,  // order_id에 대한 데이터를 서버로 전송하세요.
              "productNo": productNo  ,
        //      "baksetProductCount":  baksetProductCount ,
         //     "reservationprice" :  0 
           
          },
          success: function (response) {
              // Insert 성공 시에 priceRedirect로 보낸 후 priceOrderFinish.jsp로 이동
        	  window.location.href = 'reservationSucess?id=' +id + '&productNo=' + productNo;
          },
          error: function (error) {
              console.error('Insert 실패', error);
          }
      });
     
  }).done(function (data) {
      //결제가 정상적으로 완료되면 수행됩니다
      //비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하시길 추천합니다.
      console.log(data);
      data: '결제가 정상적으로 완료되었습니다.';
 
      });
 
</script>

</body>
</html>
