<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="id" value="${sessionScope.id}" />
<c:set var="name" value="${sessionScope.name}" />

<script>
	$(function() {

		var select = $('#galleryUploadWriterSelect');
		var writer = select.data('writer');

		if ($("#gallerymodifyid").val() == writer) {
			$("#gallerymodifyid").attr("selected", true);
		} else {
			$("#gallerymodifyname").attr("selected", true);
		}
	});
</script>

<div class="row">
	<div class="col-10 offset-1">

		<div class="row border-bottom border-second border-4">
			<div class="col">
				<h1 class="mt-5 mb-4">갤러리</h1>
			</div>
			<div class="col d-flex align-items-end justify-content-end pb-3 pe-5">
				<span class="fs-5">게시물 수정</span>
			</div>
		</div>
		<form action="galleryModify" method="post"
			enctype="multipart/form-data" id="galleryUploadForm">
			<input type="hidden" name="galleryno" value="${gallery.galleryno}">
			<div class="row mt-5">
				<div class="col-8 offset-2">
					<select class="form-select form-select-lg mb-3"
						aria-label="Large select example" name="gallerywriter"
						required="required" id="galleryUploadWriterSelect"
						data-writer="${gallery.gallerywriter}">
						<option value="${id}" id="gallerymodifyid">${id}</option>
						<option value="${name}" id="gallerymodifyname">${name}</option>
					</select>
				</div>
			</div>
			<div class="row mt-3">
				<div class="col-8 offset-2">
					<div class="input-group input-group-lg">
						<span class="input-group-text" id="inputGroup-sizing-lg">제목</span>
						<input type="text" class="form-control"
							aria-label="Sizing example input"
							aria-describedby="inputGroup-sizing-lg" name="gallerytitle"
							required="required" value="${gallery.gallerytitle}">
					</div>
				</div>
			</div>
			<div class="row mt-4">
				<div class="col-8 offset-2">
					<label for="exampleFormControlTextarea1" class="form-label fs-5">내용</label>
					<textarea class="form-control" id="exampleFormControlTextarea1"
						rows="10" name="gallerycontent" required="required">${gallery.gallerycontent}</textarea>
				</div>
			</div>
			<div class="row mt-5" style="display: none;" id="galleryImageDetail">
				<div class="col-8 offset-2" id="previewContainer"></div>
			</div>
			<div class="row mt-3">
				<div class="col-8 offset-2 form-group">
					<label for="imageInput" class="form-label"><span
						class="fs-5">사진을 선택하세요.<br><span style="color: lightcoral;">미입력시 사진은 그대로 유지됩니다.</span></span><br>
						<span style="font-size: 15px;">(사진 업로드는 최대 4개로 제한됩니다.)</span> </label> <input
						class="form-control form-control-lg" id="imageInput" type="file"
						name="images" multiple>
				</div>
			</div>
			<div class="row mt-3">
				<div class="col-8 offset-2" id="selectedImages"></div>
			</div>
			<div class="row mt-4">
				<div class="col text-center">
					<input type="submit" class="btn btn-secondary" value="수정하기">
				</div>
			</div>
		</form>
	</div>
</div>

<script>
	document
			.getElementById('imageInput')
			.addEventListener(
					'change',
					function(e) {

						var selectedFiles = e.target.files;

						var selectedImagesContainer = document
								.getElementById('selectedImages');

						var previewContainer = document
								.getElementById('previewContainer');
						previewContainer.innerHTML = '';

						while (selectedImagesContainer.firstChild) {
							selectedImagesContainer
									.removeChild(selectedImagesContainer.firstChild);
						}

						if (selectedFiles.length > 4) {

							previewContainer.innerHTML = '';
							selectedImagesContainer.innerHTML = '';

							var imageTitleDiv = document.createElement('div');
							imageTitleDiv.textContent = "최대 4개의 파일까지만 선택 가능합니다.";
							imageTitleDiv.style.fontSize = '20px';
							imageTitleDiv.style.color = 'red';
							selectedImagesContainer.appendChild(imageTitleDiv);

							document.getElementById('imageInput').value = '';

							return;
						}

						for (var i = 0; i < selectedFiles.length; i++) {

							var fileName = selectedFiles[i].name;

							var file = selectedFiles[i];

							var imageTitleDiv = document.createElement('div');
							imageTitleDiv.textContent = "선택된 이미지 " + (i + 1)
									+ " : " + fileName;

							selectedImagesContainer.appendChild(imageTitleDiv);

							if (file.type.startsWith('image/')) {

								var reader = new FileReader();

								reader.onload = function(e) {
									var img = document.createElement('img');
									img.src = e.target.result;
									img.style.maxWidth = '25%';
									img.style.maxHeight = '100%';
									previewContainer.appendChild(img);
								};

								reader.readAsDataURL(file);
							}
						}

						document.getElementById('galleryImageDetail').style.display = 'block';

					});
</script>