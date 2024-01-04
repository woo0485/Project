<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="row">
	<div class="col-10 offset-1">

		<div class="row border-bottom border-second border-4">
			<div class="col">
				<h1 class="mt-5 mb-4">갤러리</h1>
			</div>
			<c:if test="${sessionScope.id ne null}">
				<div
					class="col d-flex align-items-end justify-content-end pb-4 pe-5">
					<a href="galleryWriteForm" style="color: black;"><i
						class="bi bi-pencil">글쓰기</i></a>
				</div>
			</c:if>
		</div>

		<div class="row">
			<div class="col-3 offset-9 mt-4 pe-0">
				<h5 class="ps-5">
					<a href="#" style="color: black;" id="galleryDateLatest"><span
						class="ps-4">• 최신순</span></a> <a href="#" style="color: black;"
						id="galleryDatePopularity"><span class="ps-4 opacity-25">•
							인기순</span></a>
				</h5>
			</div>
		</div>
		<div class="row mt-2 mb-4" id="galleryContainer">
			<c:forEach var="gallery" items="${galleryList}" varStatus="status">
				<div class="col-4 mt-5">
					<div class="row">
						<div class="col" data-bs-toggle="modal"
					data-bs-target="#exampleModal${status.index}">
							<img alt="" src='resources/upload/${gallery.galleryimage[0]}'
								style="width: 100%; height: 270px;">
						</div>
					</div>
					<div class="row">
						<div class="col pe-4"
							style="display: flex; align-items: center; justify-content: flex-end;">
							<span class="fs-4 gallery-count" data-code="${gallery.galleryno}">${gallery.gallerygoodcount}</span> <span
								class="fs-1 galleryheart" style="cursor: pointer;" data-code="${gallery.galleryno}">♡</span>
						</div>
					</div>
					<div class="row">
						<div class="col" data-bs-toggle="modal"
					data-bs-target="#exampleModal${status.index}">
							<span class="fs-2 fw-bolder ps-3">${gallery.gallerytitle}</span>
						</div>
					</div>
					<div class="row mb-2 mt-3">
						<div class="col text-center" data-bs-toggle="modal"
					data-bs-target="#exampleModal${status.index}">
							<span>${gallery.galleryuploaddate}</span>
						</div>
					</div>
				</div>
				<div class="modal fade" id="exampleModal${status.index}"
					tabindex="-1" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel">${gallery.gallerytitle}</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<div id="carouselExampleIndicators${status.index}"
									class="carousel slide">
									<div class="carousel-indicators">
										<button type="button"
											data-bs-target="#carouselExampleIndicators${status.index}"
											data-bs-slide-to="0" class="active" aria-current="true"
											aria-label="Slide 1"></button>
										<c:forEach var="index" begin="1"
											end="${fn:length(gallery.galleryimage) - 1}">
											<button type="button"
												data-bs-target="#carouselExampleIndicators${status.index}"
												data-bs-slide-to="${index}" aria-label="Slide ${index + 1}"></button>
										</c:forEach>
									</div>
									<div class="carousel-inner">
										<div class="carousel-item active">
											<img src="resources/upload/${gallery.galleryimage[0]}"
												class="d-block w-100" alt="..." style="height: 400px;">
										</div>
										<c:forEach var="index" begin="1"
											end="${fn:length(gallery.galleryimage) - 1}">
											<div class="carousel-item">
												<img src="resources/upload/${gallery.galleryimage[index]}"
													class="d-block w-100" alt="..." style="height: 400px;">
											</div>
										</c:forEach>
									</div>
									<c:if test="${fn:length(gallery.galleryimage) ne 1}">
										<button class="carousel-control-prev" type="button"
											data-bs-target="#carouselExampleIndicators${status.index}"
											data-bs-slide="prev">
											<span class="carousel-control-prev-icon" aria-hidden="true"
												style="background-color: gray;"></span> <span
												class="visually-hidden">Previous</span>
										</button>
										<button class="carousel-control-next" type="button"
											data-bs-target="#carouselExampleIndicators${status.index}"
											data-bs-slide="next">
											<span class="carousel-control-next-icon" aria-hidden="true"
												style="background-color: gray;"></span> <span
												class="visually-hidden">Next</span>
										</button>
									</c:if>
								</div>
							</div>
							<div class="modal-body text-end py-0">
								<span class="fs-4">${gallery.gallerygoodcount}</span> <span
									class="fs-4">♡</span>
							</div>
							<div class="modal-body text-end">작성자 :
								${gallery.gallerywriter}</div>
							<div class="modal-body">${gallery.gallerycontent}</div>
							<div class="modal-body">${gallery.galleryuploaddate}</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="row mt-2 mb-4" id="galleryContainer2"
			style="display: none;">
			<c:forEach var="gallery" items="${galleryList2}" varStatus="status">
				<div class="col-4 mt-5" data-bs-toggle="modal"
					data-bs-target="#exampleModal${status.index}_list2">
					<div class="row">
						<div class="col">
							<img alt="" src='resources/upload/${gallery.galleryimage[0]}'
								style="width: 100%; height: 270px;">
						</div>
					</div>
					<div class="row">
						<div class="col pe-4"
							style="display: flex; align-items: center; justify-content: flex-end;">
							<span class="fs-4">${gallery.gallerygoodcount}</span> <span
								class="fs-1" style="cursor: pointer;">♡</span>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<span class="fs-2 fw-bolder ps-3">${gallery.gallerytitle}</span>
						</div>
					</div>
					<div class="row mb-2 mt-3">
						<div class="col text-center">
							<span>${gallery.galleryuploaddate}</span>
						</div>
					</div>
				</div>
				<div class="modal fade" id="exampleModal${status.index}_list2"
					tabindex="-1" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel">${gallery.gallerytitle}</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<div id="carouselExampleIndicators${status.index}_list2"
									class="carousel slide">
									<div class="carousel-indicators">
										<button type="button"
											data-bs-target="#carouselExampleIndicators${status.index}_list2"
											data-bs-slide-to="0" class="active" aria-current="true"
											aria-label="Slide 1"></button>
										<c:forEach var="index" begin="1"
											end="${fn:length(gallery.galleryimage) - 1}">
											<button type="button"
												data-bs-target="#carouselExampleIndicators${status.index}_list2"
												data-bs-slide-to="${index}" aria-label="Slide ${index + 1}"></button>
										</c:forEach>
									</div>
									<div class="carousel-inner">
										<div class="carousel-item active">
											<img src="resources/upload/${gallery.galleryimage[0]}"
												class="d-block w-100" alt="..." style="height: 400px;">
										</div>
										<c:forEach var="index" begin="1"
											end="${fn:length(gallery.galleryimage) - 1}">
											<div class="carousel-item">
												<img src="resources/upload/${gallery.galleryimage[index]}"
													class="d-block w-100" alt="..." style="height: 400px;">
											</div>
										</c:forEach>
									</div>
									<c:if test="${fn:length(gallery.galleryimage) ne 1}">
										<button class="carousel-control-prev" type="button"
											data-bs-target="#carouselExampleIndicators${status.index}_list2"
											data-bs-slide="prev">
											<span class="carousel-control-prev-icon" aria-hidden="true"
												style="background-color: gray;"></span> <span
												class="visually-hidden">Previous</span>
										</button>
										<button class="carousel-control-next" type="button"
											data-bs-target="#carouselExampleIndicators${status.index}_list2"
											data-bs-slide="next">
											<span class="carousel-control-next-icon" aria-hidden="true"
												style="background-color: gray;"></span> <span
												class="visually-hidden">Next</span>
										</button>
									</c:if>
								</div>
							</div>
							<div class="modal-body text-end py-0">
								<span class="fs-4">${gallery.gallerygoodcount}</span> <span
									class="fs-4">♡</span>
							</div>
							<div class="modal-body text-end">작성자 :
								${gallery.gallerywriter}</div>
							<div class="modal-body">${gallery.gallerycontent}</div>
							<div class="modal-body">${gallery.galleryuploaddate}</div>
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