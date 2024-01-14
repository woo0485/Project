<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.overlay {
    position: absolute;
    top: 300px;
    left: 0;
    width: 100%;
    height: 50%;
    background-color: rgba(0, 0, 0, 0.8);
    z-index: 2;
    display: flex;
    justify-content: center;
    align-items: center;
    color: white;
}

.row-content {
    filter: grayscale(70%);
    pointer-events: none;
}
</style>

<div class="row">
	<div class="col-10 offset-1" style="position: relative;">
		<div class="row border-top border-secondary row-content">
			<div class="col-10 offset-1 fs-2 fw-bolder pt-5 mb-5">${pastEvent.eventtitle}</div>
		</div>
		<div class="row row-content">
			<div class="col-10 offset-1">
				<img alt="" src="resources/upload/${pastEvent.eventimage}"
					style="width: 100%; height: 900px;">
			</div>
		</div>
		<div class="row row-content">
			<div class="col-10 offset-1 fs-4 mt-4">${pastEvent.eventcontent}</div>
		</div>
		<div class="row my-3 row-content">
			<div class="col offset-1">
				<p class="fs-3 mt-5" style="color: #FFD700;">이벤트 유의사항</p>
				<span class="fs-5">• 5만원 이상의 상품에 대한 제세공과금은 당첨자 본인이 부담합니다.</span><br>
				<span class="fs-5">• 중복, 부정 참여로 확인되는 경우 이벤트 추첨 대상자에서 제외됩니다.</span><br>
				<span class="fs-5">• 경품은 판매자의 사정에 따라 변경될 수도 있습니다.</span><br> <span
					class="fs-5">• 수집된 개인정보는 1개월 후 파기 됩니다.</span>
			</div>
		</div>
		<div class="row overlay">
			<div class="col-10 offset-1">
				<div class="row">
					<div class="col">
						<h1 style="font-size: 80px; text-align: center; margin-bottom: 40px;">이벤트가 종료되었습니다.</h1>
						<h2 style="font-size: 50px; text-align: center;">다음 이벤트를 기대해주세요.</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>