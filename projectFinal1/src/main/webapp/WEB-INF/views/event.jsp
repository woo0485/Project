<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row">
	<div class="col-10 offset-1">
		<div class="row border-bottom border-second border-4">
			<div class="col">
				<h1 class="mt-5 mb-4">이벤트</h1>
			</div>
			<c:if test="${sessionScope.id ne null}">
				<div
					class="col d-flex align-items-end justify-content-end pb-4 pe-5">
					<a href="eventWriteForm" style="color: black;"><i
						class="bi bi-pencil">글쓰기</i></a>
				</div>
			</c:if>
		</div>
		<div class="row">
			<div class="col pe-0 ps-0">
				<nav>
					<div class="nav nav-tabs" id="nav-tab" role="tablist">
						<button class="nav-link active col-4 rounded-0 fs-4 eventtab" id="nav-home-tab"
							data-bs-toggle="tab" data-bs-target="#nav-home" type="button"
							role="tab" aria-controls="nav-home" aria-selected="true" style="color: black; padding-top: 15px; padding-bottom: 15px;">진행중 이벤트</button>
						<button class="nav-link col-4 rounded-0 fs-4 eventtab" id="nav-profile-tab" data-bs-toggle="tab"
							data-bs-target="#nav-profile" type="button" role="tab"
							aria-controls="nav-profile" aria-selected="false" style="color: black;">종료된 이벤트</button>
						<button class="nav-link col-4 rounded-0 fs-4 eventtab" id="nav-contact-tab" data-bs-toggle="tab"
							data-bs-target="#nav-contact" type="button" role="tab"
							aria-controls="nav-contact" aria-selected="false" style="color: black;">당첨자 발표</button>
					</div>
				</nav>
				<div class="tab-content" id="nav-tabContent">
					<div class="tab-pane fade show active" id="nav-home"
						role="tabpanel" aria-labelledby="nav-home-tab" tabindex="0">진행중</div>
					<div class="tab-pane fade" id="nav-profile" role="tabpanel"
						aria-labelledby="nav-profile-tab" tabindex="0">종료</div>
					<div class="tab-pane fade" id="nav-contact" role="tabpanel"
						aria-labelledby="nav-contact-tab" tabindex="0">발표</div>
				</div>
			</div>
		</div>
	</div>
</div>