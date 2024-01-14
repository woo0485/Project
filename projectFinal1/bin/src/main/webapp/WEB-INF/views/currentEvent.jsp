<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row">
	<div class="col-10 offset-1">
		<div class="row border-top border-secondary row-content">
			<div class="col-10 offset-1 fs-2 fw-bolder pt-5 mb-5">${currentEvent.eventtitle}</div>
		</div>
		<div class="row row-content">
			<div class="col-10 offset-1">
				<img alt="" src="resources/upload/${currentEvent.eventimage}"
					style="width: 100%; height: 900px;">
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
					기간 </span><span>: ${currentEvent.eventopendate} ~ ${currentEvent.eventclosedate}</span>
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