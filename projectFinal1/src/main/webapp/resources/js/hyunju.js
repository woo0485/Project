///////////// 여기는 장바구니에서 수량 변경 및 삭제하기  ///////////////
$(document).ready(function() {

	 $(".updateBasketProductnoCount").click(function() {
		 // $$$$$$ 여기서도 버튼의 아이디 이름이 아니라 class이름으로 받아오면된다.!!!!!!!!
		 
		 // 해당하는 수량도 반복문 안에서니까 class이름으로 받아와야한다!!!!!
		 //const val = $("#basketProductCount").val();
		// const id =$("#rId34534").val();
		 //const productno = $("#productno0134").val();
		 
		 // ********* 변경 버튼 이 반복문에 돌아가니까 ~~~
		// const basketno = $(this).data("no");
		const basketno = $(this).data("basketno");
		// basketproductcount 테스트
	// 이거 수정 전	const basketProductCount = document.getElementsByName('basketProductCount')[0].value;
		//const basketProductCount = $(this).data("basketProductCount");
		 const basketProductCount = $(this).closest("tr").find(".basketProductCount").val();
	
		 // id는 session에 저장되어있으니까 안해도됨
		 const id =$("#rId34534").val();
		 // $$$$$$$$$$$$$$$$$$ 여기까지 id랑 basketno랑 수량이랑 다 넘어감 !!!1 $$$$$$$$$$$$$$$
		 console.log( "1234");
		  $.ajax({
	            type: "POST",
	            url: "updateDeleteForm",  // 서버의 매핑 주소
	            data: {
	            	"id" : id ,
	            	"basketProductCount" : basketProductCount,
	            	"basketno" : basketno
	            },
	            success: function(response) {
	                // 서버에서 받은 응답 처리
	                console.log( response);
	                // 필요한 동작 수행 (예: 화면 갱신, 리다이렉트 등)
	                //window.location.href = 'updateDeleteForm?id=' +id + '&basketno=' +basketno + '&basketProductCount=' + basketProductCount;
	            },
	            error: function(xhr, error, msg) {
	                console.error("장바구니에서 상품 수량 변경 및 삭제 에러 발생: " + error + ". " + msg);
	            }
	        });
	    });
});


$(function() {
////////////////  여기는 장바구니   ///////////////////////

	//$("#basket").on("submit", function() {
	//	$(this).attr("method", "post");
	//	$(this).attr("action", "basket");		
	//});	
	
	// 장바구니에서 제품 하나 삭제 - 1월 5일
	//$("#deleteBasket").on("click", function() {
		
	//	$("#checkBasketForm").attr("action", "deleteB");
	//	$("#checkBasketForm").attr("method", "post");
	//	$("#checkBasketForm").submit();
//	});


///////////////여기서부터는 product CRUD /////////////////
/*	$("#detailUpdate").on("click", function() {
		var pass = $("#adminpassword").val();
		if(pass.length <= 0) {
			alert("JS게시 글을 수정하려면 비밀번호를 입력해주세요");
			return false;
		}		
		
		$("#rPass").val(pass);
		$("#checkForm").attr("action", "update");
		$("#checkForm").submit();
	});
	*/
	/*
	$("#detailDelete").on("click", function() {
		var pass = $("#adminpassword").val();
		if(pass.length <= 0) {
			alert("게시 글을 삭제하려면 비밀번호를 입력해주세요");
			return false;
		}
		$("#rPass").val(pass);
		$("#checkForm").attr("action", "delete");
		$("#checkForm").attr("method", "post");
		$("#checkForm").submit();
	});
	*/
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
	
	
	$("#updateBasketProductnoCount").click(function() {
		 var val =  $(this).prev().prev().val();
		 var productno = $(this).prev().val();
		 
		 $("#basketProductCount").val(val);
		 $("#productno").val(productno);
		 
		 $("#updateDeleteForm").submit();
		 });
});
