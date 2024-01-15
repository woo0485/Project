///////////// 여기는 장바구니에서 수량 변경 및 삭제하기  ///////////////
$(function() {
   
   // 상품 상세 페이지에서 주문 가능 수량이 초과 되었을 때 알림
   $("#basketProductCount").on("blur", function(e) {
      let productCnt = Number($(this).val());
      let maxValue = Number($(this).attr("max")); 
      console.log("productCnt : " + productCnt + ", maxValue : " + maxValue);
      if(productCnt > maxValue) {
         alert(`주문 가능 수량을 초과하였습니다. - 주문 가능 수량 : ${maxValue}`);
         $(this).val(1);
      } 
   });
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////
   // 장바구니에서 변경을 클릭했을 때 - 장바구니의 수정 버튼은 동적으로 삭제되고 생성되기 때문에 Delegate 방식 이벤트를 적용함
   $(document).on("click", ".updateBasketProductNoCount", function(e) {

      const basketNo = $(this).data("basketno");
      const productNo = $(this).data("productno");
      const productOldCount = $(this).data("productcount");
      const productName = $(this).data("productname");
      const basketProductCount = $(this).parent().prev().find(".basketProductCount").val();
      
      console.log("basketNo : " + basketNo + ", productNo : " + productNo + ", basketProductCount : " + basketProductCount);
      console.log("productName : " + productName + ", productOldCount : " + productOldCount);
      
      if(productOldCount == basketProductCount) {
         alert(`"${productName}"의 변경할 수량을 입력해주세요`);         
         return false;
      }
      
      // 사용자에게 수정할 것인지 물어보고 진행 - 사용자가 취소 버튼을 선택하면 수량 변경을 멈춘다.  
      const result = confirm(`"${productName}"의\n수량을 ${productOldCount}개에서 ${basketProductCount}개로 변경하시겠습니까?`);
      if(!result) {
         // 상품 수량 변경이 취소되면 상품 수량을 이전 상태로 되돌린다.
         $(this).parent().prev().find(".basketProductCount").val(productOldCount);
         return false;
      }
      
      $.ajax({
         type: "POST",
            url: "updateDeleteForm",  // 서버의 매핑 주소
            data: {               
               "basketProductCount" : basketProductCount,
               "basketNo" : basketNo,
               "productNo": productNo
            },
            dataType: "JSON",
            success: function(res) {
            console.log(res);
            // 장바구니에서 상품 수량을 수정하고 화면을 다시 갱신한다.
            // 응답 데이터를 처리하는 함수 호출 - hyunju.js 파일 맨 아래에 함수가 정의되어 있음
                basketUpdateDelete(res, productName);                
            },
            error: function(xhr, error, msg) {
                console.error("장바구니에서 상품 수량 변경 에러 발생: " + error + ". " + msg);
            }
      });
   });
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////
   // 장바구니에서 삭제를 클릭했을 때 - 장바구니의 삭제 버튼은 동적으로 삭제되고 생성되기 때문에 Delegate 방식 이벤트를 적용함
   $(document).on("click", ".deleteBasketNo", function(e) {       

      const basketNo = $(this).data("basketno");
      const productName = $(this).data("productname");            
      console.log("basketNo : " + basketNo + ", productName : " + productName);
      
      // 사용자에게 삭제할 것인지 물어보고 진행 - 사용자가 취소 버튼을 선택하면 삭제하기를 멈춘다.
      const result = confirm(`"${productName}"을 장바구니에서 삭제하시겠습니까?`);
      if(!result) {
         return false;
      }
      
      $.ajax({
               type: "POST",
               url: "deleteBasketNo",  // 서버의 매핑 주소
               dataType: "JSON",
               data: {
                  "basketNo" : basketNo
               },
               success: function(res) {
               console.log( res);
               // 장바구니에서 상품을 삭제하고 화면을 다시 갱신한다.
               // 응답 데이터를 처리하는 함수 호출 - hyunju.js 파일 맨 아래에 함수가 정의되어 있음
                   basketUpdateDelete(res, productName);                   
               },
               error: function(xhr, error, msg) {
                   console.error("장바구니에서 상품 삭제시 에러 발생: " + error + ". " + msg);
               }
           });
    });

   /////////////////////////////////////////////////////////////////////////////////////////////////////////
   // 장바구니 비우기 버튼이 클릭되면 
   $("#deleteBasketAll").on("click", function(e) {
      
      // 사용자에게 삭제할 것인지 물어보고 진행 - 사용자가 취소 버튼을 선택하면 삭제하기를 멈춘다.
      const result = confirm(`장바구니를 비우시겠습니까?`);
      if(!result) {
         return false;
      }
      
      $.ajax({
               type: "POST",
               url: "deleteBasketAll",  // 서버의 매핑 주소    
               dataType: "JSON",           
               success: function(res) {
               console.log(res);
               // 장바구니 비우기를 완료하고 화면을 다시 갱신한다.
               if(res.result && res.basketList.basketList.length == 0) {
                  
                  let basketContent = 
                           `<table class="table table-hover" >
                              <thead class="table-secondary">
                                 <tr class="text-center row">
                                    <th class="col-6">상품명</th>
                                    <th class="col text-start ps-5">수량</th>
                                    <th class="col text-end">주문금액</th>
                                    <th class="col">선택</th>
                                 </tr>      
                              </thead>
                           </table>
                           <div class="row my-5">
                              <div class="col">                  
                                 <h3 class="col text-center fs-5 fw-bold">장바구니에 담긴 상품이 없습니다.</h3>                                       
                              </div>
                           </div>
                           <div class="row my-3">
                              <div class="col text-end">                  
                                 <input type="button" class="btn btn-outline-primary" value="계속 쇼핑하기" onclick="location.href='productList'">                                    
                              </div>
                           </div>`
                  
                  // 기존 내용을 비우고 빈 장바구니를 화면에 표시
                  $("#basketWrap").empty();
                  
                  // 장바구니에 담긴 상품이 없다고 표시
                  $("#basketWrap").append(basketContent);
                  
                  // 0.5초 후에 
                  setTimeout(function() {
                     alert(`${res.msg}`);   
                  }, 500);
               }
               },
               error: function(xhr, error, msg) {
                   console.error("장바구니에서 상품 삭제시 에러 발생: " + error + ". " + msg);
               }
           });
   });


   // 게시 글쓰기 폼 유효성 검사
   $("#writeForm").on("submit", function() {
      if($("#productname").val().length <= 0) {
         alert("제목이 입력되지 않았습니다.\n제목을 입력해주세요");
         $("#productname").focus();
         return false;
      }
      /*
      if($("#adminpassword").val().length <= 0) {
         alert("비밀번호가 입력되지 않았습니다.\n비밀번호를 입력해주세요");
         $("#adminpassword").focus();
         return false;
      }
      */
      if($("#productprice").val().length <= 0) {
         alert("가격이 입력되지 않았습니다.\n내용을 입력해주세요");
         $("#productprice").focus();
         return false;
      }
      if($("#productimage").val().length <= 0) {
         alert("사진이 입력되지 않았습니다.\n내용을 입력해주세요");
         $("#productimage").focus();
         return false;
      }
      if($("#productlocation").val().length <= 0) {
         alert("위치가 입력되지 않았습니다.\n내용을 입력해주세요");
         $("#productlocation").focus();
         return false;
      }
      if($("#productopendate").val().length <= 0) {
         alert("오픈일 입력되지 않았습니다.\n내용을 입력해주세요");
         $("#productopendate").focus();
         return false;
      }
      if($("#productclosedate").val().length <= 0) {
         alert("마감일 입력되지 않았습니다.\n내용을 입력해주세요");
         $("#productclosedate").focus();
         return false;
      }
      if($("#productticketcount").val().length <= 0) {
         alert("티켓 매수가 입력되지 않았습니다.\n내용을 입력해주세요");
         $("#productticketcount").focus();
         return false;
      }
      if($("#productremainticketcount").val().length <= 0) {
         alert("남은 티켓 매수가 입력되지 않았습니다.\n내용을 입력해주세요");
         $("#productremainticketcount").focus();
         return false;
      }
   });

   //////////////////////// 게시 글 수정 폼 유효성 검사
   $("#updateForm").on("submit", function() {
      if($("#productname").val().length <= 0) {
         alert("제목이 입력되지 않았습니다.\n제목을 입력해주세요");
         $("#productname").focus();
         return false;
      }
      if($("#productprice").val().length <= 0) {
         alert("가격이 입력되지 않았습니다.\n내용을 입력해주세요");
         $("#productprice").focus();
         return false;
      }
      if($("#productlocation").val().length <= 0) {
         alert("위치가 입력되지 않았습니다.\n내용을 입력해주세요");
         $("#productlocation").focus();
         return false;
      }
      if($("#productopendate").val().length <= 0) {
         alert("오픈일 입력되지 않았습니다.\n내용을 입력해주세요");
         $("#productopendate").focus();
         return false;
      }
      if($("#productclosedate").val().length <= 0) {
         alert("마감일 입력되지 않았습니다.\n내용을 입력해주세요");
         $("#productclosedate").focus();
         return false;
      }
      if($("#productticketcount").val().length <= 0) {
         alert("티켓 매수가 입력되지 않았습니다.\n내용을 입력해주세요");
         $("#productticketcount").focus();
         return false;
      }
      if($("#productremainticketcount").val().length <= 0) {
         alert("남은 티켓 매수가 입력되지 않았습니다.\n내용을 입력해주세요");
         $("#productremainticketcount").focus();
         return false;
      }
   });
   
   // 게시 글 리스트, 검색 결과 페이지에서 검색 요청 처리
   $("#searchForm").on("submit", function() {
      var keyword = $("#keyword").val();
      if(keyword.length <= 0) {
         alert("검색어가 입력되지 않았습니다.\n검색어를 입력해주세요");
         return false;
      }      
      $(this).attr("method", "post");
      $(this).attr("action", "productList");      
   });

});

