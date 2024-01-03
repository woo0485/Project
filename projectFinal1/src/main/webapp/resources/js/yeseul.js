/**
 * 
 */
  $(function(){
  
 /*-----------------------main.js----------------------------------*/	
	 	
 	// 선택자
 	/*
	const sliderWrap = document.querySelector(".slider__wrap");
	const sliderImg = sliderWrap.querySelector(".slider__img");             // 보여지는 영역
	const sliderInner = sliderWrap.querySelector(".slider__inner");         // 움직이는 영역
	const slider = sliderWrap.querySelectorAll(".slider");                  // 개별 이미지
	
	let currentIndex = 0;                                                   // 현재 보이는 이미지
	let sliderCount = slider.length;                                        // 이미지 갯수
	let sliderInterval = 3000;                                              // 이미지 변경 간격 시간
	let sliderWidth = slider[0].clientWidth;                                // 이미지 가로값 구하기
	let sliderClone = sliderInner.firstElementChild.cloneNode(true);        // 첫 번째 이미지 복사	
 
 sliderInner.append(sliderClone);

        function sliderEffect(){
            currentIndex++;

            $(".slider__inner").css({
                'transition': 'all 0.6s',
                'transform': `translateX(-${sliderWidth * currentIndex}px)`
            });

            if(currentIndex == sliderCount){
                setTimeout(() => {
                    $(".slider__inner").css({
                        'transition': '0s',
                        'transform': 'translateX(0px)'
                    });
                }, 700);
                currentIndex = 0;
            }
        };

        setInterval(sliderEffect, sliderInterval);
        */
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
    	const regPassword = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,16}$/;
    		
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
	            async    : false,
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
	
	})
	 
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
	    	 $("#joinPasswordCheckMsg").text("비밀번호가 일치하지 않습니다.");
	    }
	
   });
   
   //비밀번호 보기
	$("#seeJoinPassword").click(function(){
		if($("#joinPassword").attr("type") == "password"){
			$("#joinPassword").attr("type","text");
		}else{
			$("#joinPassword").attr("type","password");
		}
	});
	$("#seeJoinPasswordCheck").click(function(){
		if($("#joinPasswordCheck").attr("type") == "password"){
			$("#joinPasswordCheck").attr("type","text");
		}else{
			$("#joinPasswordCheck").attr("type","password");
		}
	});
 		
 	
 		
 		//이메일 인증
 	$('#eMailCheckBtn').click(function() {
		const email = $('#eMailId').val() +"@"+ $('#eMailDomain').val(); // 이메일 주소값 얻어오기!
		console.log('js완성된 이메일 : ' + email); // 이메일 오는지 확인
		
		
			    $.ajax({
					type : 'post',
					url : "joinEmailCheck",
					data : {"email" :email},
					datatype :"text",
					
					async    : false,
					success : function (data) {
					    
						console.log("join이메일 ajax 첫번째 성공"+data); // 성공하면
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
								$("#eMailCheckCode").val(data);
							   
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
 		
 		console.log($("#id").val()+$("#password").val());
 		
 		console.log("id"+id+"password"+password);
 		
 		
	 	if (id === "") {
		 	$("#id").focus();
	        $("#loginMsg").text("아이디를 입력해 주세요").css("color", "red");
	        return;
	    } else {
		    $("#id").blur();
	    	$("#loginMsg").text("");
	    }
	
	    if (password === "") {
	    	$("#password").focus();
	        $("#loginMsg").text("비밀번호를 입력해 주세요").css("color", "red");
	        return;
	    } else {
	    	$("#password").blur();
	        $("#loginMsg").text("");
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
	        async    : false,
	        success: function (result) {
	            console.log("ajax-result" + result);
	            if (result === 1) {
	                // 로그인 성공 시 main 페이지로 이동
	                window.location.href = "main";
	            } else if (result === -1) {
	                $("#loginMsg").text("아이디 또는 비밀번호를 찾지 못했습니다. 다시 시도해 주세요").css("color", "red");
	            } else {
	                $("#loginMsg").text("아이디 또는 비밀번호가 맞지 않습니다.").css("color", "red");
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
  		async    : false,
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
 		$("#profile-tab-pane2").attr("hidden","");
 		$("#findPasswordId").val("");
 		$("#findPasswordEmail").val("");
 		$('#findEmailCodeCheck').val("");
 		$("#profile-tab").attr("data-bs-target","#profile-tab-pane1");
 		$("#profile-tab-pane1").attr("hidden","");
 		
 		$("#profile-tab-pane3").attr("hidden","");
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
		
		 	$.ajax({
		 			url: "userFindPassword",
		 			type: "post",
		 			data: JSON.stringify({"id": id, "email":email}),
		 			contentType: "application/json",
		 			async: false,
		 			success:function(result){
		 					
		 				if(result != ""){
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
				$("#profile-tab-pane1").attr("hidden",true);
				$("#profile-tab").attr("data-bs-target","#profile-tab-pane2");
				$("#profile-tab-pane2").removeClass("fade");
				$("#profile-tab-pane2").addClass("show active");
				$("#profile-tab").text("비밀번호 재설정");
				$("#findNewPasswordIdHidden").val($("#findPasswordId").val());
			}else{
				$("#findPasswordMsg1").text("인증번호가 일치하지않습니다.").css("color","red");
			}
		
 		});//end	
 		
 		
 		
 		
 		
 		
 		//새로운비밀번호 
 		$("#findNewPasswordBtn").click(function(){
 			const newPassword = $("#findNewPassword").val();
 			
 			if(! regPassword.test(newPassword)){
 				$("#findPasswordMsg2").text("비밀번호를 다시작성해주세요").css("color","red");
 			}
 			if($("#findNewPassword").val() != $("#findNewPasswordCheck").val()){
 				$("#findPasswordMsg2").text("비밀번호가 일치하지 않습니다.").css("color","red");
 			}
 			if(newPassword === $("#findNewPasswordCheck").val()){
 			
 				$.ajax({
 					url: "UserNewPassword",
 					type: "post",
 					data: JSON.stringify({
 						"password":$("#findNewPasswordCheck").val(),
 						"id":$("#findNewPasswordIdHidden").val()
 					}),
 					contentType: "application/json",
 					async: false,
 					success: function(result){
 					if(result == 1){
 					$("#profile-tab-pane1").attr("hidden",true);
 					$("#profile-tab-pane2").attr("hidden",true);
					$("#profile-tab").attr("data-bs-target","#profile-tab-pane3");
					$("#profile-tab-pane3").removeAttr("hidden");
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
 