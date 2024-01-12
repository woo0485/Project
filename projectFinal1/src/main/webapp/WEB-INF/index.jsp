<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="resources/bootstrap/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.9.3/umd/popper.min.js"></script>
<script src="resources/js/yeseul.js?ver=1"></script>
<script src="resources/js/seongjin.js?ver=3"></script>
<script src="resources/js/wooseong.js?ver=1"></script>
<script src="resources/js/hyunju.js"></script>
<script src="resources/js/donggyun.js?ver=1"></script>
<link rel="stylesheet" href="resources/css/seongjin.css?ver=1">
<link rel="stylesheet" href="resources/css/donggyun.css">
<link rel="stylesheet" href="resources/css/wooseong.css">
<link rel="stylesheet" href="resources/css/hyunju.css">
<link rel="stylesheet" href="resources/css/yeseul.css">
<link rel="stylesheet" href="resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="resources/css/owl.theme.default.min.css">

</head>
<body>
	<div class="container">
		<%@ include file="template/header.jsp"%>
		<jsp:include page="${ param.bodydata }" />
		<%@ include file="template/footer.jsp"%>
		<div style="cursor:pointer; position: fixed; right: 150px; bottom: 100px;" onclick="window.scrollTo(0,0);">
			<i class="bi bi-arrow-up-square" style="font-size: 3em;"></i>
		</div>
	</div>
	<script src="resources/bootstrap/bootstrap.bundle.min.js"></script>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="resources/js/owl.carousel.min.js"></script>
</body>
</html>

