/**
 * 
 */
  $(function(){
  


   var visibleItems = 5;

        // 3초마다 새로운 항목을 표시하고 이전 항목을 위로 이동
        setInterval(function() {
            var newsItems = $('.news-item');

            // 이전 항목을 위로 이동
            newsItems.filter(':visible').first().slideUp(function() {
                $(this).appendTo('#latestNewsContainer').slideDown();
            });

            // 새로운 항목을 표시
            newsItems.slice(visibleItems, visibleItems + 1).slideDown();
        }, 3000);
        
        
       
       
       
   
  /*-----------------------mainSearch.js--------------------------------*/ 

	$("#seeMoreProduct").click(function(){
		$("#pills-home-tab").removeClass("active");
		$("#pills-profile-tab").addClass("active");
		$("#pills-home").removeClass("active show");
		$("#pills-profile").addClass("active show");
	});
	$("#seeMoreNews").click(function(){
		$("#pills-home-tab").removeClass("active");
		$("#pills-contact-tab").addClass("active");
		$("#pills-home").removeClass("active show");
		$("#pills-contact").addClass("active show");
	});
	$("#seeMoreGallery").click(function(){
		$("#pills-home-tab").removeClass("active");
		$("#pills-disabled-tab").addClass("active");
		$("#pills-home").removeClass("active show");
		$("#pills-disabled").addClass("active show");
	});





 /*-----------------------member.js--------------------------------*/
 
 
    
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
 	//정규식 유효성 검사
    // 이름 
    	const regName = /[가-힣a-zA-Z]{2,15}$/;
 	// id
    	const regId = /[a-zA-Z0-9]{4,16}$/;
    //email
   		const regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    //password
    	const regPassword = /^(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*?_]).{8,16}$/;
	//phoneNumber
		const regphone = /[0-9]{11}/
    		
 	//이름 유효성
 	$("#joinName").keyup(function(){
 		const name = $("#joinName").val();
 		
 		const hasName = /^[가-힣a-z]{2,15}$/.test(name);
 		
 		
 		updateValidation("joinNameMsg",hasName);
 	
 		function updateValidation(elementId , isValid){
 
 			const color = isValid ? "inherit" : "red";
 			
 			$("#joinNameMsg").text(isValid ? "" : "영문또는 한글 ,2자이상 15자 이하로만 입력해주세요.");
 			$("#joinName").attr("data-code", isValid ? "true" : "false");
 			$(elementId).css("color",color);
 			
 			}
 	});
 	
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
	                    $("#joinIdMsg").text("사용가능한 아이디 입니다").css("color", "blue");
	                    $("#joinId").attr("data-code","true");
	                } else {
	                    $("#joinIdMsg").text("사용중인 아이디 입니다. 다른 아이디를 입력해주세요 ").css("color", "red");
	                    $("#joinId").val("");
	                }
	
	            },
	            error: function (jqXHR, textStatus, errorThrown) {
	                console.log("login err" + "jqXHR " + jqXHR + "textStatus" + textStatus + "errorThrown" + errorThrown);
	            }
	
	        });//ajax end
	    }
	
	});
	 
	 
	 
	 //핸드폰 유효검사
	 
	 $("#phoneCheckBtn").click(function(){
	 	const phoneNumber = $("#phoneNumber").val();
	 	console.log(phoneNumber);
	 	if(! regphone.test(phoneNumber)){
	 		$("#phoneNumberMsg").text("하이픈(-)없이 숫자만 11자 작성해주세요").css("color","red");
	 		return false;
	 	}else{
	 		$.ajax({
	 			url: "phoneCheckMessage",
	 			type: "post",
	 			data: {"phonenumber": phoneNumber},
	 			success: function(result){
	 				if(result != ""){
	 					$("#phoneNumberCheckCode").val(result);
	 					$("#phoneNumberMsg").text("인증번호가 전송되었습니다.").css("color","green");
	 					$("#phoneCheckLi").css("display","block");
	 					$("#phoneCheckBtn").val("재전송");
	 				}else{
	 					$("#phoneNumberMsg").text("핸드폰 번호를 다시 확인해 주세요").css("color","red");
	 				}
	 			}
	 		});
	 	}
	 
	 });
	 
	 $("#phoneCheckNumBtn").click(function(){
	 
		 const phoneCheck = $("#phoneCheck").val();
		 const phoneNumberCheckCode = $("#phoneNumberCheckCode").val();
		 
		 if(phoneCheck == phoneNumberCheckCode){
		 	$("#phoneCheck").attr("data-code","true");
		 	$("#phoneNumberMsg").text("인증번호가 일치합니다.").css("color","green");
	 					
		 }
	 });
	 
	 
	 
	 
	 
	 
	 
	 
	 
 	//비밀번호 유효성 		
 	$("#joinPassword").keyup(function(){
    	const joinPassword = $("#joinPassword").val();
   
    // 소문자 포함 여부 체크
	const hasLowercase = /[a-z]/.test(joinPassword);
	updateValidation("#passwordMsg1", hasLowercase);
	
	// 숫자 포함 여부 체크
	const hasNumber = /[0-9]/.test(joinPassword);
	updateValidation("#passwordMsg2", hasNumber);
	
	// 특수문자 포함 여부 체크
	const hasSpecialChar = /[@$!%*#?&]/g.test(joinPassword);
	updateValidation("#passwordMsg3", hasSpecialChar);
	
	// 길이 체크 (8보다 크고 16보다 작은 경우 파란색, 그 외에는 회색)
	const isValidLength = 7 < joinPassword.length && joinPassword.length < 17;
	updateValidation("#passwordMsg4", isValidLength);
	
	// 유효성 검사 결과 업데이트 함수
	function updateValidation(elementId, isValid) {
    const color = isValid ? "blue" : "gray";
    $(elementId).css("color", color);
  
}
    
    });
    
    //비밀번호 check 유효성 		
 	$("#joinPasswordCheck").keyup(function(){
    	const joinPasswordChecj=k = $("#joinPasswordCheck").val();
   
    
	    if(joinPasswordChecj == $("#joinPassword").val()){
		    $("#joinPasswordCheck").attr("data-code","true");
		    $("#joinPasswordCheckMsg").text("비밀번호가 일치 합니다").css("color","green");
	    }else{
	    	 $("#joinPasswordCheckMsg").text("비밀번호가 일치하지 않습니다.").css("color","red");
	    }
	
   });
   
   //비밀번호 보기
	$("#seeJoinPassword").click(function(){
		if($("#joinPassword").attr("type") == "password"){
			$("#seeJoinPassword").removeClass("bi-eye-slash");	
			$("#seeJoinPassword").addClass("bi-eye");	
			$("#joinPassword").attr("type","text");
			
		}else{
			$("#seeJoinPassword").removeClass("bi-eye");	
			$("#seeJoinPassword").addClass("bi-eye-slash");	
			$("#joinPassword").attr("type","password");
		}
	});
	//비밀번호 확인보기
	$("#seeJoinPasswordCheck").click(function(){
		if($("#joinPasswordCheck").attr("type") == "password"){
			$("#seeJoinPassword").removeClass("bi-eye-slash");	
			$("#seeJoinPassword").addClass("bi-eye");	
			$("#joinPasswordCheck").attr("type","text");
			
		}else{
			$("#seeJoinPassword").removeClass("bi-eye");	
			$("#seeJoinPassword").addClass("bi-eye-slash");	
			$("#joinPasswordCheck").attr("type","password");
		}
	});
 		
 	
 		
 		//이메일 인증
 	$('#eMailCheckBtn').click(function() {
		const email = $('#eMailId').val() +"@"+ $('#eMailDomain').val(); // 이메일 주소값 얻어오기!
		
			    $.ajax({
					type : 'post',
					url : "joinEmailCheck",
					data : {"email" :email},
					datatype :"text",
					
					async    : false,
					success : function (data) {
					    
						console.log("join이메일 체크"+data); // 성공하면
						if(data == 1){
						$("#eMailCheckMsg").text("사용중인 이메일입니다.").css("color", "red");
						return;
						}else{
						$.ajax({
							type : 'post',
							url : "mailCheck",
							data : {"email" :email},
							datatype :"text",
							async    : false,
							success : function (data2) {
								console.log("ajax2-data2 : " +  data2);
								$("#eMailCheckMsg").text("인증번호가 전송되었습니다.").css("color", "green");
								$("#eMailCheckLi").slideDown('slow');
								$("#eMailCheckBtn").val("재전송");
								$("#eMailCheckCode").val(data2);
							   
							},
					            error: function(xhr, status, error) {
					              
					                console.log(xhr.responseText); // 실패하면
					            }
					        });
						}
			        },
			        error: function(xhr, status, error) {
			      
			            console.log("ajax1"+xhr.responseText); // ajax1-실패하면
			        }
			    });//ajax  end
		
	}); // end send eamil
	
		//인증번호 확인
		$("#eMailCheckNumBtn").click(function(){
		const eMailCodeCheck = $('#eMailCodeCheck').val() // 인증번호 입력하는곳 
		const eMailCheckCode = $("#eMailCheckCode").val()
				if(eMailCodeCheck == eMailCheckCode){
				$("#eMailCheckNumMsg").text("인증 되었습니다.").css("color","green");
				$("#eMailCodeCheck").attr({"disabled":true, "data-code": "true"});
				
				}else{
				$("#eMailCheckNumMsg").text("인증번호를 다시 입력해 주세요.").css("color","red");
				$("#eMailCodeCheck").attr({"disabled":false, "data-code": "false"});
				}
			}); 
			
			//회원가입 최종 유효검사
			$("#memberJoinBtn").click(function(){
				
				if($("#joinName").attr("data-code") === "false"){
					$("#joinLastCheckMsg").text("이름을 다시 확인해 주세요").css("color","red");
					return false;
				}
				if($("#joinId").attr("data-code") === "false"){
				 	$("#joinLastCheckMsg").text("아이디를 다시 확인해 주세요").css("color","red");
					return false;
				}
				/*if($("#phoneCheck").attr("data-code")=== "false"){
					$("#joinLastCheckMsg").text("핸드폰번호를 다시 확인해 주세요").css("color","red");
					return false;
				}*/
				if($("#joinPasswordCheck").attr("data-code") === "false"){
					$("#joinLastCheckMsg").text("비밀번호 확인을 다시 확인해 주세요").css("color","red");
					return false;
				}
				if($("#zipcode").attr("data-code") === "false"){
					$("#joinLastCheckMsg").text("주소를 다시 확인해 주세요").css("color","red");
					return false;
				}
				if($("#eMailCodeCheck").attr("data-code") === "false"){
					$("#joinLastCheckMsg").text("이메일을 다시 확인해 주세요").css("color","red");
					return false;
				}
				
				
			});//회원가입 최종 유효검사 end
			
			
 
 	//회원가입 end
 	
 
 

 
 /*-------------------------login.js--------------------------------*/ 
 
 
 //로그인 
 
 
 
 
 
 
 
 
	$("#loginBtn").on("click",function(){
 	
		const id = $("#id").val();
 		const password = $("#password").val();
 		

 		
 		
	 	if (id == "") {
		 	$("#id").focus();
	        $("#loginMag1").text("아이디를 입력해 주세요").css("color", "red");
	        return;
	    } else {
		    $("#id").blur();
	    	$("#loginMag1").text("");
	    	
	    }
	
	    if (password == "") {
	    	$("#password").focus();
	        $("#loginMag1").text("비밀번호를 입력해 주세요").css("color", "red");
	        return;
	    } else {
	    	$("#password").blur();
	        $("#loginMag1").text("");
	        
	    }
	
	    if (id !== "" && password !== ""){
 	  
	    $.ajax({
	        url: "loginForm",
		    type: "post",
		    contentType: "application/json; charset=UTF-8",
		    data: JSON.stringify({
		        "id": id,
		        "password": password
		    }),
	        
	        success: function (result) {
	         console.log("aaaaaaresult"+result);
	            if (result === 1) {
	                // 로그인 성공 시 main 페이지로 이동
	                window.location.href = "main";
	            } else {
	                $("#loginMag1").text("아이디 또는 비밀번호를 다시 확인해 주세요").css("color", "red");
	            }
	        },
	        error: function (jqXHR, textStatus, errorThrown) {
	            console.log("login err"+"jqXHR "+jqXHR +"textStatus"+ textStatus + "errorThrown"+errorThrown);
	        }
	    });
}

});////로그인 end
 
  /*-------------------------idPasswordFind.js--------------------------------*/
  
  
  //아이디찾기
  $("#FindIdBtn").click(function(){
  	
  	const email = $("#findIdEmail").val();
  	const name = $("#findIdName").val();
  	
 
  	
  	if(! regName.test(name)){
  	$("#findIdEmailMsg").text("이름을 다시 확인해주세요.").css("color","red");
  		return;
  	}
  	if(! regEmail.test(email)){
  		$("#findIdEmailMsg").text("이메일을 다시 확인해주세요.").css("color","red");
  		return;
  	}
  	
  	$.ajax({
  		url : "userFindId",
  		type : "post",
  		data : JSON.stringify({"email" : email, "name":name}),
  		contentType: "application/json", // JSON 데이터 전송 시 필요
  		dataType : "text",
  		success : function(data){
  			if(data == ""){
  				$("#findIdEmailMsg").text("이름 또는 이메일을 다시 확인해주세요.").css("color","red");
  			}else{
  			$("#findId").val(data);
  			
  			$.ajax({
							type : 'post',
							url : "userFindCoed",
							data : JSON.stringify({"email" :email}),
							contentType: "application/json",
							datatype :"text",
							async    : false,
							success : function (data2) {
								
								console.log("ajax2-data2 : " +  data2);
  								$("#findIdEmailCheck").removeAttr("hidden");
								$("#findIdEmailCheck").slideDown('slow');
								$("#findIdEmailMsg").text("인증번호가 전송되었습니다.").css("color", "green");
								$("#FindIdBtn").val("재전송");
								$("#findIdEmailCheckCodeHidden").val(data2);
							   
							},
					            error: function(xhr, status, error) {
					              
					                console.log(xhr.responseText); // 실패하면
					            }
					        });
  			}
  		},
  		error: function (jqXHR, textStatus, errorThrown) {
	            console.log("login err"+"jqXHR "+jqXHR +"textStatus"+ textStatus + "errorThrown"+errorThrown);
	        }
  	
	  	});//ajax end
	  	
  				
	  	
	  });
	   
  $("#findIdEmailCheckNumBtn").click(function(){
  
  	if($("#findIdEmailCheckCodeHidden").val() == $("#findIdEmailCodeCheck").val()){
  				$("#home-tab-pane1").attr("hidden",true);
  				$("#home-tab").attr("data-bs-target","#home-tab-pane2");
  				$("#home-tab-pane2").removeAttr("hidden");
	  	
  	}else{
  		$("#findIdEmailMsg").text("인증번호가 일치하지않습니다.").css("color","red");
  	}
  
  
  });
  
  
  
  
  
 	//비번찾기 이동
 	$("#profile-tab").click(function(){
 			$("#findIdDiv").attr("hidden","");
	  		$("#home-tab").attr("data-bs-target","#home-tab-pane1");
	  		$("#profile-tab-pane1").removeAttr("hidden");
	  		$("#findIdName").val("");
	  		$("#findIdEmail").val("");
	  		$("#findIdEmailCodeCheck").val("");
	  		$("#home-tab-pane1").removeAttr("hidden");
	  		$("#findIdEmailMsg").text("");
	  		$("#FindIdBtn").val("이메일 인증하기");
 			$("#findIdEmailCheck").attr("hidden","")
 			
	 	
 	});
 	
 	
 		//아이디찾기 이동
 		$("#home-tab").click(function(){
 		$("#findIdDiv").removeAttr("hidden");
 		$("#profile-tab-pane1").attr("hidden",true);
 		$("#findPasswordId").val("");
 		$("#findPasswordEmail").val("");
 		$('#findEmailCodeCheck').val("");
 		$("#profile-tab").attr("data-bs-target","#profile-tab-pane1");
 		$("#profile-tab-pane1").addClass("show active");
		$("#profile-tab-pane3").addClass("fade");
		$("#profile-tab-pane1").removeClass("fade");
		$("#profile-tab-pane3").removeClass("show active");
 		$("#findPasswordEmailCheckDiv").attr("hidden","");
 		$("#profile-tab").text("비밀번호 찾기");
 		$("#FindPasswordBtn").val("이메일 인증하기");
 	});
 	
 
 	
 	
 	//비밀번호 찾기(변경)
 	$("#FindPasswordBtn").click(function(){
 		
 		const id = $("#findPasswordId").val();
 		const email = $("#findPasswordEmail").val();
 		const findEmailCodeCheck = $('#findEmailCodeCheck').val() // 인증번호 입력하는곳 
		const findEmailCheckCodeHidden = $("#findEmailCheckCodeHidden").val()
		
		
		
		if(! regId.test(id)){
 			$("#findPasswordMsg").text("아이디를 다시 확인해 주세요").css("color","red");
 			return;
 		}
 		if(! regEmail.test(email)){
 			$("#findPasswordMsg").text("이메일을 다시 확인해 주세요").css("color","red");
 			return;
 		}
		$("#findPasswordLoading").css("display","block");
		
		 	$.ajax({
		 			url: "userFindPassword",
		 			type: "post",
		 			data: JSON.stringify({"id": id, "email":email}),
		 			contentType: "application/json",
		 			success:function(result){
		 					
		 				if(result != ""){
		 					$("#findPasswordLoading").css("display","none");
		 					$("#findEmailCheckCodeHidden").val(result);
		 					$("#findPasswordEmailCheckDiv").removeAttr("hidden");
		 					$("#findPasswordMsg1").text("인증번호가 전송되었습니다").css("color","green");
		 					$("#FindPasswordBtn").val("재전송");
		 				}else{
		 					$("#findPasswordMsg1").text("아이디를 또는 이메일을 다시 확인해 주세요").css("color","red");
		 					$("#findPasswordEmailCheck").css("display","");
		 				}
		 				
		 				
		 			},
		 			error: function(xhr, status, error) {
					              
		                console.log(xhr.responseText); // 실패하면
		            }
		 		
		 		});//ajax end
		
		
	}); // end 
 		
 
 	
 	//비밀번호찾기 인증확인
 	$('#findPasswordEmailCheckNumBtn').click(function() {
 		const findEmailCodeCheck = $('#findEmailCodeCheck').val() // 인증번호 입력하는곳 
		const findEmailCheckCodeHidden = $("#findEmailCheckCodeHidden").val()
		
			if(findEmailCodeCheck === findEmailCheckCodeHidden){
				$("#profile-tab-pane1").removeClass("show active");
				$("#profile-tab-pane1").addClass("fade");
				$("#profile-tab").attr("data-bs-target","#profile-tab-pane2");
				$("#profile-tab-pane2").removeClass("fade");
				$("#profile-tab-pane2").addClass("show active");
				$("#profile-tab").text("비밀번호 재설정");
				$("#findNewPasswordIdHidden").val($("#findPasswordId").val());
			}else{
				$("#findPasswordMsg1").text("인증번호가 일치하지않습니다.").css("color","red");
			}
		
 		});//end	
 		
 		
 		
 		$("#findNewPassword").blur(function(){
 			if(! regPassword.test($("#findNewPassword").val())){
 				$("#findPasswordMsg2").text("영문소문자,숫자,특수문자를 조합해 8자이상 16자이하로 작성해 주세요").css("color","red");
 				return;
 			}else{
 				$("#findPasswordMsg2").text("");
 			}
 		});
 		
 		
 		
 		//새로운비밀번호 
 		$("#findNewPasswordBtn").click(function(){
 			const newPassword = $("#findNewPassword").val();
 			const passwordCheck = $("#findNewPasswordCheck").val()
 			const id = $("#findNewPasswordIdHidden").val()
 			
 			
 			if(newPassword != passwordCheck){
 				$("#findPasswordMsg2").text("비밀번호가 일치하지 않습니다.").css("color","red");
 				return;
 			}
 			if(newPassword === passwordCheck){
 			
 				$.ajax({
 					url: "userNewPassword",
 					type: "post",
 					data: JSON.stringify({
 						"password": passwordCheck,
 						"id":id 
 					}),
 					contentType: "application/json",
 					success: function(result){
 					if(result == 1){
 					$("#profile-tab-pane2").addClass("fade");
 					$("#profile-tab-pane2").removeClass("show active");
					$("#profile-tab-pane3").removeClass("fade");
					$("#profile-tab-pane3").addClass("show active");
					$("#profile-tab").attr("data-bs-target","#profile-tab-pane3");
					$("#findNewPassword").val("");
					$("#findNewPasswordCheck").val("");
					}
 					},
 					error: function(xhr, status, error) {
		              
		                console.log(xhr.responseText); // 실패하면
		            }
 				
 				
 				
 				})
 			}
 		});
 	
 	
 });//function end
 	
 
 
 /*-------------------------method.js--------------------------------*/
 
 
 
 
 //우편번호
   function findAddr() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    
					}
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("zipcode").value = data.zonecode;
                document.getElementById("zipcode").setAttribute("data-code", "ture");
                document.getElementById("address1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("address2").focus();
            }
        }).open();
    };
    
    //enter로 로그인

