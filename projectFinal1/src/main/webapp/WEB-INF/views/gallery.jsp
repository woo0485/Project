<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="galleryList" value="${galleryList}"></c:set>

<div class="row">
	<div class="col-10 offset-1">

		<div class="row border-bottom border-second border-4">
			<div class="col">
				<h1 class="mt-5 mb-4">갤러리</h1>
			</div>
			<div class="col d-flex align-items-end justify-content-end pb-4 pe-5">
				<a href="galleryWriteForm" style="color: black;"><i
					class="bi bi-pencil">글쓰기</i></a>
			</div>
		</div>

		<div class="row">
			<div class="col-3 offset-9 mt-4 pe-0">
				<h5 class="ps-5">
					<span class="ps-4">• 최신순</span> <span class="ps-4 opacity-25">•
						인기순</span>
				</h5>
			</div>
		</div>
		<div class="row ms-4 mt-2 mb-4">
			<c:forEach var="gallery" items="${galleryList}">
				<div class="col-4 mt-5" data-bs-toggle="modal"
					data-bs-target="#exampleModal">
					<div class="row">
						<div class="col">
							<img alt="" src="https://via.placeholder.com/300x200">
						</div>
					</div>
					<div class="row">
						<div class="col text-end pe-5">
							<span class="fs-4">${gallery.gallerygoodcount}</span> <span class="fs-4">♡</span>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<span class="fs-2 fw-bolder">${gallery.gallerytitle}</span>
						</div>
					</div>
					<div class="row mb-2 mt-3">
						<div class="col text-center">
							<span>${gallery.galleryuploaddate}</span>
						</div>
					</div>
				</div>
				<div class="modal fade" id="exampleModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel">핑크뮬리</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<div id="carouselExampleIndicators" class="carousel slide">
									<div class="carousel-indicators">
										<button type="button"
											data-bs-target="#carouselExampleIndicators"
											data-bs-slide-to="0" class="active" aria-current="true"
											aria-label="Slide 1"></button>
										<button type="button"
											data-bs-target="#carouselExampleIndicators"
											data-bs-slide-to="1" aria-label="Slide 2"></button>
										<button type="button"
											data-bs-target="#carouselExampleIndicators"
											data-bs-slide-to="2" aria-label="Slide 3"></button>
										<button type="button"
											data-bs-target="#carouselExampleIndicators"
											data-bs-slide-to="3" aria-label="Slide 4"></button>
									</div>
									<div class="carousel-inner">
										<div class="carousel-item active">
											<img src="https://via.placeholder.com/500x400"
												class="d-block w-100" alt="...">
										</div>
										<div class="carousel-item">
											<img src="https://via.placeholder.com/500x400"
												class="d-block w-100" alt="...">
										</div>
										<div class="carousel-item">
											<img src="https://via.placeholder.com/500x400"
												class="d-block w-100" alt="...">
										</div>
										<div class="carousel-item">
											<img src="https://via.placeholder.com/500x400"
												class="d-block w-100" alt="...">
										</div>
									</div>
									<button class="carousel-control-prev" type="button"
										data-bs-target="#carouselExampleIndicators"
										data-bs-slide="prev">
										<span class="carousel-control-prev-icon" aria-hidden="true"></span>
										<span class="visually-hidden">Previous</span>
									</button>
									<button class="carousel-control-next" type="button"
										data-bs-target="#carouselExampleIndicators"
										data-bs-slide="next">
										<span class="carousel-control-next-icon" aria-hidden="true"></span>
										<span class="visually-hidden">Next</span>
									</button>
								</div>
							</div>
							<div class="modal-body text-end py-0">
								<span class="fs-4">67</span> <span class="fs-4">♡</span>
							</div>
							<div class="modal-body text-end">작성자 : 이예슬</div>
							<div class="modal-body">내용</div>
							<div class="modal-body">SYSDATE()</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>

	</div>
</div>