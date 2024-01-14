<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row">
	<div class="col-10 offset-1">
		<input type="hidden" value="${sessionScope.id}" id="id">
		<div class="row border-top border-secondary row-content">
			<div class="col-10 offset-1 fs-2 fw-bolder pt-5 mb-5">${currentEvent.eventtitle}</div>
		</div>
		<div class="row row-content">
			<div class="col-10 offset-1">
				<img alt="" src="resources/upload/${currentEvent.eventimage}"
					style="width: 100%; height: 900px;">
			</div>
		</div>
		<div class="row mt-3">
			<div class="col-3 offset-1">
				<a onclick="handleClick(1)" style="cursor: pointer;"><img alt=""
					src="resources/upload/1.png" style="width: 100%"
					class="luckyBagImage"></a>
			</div>
			<div class="col-3 ms-5">
				<a onclick="handleClick(2)" style="cursor: pointer;"><img alt=""
					src="resources/upload/2.png" style="width: 100%"
					class="luckyBagImage"></a>
			</div>
			<div class="col-3 ms-5">
				<a onclick="handleClick(3)" style="cursor: pointer;"><img alt=""
					src="resources/upload/3.png" style="width: 100%"
					class="luckyBagImage"></a>
			</div>
		</div>
		<div class="row mt-3">
			<div class="col text-center">
				<span id="resultText" class="fs-2"></span>
			</div>
		</div>
		<div class="row">
			<div class="col offset-1 fs-4 mt-5">
				<i class="bi bi-check2-square"></i><span class="ms-3 fw-bolder">참여
					대상 </span><span>: ${currentEvent.participationtarget}</span>
			</div>
		</div>
		<div class="row">
			<div class="col offset-1 fs-4 mt-3">
				<i class="bi bi-check2-square"></i><span class="ms-3 fw-bolder">참여
					방법 </span><span>: ${currentEvent.participationmethod}</span>
			</div>
		</div>
		<div class="row">
			<div class="col offset-1 fs-4 mt-3">
				<i class="bi bi-check2-square"></i><span class="ms-3 fw-bolder">제공
					혜택 </span><span>: ${currentEvent.benefitsprovided}</span>
			</div>
		</div>
		<div class="row">
			<div class="col offset-1 fs-4 mt-3">
				<i class="bi bi-check2-square"></i><span class="ms-3 fw-bolder">참여
					기간 </span><span>: ${currentEvent.eventopendate} ~
					${currentEvent.eventclosedate}</span>
			</div>
		</div>
		<div class="row mt-1 mb-5">
			<div class="col offset-1">
				<p class="fs-3 mt-5" style="color: #FFD700;">이벤트 유의사항</p>
				<span class="fs-5">• 5만원 이상의 상품에 대한 제세공과금은 당첨자 본인이 부담합니다.</span><br>
				<span class="fs-5">• 중복, 부정 참여로 확인되는 경우 이벤트 추첨 대상자에서 제외됩니다.</span><br>
				<span class="fs-5">• 경품은 판매자의 사정에 따라 변경될 수도 있습니다.</span><br> <span
					class="fs-5">• 수집된 개인정보는 1개월 후 파기 됩니다.</span>
			</div>
		</div>
	</div>
</div>
<script>

let currentUserInfo;

window.onload = function() {
	  const resultTextElement = document.getElementById('resultText');
	  const images = document.querySelectorAll('.luckyBagImage');
	  const userId = document.getElementById('id').value;

	  const usersInfo = JSON.parse(localStorage.getItem('usersInfo'));

	  if (usersInfo) {
	    const currentUserInfo = usersInfo.find(user => user.userId === userId);

	    if (currentUserInfo && hasClickedToday(currentUserInfo.lastClickedDate, userId)) {
	      resultTextElement.innerText = '오늘은 이미 참여하셨습니다.';
	      images.forEach((image) => {
	        image.style.opacity = 0.5;
	      });
	    }
	  }
	};

	function handleClick(imageNumber) {
		  const resultText = document.getElementById('resultText');
		  const images = document.querySelectorAll('.luckyBagImage');
		  const userId = document.getElementById('id').value;
		  const usersInfo = JSON.parse(localStorage.getItem('usersInfo')) || [];
		  const currentUserInfo = usersInfo.find(user => user.userId === userId);
		  
		  if (!userId) {
		    alert('로그인 후 참여 가능합니다.');
		    return;
		  }

		  if (!hasClickedToday(currentUserInfo ? currentUserInfo.lastClickedDate : null, userId)) {
		    const probability = Math.random();

		    images.forEach((image) => {
		      image.style.opacity = 0.5;
		    });

		    recordClickToday(userId);

		    if (probability < 0.33) {  	
		      resultText.innerText = '5% 할인쿠폰이 발급되었습니다. 마이페이지에서 확인하세요!';
		      $.ajax({
		            url: "eventCoupon",
		            method: "POST",
		            data : { couponno : 2, id : userId },
		            success: function(response) {
		                
		            console.log("Ajax success:", response);
		            
		            },
		            error: function(xhr, status, error) {
		                
		                console.error("Ajax error:", status, error);
		                
		            }
		        });
		    } else if(probability >= 0.33 && probability < 0.66){
		      resultText.innerText = '10% 할인쿠폰이 발급되었습니다. 마이페이지에서 확인하세요!';
		      $.ajax({
		            url: "eventCoupon",
		            method: "POST",
		            data : { couponno : 3, id : userId },
		            success: function(response) {
		                
		            console.log("Ajax success:", response);
		            
		            },
		            error: function(xhr, status, error) {
		                
		                console.error("Ajax error:", status, error);
		                
		            }
		        });
		    } else {
		      resultText.innerText = '꽝! 다음기회에!';
		      resultText.style.color = 'red';
		    }

		  } else {
		    alert('하루에 한 번만 참여 가능합니다.');
		  }
		}

	function hasClickedToday(lastClickedDate, userId) {
		
		if (!lastClickedDate) {
		    return false;
		  }
		
		  const today = new Date().toLocaleDateString();
		  return lastClickedDate === today && userId;
		}

	function recordClickToday(userId) {
		  const today = new Date().toLocaleDateString();
		  const usersInfo = JSON.parse(localStorage.getItem('usersInfo')) || [];
		  const currentUserInfo = usersInfo.find(user => user.userId === userId);

		  if (currentUserInfo) {
		    currentUserInfo.lastClickedDate = today;
		  } else {
		    usersInfo.push({ userId, lastClickedDate: today });
		  }

		  localStorage.setItem('usersInfo', JSON.stringify(usersInfo));
		}
</script>