// 장바구니 수량 수정 및 삭제시에 서버로 부터 받은 데이터를 처리하는 함수
function basketUpdateDelete(res, productName) {
   // 서버에서 받은 응답 처리
    if(! res.result) {
      alert(`주문 가능 수량을 초과하였습니다. - 주문 가능 수량 : ${res.remainCnt}`);
      return;                  
   }

   console.log(`${res.msg}`);
   //console.log(res.basketList);
   
   // 기존 테이블의 내용을 삭제 삭제               
   $("#basketTableBody").empty();
                  
   let tableContent = ""                
   // 장바구니 상품 리스트를 반복문을 이용해 기존 화면과 동일하게 작성   
   $.each(res.basketList.basketList, function(index, value) {
      
      tableContent += `<tr class="basketData row">
                           <td  id= "productNameTd" class="col-6">
                              <div class="row h-100 align-items-center">
                                 <div class="col">
                                    <img src="${value.productImage}"  width="90"  height="90" />
                                    ${value.productName}
                                 </div>
                              </div>   
                           </td>            
                           <td id= "productSelectNumber" class="col">
                              <div class="row h-100  align-items-center">
                                 <div class="col">
                                    <input type="number" max=""  min="1" 
                                          value="${value.basketProductCount}" 
                                          class="basketProductCount form-control"
                                          name="basketProductCount">
                                 </div>
                                 <div class="col">                              
                                    <input type="button" class="btn btn-outline-dark updateBasketProductNoCount" 
                                       data-basketno="${value.basketNo}" data-productno="${value.productNo}" 
                                       data-productcount="${value.basketProductCount}" 
                                       data-productname="${value.productName}" value="수정">
                                 </div>
                              </div>            
                           </td>            
                           <td class="col">
                              <div class="row h-100  align-items-center">
                                 <div class="col text-end pe-3 totalPriceWon">${value.totalPrice}원</div>
                              </div>   
                           </td>
                           <td class="col">
                              <div class="row h-100  align-items-center">
                                 <div class="col text-center">
                                    <input type="button"  class="btn btn-outline-dark deleteBasketNo"    
                                       data-basketno="${value.basketNo}" data-productno="${value.productNo}" 
                                       data-productname="${value.productName}" value="삭제">
                                 </div>
                              </div>
                           </td>
                        </tr>`;
   });
   
   // 테이블 바디에 장바구니에 담긴 상품 리스트 추가 
   $("#basketTableBody").append(tableContent);
   
   // 총 상품 금액을 갱신   
   $("#basketTotalPrice").text(`총 상품금액 : ${res.basketTotalPrice}원`);
   
   // 0.5초 후에 알림창 띄우기
   setTimeout(function() {
      alert(`${productName}${res.msg}`);   
   }, 500);
   
}


