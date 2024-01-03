$(function() {
////////////////  여기는 장바구니   ///////////////////////

	$("#basket").on("submit", function() {
		var keyword = $("#keyword").val();
		if(keyword.length <= 0) {
			alert("검색어가 입력되지 않았습니다.\n검색어를 입력해주세요");
			return false;
		}		
		$(this).attr("method", "post");
		$(this).attr("action", "productList");		
	});	

///////////////여기서부터는 product CRUD /////////////////
	$("#detailUpdate").on("click", function() {
			
		var pass = $("#adminpassword").val();
		if(pass.length <= 0) {
			alert("JS게시 글을 수정하려면 비밀번호를 입력해주세요");
			return false;
		}		
		
		$("#rPass").val(pass);
		$("#checkForm").attr("action", "update");
		$("#checkForm").submit();
	});
	
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
	
	// 게시 글쓰기 폼 유효성 검사
	$("#writeForm").on("submit", function() {
		if($("#productname").val().length <= 0) {
			alert("제목이 입력되지 않았습니다.\n제목을 입력해주세요");
			$("#productname").focus();
			return false;
		}
		if($("#adminpassword").val().length <= 0) {
			alert("비밀번호가 입력되지 않았습니다.\n비밀번호를 입력해주세요");
			$("#adminpassword").focus();
			return false;
		}
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