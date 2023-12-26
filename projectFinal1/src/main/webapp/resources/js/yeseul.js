/**
 * 
 */
  $(function(){
 	
	 	$("#categoryBar").mouseenter(function(){
	 		$("#categoryBarDetail").slideDown('slow');
	 	});
	 	$("#categoryBarDetail").mouseleave(function(){
	 		$("#categoryBarDetail").slideUp('slow');
	 	});
 	
 
 
 
 
 /*---------------------member.js----------------------------------*/
 
 //정규식 유효성 검사
    // 이름
   		var regName = /^[가-힣a-zA-Z]{2,15}$/;
 	// id
    	var regId = /^[a-zA-Z0-9]{4,16}$/;
    //password
    	var regPass = "^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,16}$";
 
 	//약관동의  page
 	$("#allLoginConfrimCheck").click(function(){
	 	if($(this).attr("data-code") == "false"){
	 		$(".LoginConfrim").attr("data-code","true").css("color","green");
	 		}else{
	 		$(".LoginConfrim").attr("data-code","false").css("color","lightgray");
	 		}
 	});
 
 	$(".LoginConfrim2").click(function(){
	 	if($(this).attr("data-code") == "false"){
	 		$(this).attr("data-code","true").css("color","green");
	 	}else{
	 		$(this).attr("data-code","false").css("color","lightgray");
	 	}
	 	if($("#LoginConfrimCheck1").attr("data-code")== "true"
	 	 	&& $("#LoginConfrimCheck2").attr("data-code")== "true"
	 	 	&& $("#LoginConfrimCheck3").attr("data-code")== "true")
	 	 	
	 	 	{
	 			$("#allLoginConfrimCheck").attr("data-code" , "true").css("color","green");
	 		}
	 		if($("#LoginConfrimCheck1").attr("data-code")== "false"
	 	 	|| $("#LoginConfrimCheck2").attr("data-code")== "false"
	 	 	|| $("#LoginConfrimCheck3").attr("data-code")== "false")
	 	 	
	 	 	{
	 			$("#allLoginConfrimCheck").attr("data-code","false").css("color","lightgray");
	 		}
	 		
 	});

 	
 	$("#joinConfirmBtn").click(function(){
 		if($("#allLoginConfrimCheck").attr("data-code") == "true"){
 		
 			$("#memberJoinConfrimFrom").submit();
 		}else{
 		 	$("#LoginConfrimCheckMsg").text("동의를 전부 해야만 회원가입이 가능 합니다.").css("color","red");
 		}
 		
 		
 	});
 	
 
 	//약관동의 end
 
 
 
 	//회원가입
 	
 	// id 중복확인 
$("#idCheck").click(function () {
    const id = $("#joinId").val();

    if (id === "") {
        $("#joinIdMsg").text("아이디를 입력해주세요 ").css("color", "red");
        return;
    }

    if (!regId.test(id)) {
        $("#joinIdMsg").text("아이디는 영문, 숫자 4자 이상 16자 이하로 정해주세요 ").css("color", "red");
        return;
    } else {

        $.ajax({
            type: "post",
            url: "joinIdCheck",
            data: {"id" : id}, // JSON.stringify를 사용하여 객체 형태로 전달
            dataType : "text",
            success: function (result) {
                if (result == 0) {
                    $("#joinIdMsg").text("사용가능한 아이디 입니다").css("color", "green");
                } else {
                    $("#joinIdMsg").text("사용중인 아이디 입니다. 다시 입력해주세요 ").css("color", "red");
                    $("#joinId").val("");
                }

            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log("login err" + "jqXHR " + jqXHR + "textStatus" + textStatus + "errorThrown" + errorThrown);
            }

        });//ajax end
    }

})
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 //로그인 
	$("#loginBtn").on("click",function(){
 	
		const id = $("#id").val();
 		const password = $("#password").val();
 		
 		console.log($("#id").val()+$("#password").val());
 		
 		console.log("id"+id+"password"+password);
 		
 		
	 	if (id === "") {
		 	$("#id").focus();
	        $("#loginMag").text("아이디를 입력해 주세요").css("color", "red");
	        return;
	    } else {
		    $("#id").blur();
	    	$("#loginMag").text("");
	    }
	
	    if (password === "") {
	    	$("#password").focus();
	        $("#loginMag").text("비밀번호를 입력해 주세요").css("color", "red");
	        return;
	    } else {
	    	$("#password").blur();
	        $("#loginMag").text("");
	    }
	
	    if (id !== "" && password !== ""){
 	  
	    $.ajax({
	        url: "loginForm",
		    type: "POST",
		    contentType: "application/json; charset=UTF-8",
		    data: JSON.stringify({
		        "id": id,
		        "password": password
		    }),
	        
	        success: function (result) {
	            console.log("ajax-result" + result);
	            if (result === 1) {
	                // 로그인 성공 시 main 페이지로 이동
	                window.location.href = "main";
	            } else if (result === -1) {
	                $("#loginMag").text("아이디 또는 비밀번호를 찾지 못했습니다. 다시 시도해 주세요").css("color", "red");
	            } else {
	                $("#loginMag").text("아이디 또는 비밀번호가 맞지 않습니다.").css("color", "red");
	            }
	        },
	        error: function (jqXHR, textStatus, errorThrown) {
	            console.log("login err"+"jqXHR "+jqXHR +"textStatus"+ textStatus + "errorThrown"+errorThrown);
	        }
	    });
}

});////로그인 end
 
 
 
 });