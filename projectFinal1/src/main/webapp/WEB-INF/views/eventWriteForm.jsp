<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#eventCloseDate {
	display: inline-block;
	font-size: 20px;
	margin-bottom: 8px;
	width: 200px;
}

input[type="date"] {
	padding: 10px;
	width: 100%;
	border: 1px solid #ccc;
	border-radius: 4px;
	font-size: 16px;
	outline: none;
}

input[type="date"]:focus {
	border-color: #3498db;
}
</style>
<div class="row">
	<div class="col-10 offset-1">

		<div class="row border-bottom border-second border-4">
			<div class="col">
				<h1 class="mt-5 mb-4">이벤트</h1>
			</div>
			<div class="col d-flex align-items-end justify-content-end pb-3 pe-5">
				<span class="fs-5">게시물 작성</span>
			</div>
		</div>
		<form action="eventUpload" method="post"
			enctype="multipart/form-data" id="galleryUploadForm">
			<div class="row mt-5">
				<div class="col-8 offset-2" style="display: flex; align-items: center; height: 100%">
					<label for="myDate" id="eventCloseDate">이벤트 종료 날짜 : </label> <input type="date"
						id="myDate" name="myDate" required="required">
				</div>
			</div>
			<div class="row mt-4">
				<div class="col-8 offset-2">
					<div class="input-group input-group-lg">
						<span class="input-group-text" id="inputGroup-sizing-lg">제목</span>
						<input type="text" class="form-control"
							aria-label="Sizing example input"
							aria-describedby="inputGroup-sizing-lg" name="eventtitle" required="required">
					</div>
				</div>
			</div>
			<div class="row mt-4">
				<div class="col-8 offset-2">
					<label for="exampleFormControlTextarea1" class="form-label fs-5">내용</label>
					<textarea class="form-control" id="exampleFormControlTextarea1"
						rows="10" name="eventcontent" required="required"></textarea>
				</div>
			</div>
			<div class="row mt-5" style="display: none;" id="eventImageDetail">
				<div class="col-8 offset-2" id="previewContainer"></div>
			</div>
			<div class="row mt-3">
				<div class="col-8 offset-2 form-group">
					<label for="imageInput" class="form-label"><span
						class="fs-5">이벤트 이미지 한개를 선택하세요.</span><br></label> <input
						class="form-control form-control-lg" id="imageInput" type="file"
						name="images" required="required">
				</div>
			</div>
			<div class="row mt-3">
				<div class="col-8 offset-2" id="selectedImages"></div>
			</div>
			<div class="row mt-4">
				<div class="col text-center">
					<input type="submit" class="btn btn-secondary" value="등록하기">
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

						if (selectedFiles.length > 1) {

							previewContainer.innerHTML = '';
							selectedImagesContainer.innerHTML = '';

							var imageTitleDiv = document.createElement('div');
							imageTitleDiv.textContent = "최대 1개의 파일까지만 선택 가능합니다.";
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
									img.style.maxWidth = '100%';
									img.style.maxHeight = '100%';
									previewContainer.appendChild(img);
								};

								reader.readAsDataURL(file);
							}
						}

						document.getElementById('eventImageDetail').style.display = 'block';

					});
</script>