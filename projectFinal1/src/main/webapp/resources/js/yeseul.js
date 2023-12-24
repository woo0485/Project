/**
 * 
 */
  $(function(){
 	
 	//카테고리바
 	$("#categoryBar")
 	.mouseenter(function(){
 		$("#categoryBarDetail").removeAttr('hidden');
 	});
 	$("#categoryBar").mouseleave(function(){
 		$("#categoryBarDetail").attr('hidden',true);
 	});
 	
 
 
 
 
 /*-------------------------------------------------------*/
 
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