function onEnterLogin(event) {
    // event.which 또는 event.keyCode를 사용하여 엔터 키 코드를 확인
    if (event.which == 13 || event.keyCode == 13) {
        const id = $("#id").val();
        const password = $("#password").val();

        if (id == "") {
            $("#id").focus();
            $("#loginMag1").text("아이디를 입력해 주세요").css("color", "red");
            return;
        } else {
            $("#id").blur();
            $("#loginMag1").text("");
        }

        if (password == "") {
            $("#password").focus();
            $("#loginMag1").text("비밀번호를 입력해 주세요").css("color", "red");
            return;
        } else {
            $("#password").blur();
            $("#loginMag1").text("");
        }

        // 아이디와 비밀번호가 입력되었을 때에만 AJAX 요청 수행
        if (id !== "" && password !== "") {
            $.ajax({
                url: "loginForm",
                type: "post",
                contentType: "application/json; charset=UTF-8",
                data: JSON.stringify({
                    "id": id,
                    "password": password
                }),
                success: function(result) {
                    console.log("result: " + result);
                    if (result === 1) {
                        // 로그인 성공 시 main 페이지로 이동
                        window.location.href = "main";
                    } else {
                        $("#loginMag1").text("아이디 또는 비밀번호를 다시 확인해 주세요").css("color", "red");
                    }
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.log("login err - jqXHR: " + jqXHR + " textStatus: " + textStatus + " errorThrown: " + errorThrown);
                }
            });
        }
    }
}

// Enter 키를 감지하기 위해 input 요소에 이벤트 리스너 추가
$("#id, #password").on("keypress", function(event) {
    onEnterLogin(event);
});
    
    //////////////////////////////////////////////////////////////


