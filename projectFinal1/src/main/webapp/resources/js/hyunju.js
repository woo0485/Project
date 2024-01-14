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
	///////////////////////////////////////////////////////////////
	//  장바구니에서 제품 하나하나를 삭제클릭 했을 때
	$(".deleteBasketProductNo").click(function(e) {		
	const productNo = $(this).data("productno");
	
		  $.ajax({
	            type: "POST",
	            url: "deleteBasketProductNo",  // 서버의 매핑 주소
	            data: {	            
	            	"productNo": productNo
	            },
	            success: function(res) {
	                // 서버에서 받은 응답 처리
	                console.log( res);
 					window.location.href = 'basketRedirect?productNo=' +productNo;
					  },
	            error: function(xhr, error, msg) {
	                console.error("장바구니에서  삭제 에러 발생: " + error + ". " + msg);
	            }
	        });
    });
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 장바구니에서 변경을 클릭했을 때
	$(".updateBasketProductNoCount").click(function(e) {		 

		const basketNo = $(this).data("basketno");
		const productNo = $(this).data("productno");
		const basketProductCount = $(this).prev().val();
		console.log("basketNo : " + basketNo + ", productNo : " + productNo + ", basketProductCount : " + basketProductCount);
		
		  $.ajax({
	            type: "POST",
	            url: "updateDeleteForm",  // 서버의 매핑 주소
	            data: {	            
	            	"basketProductCount" : basketProductCount,
	            	"basketNo" : basketNo,
	            	"productNo": productNo
	            },
	            success: function(res) {
	                // 서버에서 받은 응답 처리
	                console.log( res);
	                if(! res.result) {
						alert(`주문 가능 수량을 초과하였습니다. - 주문 가능 수량 : ${res.remainCnt}`);
						return;
					} else {
						 window.location.href = 'basketRedirect?basketNo=' +basketNo + '&basketProductCount=' + basketProductCount + '&productNo=' + productNo;
					}
					
					/*
					alert(`${res.msg}`);
					//console.log(res.basketList);
					// 기존 테이블의 내용을 삭제 삭제
					//$("#basketimformation").empty();
					$("#basketTableBody").empty();
					
					let table = `<table id="basketTable">
											<thead>
												<tr>		
													<th></th>											
													<th>이미지</th>
													<th>상품</th>
													<th>판매가</th>
													<th>수량</th>
													<th>합계</th>
													<th>선택</th>
												</tr>		
											</thead>
											<tbody id="basketTableBody">
											</tbody>
										</table>`
										
					let tableContent = "" 
					
					$.each(res.basketList, function(index, value) {
						// console.log(value);
						// 여기서부터 수정함
											
						tableContent +=   
								` <tr>						
									<td  id= "Img12">	
										<img src="${value.productImage}"  width="50" height="50" />
									</td>
									
									<td  id= "productName38">
										${value.productName}
									</td>
									
									<td  id= "productPrice38sdfds">
										${ value.productPrice }원 &nbsp;&nbsp;
									</td>
									
									<td>									
										<input type="number"   max=""  min="1" value="${value.basketProductCount}" 
											class="basketProductCount"
											name="basketProductCount" 
											data-basketProductCount="${value.basketProductCount}">			
												
										<input type="button" class="updateBasketProductNoCount" 
											data-basketno="${value.basketNo}"  data-productno="${value.productNo}" value="변경">	
									</td>				
													
									<td  id= "productPrice38">
										${value.totalPrice}원
									</td>
									
									<td>
									<input class="btn btn-danger"  type="text" name="deleteBasketProductNo"  id="deleteBasketProductNo" value="삭제">
									</td>
								</tr>`												
					});
					// 여기서부터 추가함
					$("#basketTableBody").append(tableContent);
					
				*/
					
	            },
	            error: function(xhr, error, msg) {
	                console.error("장바구니에서 상품 수량 변경 에러 발생: " + error + ". " + msg);
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
		/*if($("#productimage").val().length <= 0) {
			alert("사진이 입력되지 않았습니다.\n내용을 입력해주세요");
			$("#productimage").focus();
			return false;
		}*/
		if($("#address1").val().length <= 0) {
			alert("위치가 입력되지 않았습니다.\n내용을 입력해주세요");
			$("#address1").focus();
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
		/*if($("#productremainticketcount").val().length <= 0) {
			alert("남은 티켓 매수가 입력되지 않았습니다.\n내용을 입력해주세요");
			$("#productremainticketcount").focus();
			return false;
		}*/
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
