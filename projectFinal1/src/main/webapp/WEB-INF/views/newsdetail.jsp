<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row">
	<div class="col">
		<div class="row border-top border-secondary">
			<div class="col-10 offset-1 fs-2 fw-bolder pt-5">${newsdetail.newstitle}</div>
		</div>
		<div class="row">
			<div class="col-10 offset-1 mt-3 mb-4">
				${newsdetail.newsuploaddate}&emsp;&nbsp;${newsdetail.newswriter}</div>
		</div>
		<div class="row">
			<div class="col-10 offset-1">
				<img alt="" src="${newsdetail.newsimage}" style="width: 100%">
			</div>
		</div>
		<div class="row">
			<div class="col-10 offset-1 fs-5 mt-4">${newsdetail.newscontent}</div>
		</div>
	</div>
</div>