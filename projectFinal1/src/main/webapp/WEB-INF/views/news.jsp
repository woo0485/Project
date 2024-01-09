<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row">
	<div class="col-10 offset-1 mt-4">
	
		<c:forEach var="news" items="${newsList}">
			<div class="row mt-4">
				<div class="col-3" style="height: 230px;">
					<a href="newsdetail?no=${news.newsno}"> <img alt="" src="${news.newsimage}"
						style="width: 100%; height: 100%"></a>
				</div>
				<div class="col-9 border-top border-bottom border-2">
					<div class="row mt-4">
						<div class="col fs-3"
							style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
							<a href="newsdetail?no=${news.newsno}" style="text-decoration: none; color: black;">${news.newstitle}</a>
						</div>
					</div>
					<div class="row mt-4">
						<div class="col fs-4 news-text-target"
							style="text-overflow: ellipsis; height: 102px;">
							<a href="newsdetail?no=${news.newsno}" style="text-decoration: none; color: black;"> ${news.newscontent}</a>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>

	</div>
</div>