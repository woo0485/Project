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
<input type="text" name="id" id="rId43543036" value="${sessionScope.id}"> <br>
<input type="hidden" value="${priceOrder.size()}" id="priceOrderLength">
<c:forEach var="b" items="${priceOrder}"  varStatus="status">
		<input type="text" name="basketno"  id="basketno4"  value="${b.basketno}">  <br>
		 <input type="text" class="basNo" name="productno" id="productno04" value="${b.basketProductNo}">  <br>
		 <input class="basCount" type="text" name="basketProductCount"  id="basketProductCount04" value="${b.basketProductCount}"> <br>
		 <input type="text" name="productprice"  id="productprice04" class="prods"  value="${b.productPrice}"> <br>
		 <input type="text"  class="proname" name="productname"  id="productname04"  value="${b.productName}"> <br>
</c:forEach>

<c:forEach var="bb" items="${basketList}" >
    	장바구니 productno를 배열로 받았을 때; <input type="text" name="productno" id="productno453423445345" value="${bb.basketProductNo}"> <br>
   		장바구니의 productno의 개수: <input type="text" name="basketproductcount" id="basketproductcount564234234235645" value="${bb.basketProductCount}"><br>
   		 장바구니의 productno의 가격: <input type="text" name="productprice" id="productprice324423423423324" value="${bb.productPrice}"><br>
</c:forEach>


<script>
let totalResult = 0;
$(".prods").each(function(index) {
    let prodsValue = parseFloat($(this).val()) || 0; // prods의 값
    let basCountValue = parseFloat($(".basCount").eq(index).val()) || 0; // basCount의 값
    
    // prods와 basCount를 곱하여 결과를 더함
    let result = prodsValue * basCountValue;
    
    totalResult += result;
    console.log("Index: " + index + ", prodsValue: " + prodsValue + ", basCountValue: " + basCountValue + ", 결과: " + result);
});
console.log("prods와 basCount를 곱한 값의 총 합: " + totalResult);

var totalName = "";

$(".proname").each(function() {
    var pronameValue = $(this).val() || ""; // proname의 값
    totalName += pronameValue;
});

console.log("proname 값의 총 합: " + totalName);
/////////////////// reservation 테이블에 insert 하는 데이터들 ///////////////////////////////

 let productno = document.getElementById("productno04").value;
 let basketproductcount = document.getElementById("basketProductCount04").value;
 let productprice = document.getElementById("productprice04").value;
 let id = document.getElementById("rId43543036").value;

 console.log("productno04:", productno);
 console.log("basketProductCount04:", basketproductcount);

//###############################################################################
  //실제 복사하여 사용시에는 모든 주석을 지운 후 사용하세요
  BootPay.request({
      price: totalResult , //실제 결제되는 가격
 	
      // 관리자로그인 -> 결제설치 -> 인증키 및 보안 -> WEB Application ID
      application_id: "6577e3b8e57a7e001a59ffc9",
 	
      name: totalName , //결제창에서 보여질 이름
      pg: 'nicepay',
      method: 'card', //결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작합니다.
      show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
      items: [
          {
              item_name: "김민수", 
           	  qty: 0, //수량
              unique: 'productNo', //해당 상품을 구분짓는 primary key
              price: totalResult , // 결재가격
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
      data: '결제창이 닫힙니다..';
/////////@@@@@@@@@ 결제가 완료되면 ajax로 insert할 것  @@@@@@@@@@@////////////////////////
      $.ajax({
          url: 'insertReservation',  // 적절한 URL로 변경하세요.
          type: 'POST',
          // json 방식으로 전달하기 위함
       //   contentType: 'application/json',
       	 data: {
        	 //data: JSON.stringify({
              "id": id   ,  // order_id에 대한 데이터를 서버로 전송하세요.
              "productno": productno  ,
              "reservationticketcount":  basketproductcount ,
              "reservationprice" :  0
              // 여기에 필요한 다른 데이터도 추가하세요.
          },
          success: function (response) {
              // Insert 성공 시에 priceRedirect로 보낸 후 priceOrderFinish.jsp로 이동
              window.location.href = 'reservationSucess?id=' +id + '&productno=' + productno;
          },
          error: function (error) {
              console.error('Insert 실패', error);
          }
 ////////////////@@@@@@@@@@@@@@@@@@@@@@@@@@@@////////////////////////
  }).done(function (data) {
      //결제가 정상적으로 완료되면 수행됩니다
      //비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하시길 추천합니다.
      console.log(data);
      data: '결제가 정상적으로 완료되었습니다.';
 /////////////////// 결제가 완료되면 ajax로 insert할 것  ////////////////////////////////////////////////////////////////////
 
     ////////////////////////////////////////////////////////////////////////////////////////////////////////////
      });
  });
</script>

</body>
</html>
