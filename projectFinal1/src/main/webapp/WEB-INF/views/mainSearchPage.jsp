<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div class="row">
	<div class="col">
	   
	   <div class="row mt-5">
		   <div class="col offset-1 my-5 border-bottom">
			<h2>검색 결과</h2>
		   </div>
		   <div class="col offset-1 my-5 border-bottom">
			
		   </div>
	   </div>
	  
	   
		<div class="row">
		    <div class="col">
		    	
		    
					<ul class="nav nav-pills nav-justified mb-5 offset-1" id="pills-tab" role="tablist">
					  <li class="nav-item" role="presentation">
					    <button class="nav-link active " id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true">전체</button>
					  </li>
					  <li class="nav-item" role="presentation">
					    <button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">축제상품</button>
					  </li>
					  <li class="nav-item" role="presentation">
					    <button class="nav-link" id="pills-contact-tab" data-bs-toggle="pill" data-bs-target="#pills-contact" type="button" role="tab" aria-controls="pills-contact" aria-selected="false">축제기사</button>
					  </li>
					  <li class="nav-item" role="presentation">
					    <button class="nav-link" id="pills-disabled-tab" data-bs-toggle="pill" data-bs-target="#pills-disabled" type="button" role="tab" aria-controls="pills-disabled" aria-selected="false">갤러리</button>
					  </li>
					</ul>
					<div class="tab-content" id="pills-tabContent">
					  <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab" tabindex="0">
					  
					  	<h3>축제 정보</h3>
					  	<div class="row border my-5">
					  		<div class="col">
					  		<!-- 축제정보 -->
							  	<div class="row">
							  <c:forEach var="searchProduct" items="${mainSearchProduct}" end="3">
						  		<c:if test="${empty searchProduct}">
								   <div class="col">
									"<span>${keyword}</span>"<span style="font-size: 25px;">에 관련된 축제 정보가 존재하지 않습니다.</span>
								   </div>
						  	 	</c:if>
							    <c:if test="${not empty searchProduct}">
					    		
									<div class="col-3 my-2">
								  		<div class="card" style="width: 18rem;">
										 <a href="productDetail?productno=${searchProduct.productno}"><img src="${searchProduct.productimage}" class="card-img-top" alt="..." style="height: 250px;"></a> 
											  <div class="card-body" style="height: 170px;">
												  <div class="card-text fw-bold fs-5"><a href="productDetail?no=${searchProduct.productno}">${searchProduct.productname}</a></div>
												  <div class="card-text" style="overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; word-wrap:break-word;">
												 	<a href="productDetail?no=${searchProduct.productno}">${searchProduct.productcontent}</a> 
											  </div>
										  </div>
									  </div>
							    	</div>
							    </c:if>
							  </c:forEach>
							   	</div>
							</div>
					  		<div id="seeMoreProduct" class="col-12 d-flex align-items-center justify-content-center border-top fw-bold" style="height: 100px; font-size: 20px; cursor: pointer;"><span><i class="bi bi-zoom-in"></i>더보기</span></div>
					  		</div>
					  	
					  	<h3>축제 기사</h3>
					  	<div class="row border my-5">
					  		<div class="col">
					  		<!-- 기사 -->
						  	<c:forEach var="searchNews" items="${mainSearchNews}" end="2">
						  		<c:if test="${empty searchNews}">
							  	<div class="row">
								   <div class="col">
									"<span>${keyword}</span>"<span style="font-size: 25px;">에 관련된 기사가 존재하지 않습니다.</span>
								   </div>
							   	</div>
							  	</c:if>
						  		<c:if test="${not empty searchNews}">
									<div class="row mt-4">
										<div class="col-3" style="height: 230px;">
											<a href="newsdetail?no=${searchNews.newsno}"> <img alt="" src="${searchNews.newsimage}"
												style="width: 100%; height: 100%"></a>
										</div>
										<div class="col-9">
											<div class="row mt-4">
												<div class="col fs-3"
													style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
													<a href="newsdetail?no=${searchNews.newsno}" style="text-decoration: none; color: black;">${searchNews.newstitle}</a>
												</div>
											</div>
											<div class="row mt-4">
												<div class="col fs-4 news-text-target"
													style="text-overflow: ellipsis; height: 102px;">
													<a href="newsdetail?no=${searchNews.newsno}" style="text-decoration: none; color: black;"> ${searchNews.newscontent}</a>
												</div>
											</div>
										</div>
									</div>
								</c:if>
							</c:forEach>
							
						
							<div id="seeMoreNews" class="col-12 d-flex align-items-center justify-content-center border-top fw-bold" style="height: 100px; font-size: 20px; cursor: pointer;"><span><i class="bi bi-zoom-in"></i>더보기</span></div>
					  		</div>
					  		</div>
					  	<h3>갤러리</h3>
					  	<div class="row border my-5">
					  		<div class="col">
					  		<!-- 갤러리 -->
							  	<div class="row">
								  <c:forEach var="searchGallery" items="${mainSearchGallery}" end="3">
						  			<c:if test="${empty searchGallery}">
								   <div class="col">
									"<span>${keyword}</span>"<span style="font-size: 25px;">에 관련된 갤러리가 존재하지 않습니다.</span>
								   </div>
							  	</c:if>
								    <c:if test="${not empty searchGallery}">
										<div class="col-3 my-2">
									  		<div class="card" style="width: 18rem;">
											 <a href="roductDetail?productno=${searchGallery.galleryno}"><img src="resources/upload/${searchGallery.galleryimage[0]}" class="card-img-top" alt="..." style="height: 250px;"></a> 
											  <div class="card-body" style="height: 170px;">
												    <div class="card-text fw-bold fs-5">${searchGallery.gallerytitle}</div>
												  <div class="card-text" style="overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; word-wrap:break-word;">
												 	<p>${searchGallery.gallerycontent}</p> 
												  </div>
												  <div class="card-text">작성자 : ${searchGallery.gallerywriter}</div>
											  </div>
										  </div>
										</div>							    	
								    </c:if>
								  </c:forEach>
							   	</div>
								  
								</div>
					  		</div>
					  		<div id="seeMoreGallery" class="col-12 d-flex align-items-center justify-content-center border-top fw-bold" style="height: 100px; font-size: 20px; cursor: pointer; "><span><i class="bi bi-zoom-in"></i>더보기</span></div>
					  	</div>
					  
					  </div>
					  <div class="tab-content" id="nav-tabContent">
					  <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab" tabindex="0">
				    	<div class="row">
							  <c:forEach var="searchProduct" items="${mainSearchProduct}">
							    <c:if test="${not empty searchProduct}">
					    		
									<div class="col-3 my-2">
								  		<div class="card" style="width: 18rem;">
										 <a href="productDetail?productno=${searchProduct.productno}"><img src="${searchProduct.productimage}" class="card-img-top" alt="..." style="height: 250px;"></a> 
											  <div class="card-body" style="height: 170px;">
												  <div class="card-text fw-bold fs-5"><a href="productDetail?no=${searchProduct.productno}">${searchProduct.productname}</a></div>
												  <div class="card-text" style="overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; word-wrap:break-word;">
												 	<a href="productDetail?no=${searchProduct.productno}">${searchProduct.productcontent}</a> 
											  </div>
										  </div>
									  </div>
							    	</div>
							    </c:if>
						  		<c:if test="${empty searchProduct}">
								   <div class="col">
									"<span>${keyword}</span>"<span style="font-size: 25px;">에 관련된 축제 정보가 존재하지 않습니다.</span>
								   </div>
						  	</c:if>
							  </c:forEach>
							   	</div>
					  </div>
					  
					  <div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab" tabindex="0">
					  	<c:forEach var="searchNews" items="${mainSearchNews}">
						  		<c:if test="${not empty searchNews}">
									<div class="row mt-4">
										<div class="col-3" style="height: 230px;">
											<a href="newsdetail?no=${searchNews.newsno}"> <img alt="" src="${searchNews.newsimage}"
												style="width: 100%; height: 100%"></a>
										</div>
										<div class="col-9">
											<div class="row mt-4">
												<div class="col fs-3"
													style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
													<a href="newsdetail?no=${searchNews.newsno}" style="text-decoration: none; color: black;">${searchNews.newstitle}</a>
												</div>
											</div>
											<div class="row mt-4">
												<div class="col fs-4 news-text-target"
													style="text-overflow: ellipsis; height: 102px;">
													<a href="newsdetail?no=${searchNews.newsno}" style="text-decoration: none; color: black;"> ${searchNews.newscontent}</a>
												</div>
											</div>
										</div>
									</div>
								</c:if>
						  		<c:if test="${empty searchNews}">
							  	<div class="row">
								   <div class="col">
									"<span>${keyword}</span>"<span style="font-size: 25px;">에 관련된 기사가 존재하지 않습니다.</span>
								   </div>
							   	</div>
							  	</c:if>
							</c:forEach>
						
					  </div>
					  
					  
					  <div class="tab-pane fade" id="pills-disabled" role="tabpanel" aria-labelledby="pills-disabled-tab" tabindex="0">
					  	
					  	<div class="row">
					  		<div class="col">
					  		<!-- 갤러리 -->
						  		<div class="row">
								  <c:forEach var="searchGallery" items="${mainSearchGallery}" >
						  			<c:if test="${empty searchGallery}">
								   <div class="col">
									"<span>${keyword}</span>"<span style="font-size: 25px;">에 관련된 갤러리가 존재하지 않습니다.</span>
								   </div>
							  	</c:if>
								    <c:if test="${not empty searchGallery}">
										<div class="col-3 my-2">
									  		<div class="card" style="width: 18rem;">
											<img src="resources/upload/${searchGallery.galleryimage[0]}" class="card-img-top" alt="..." style="height: 250px;">
											  <div class="card-body" style="height: 170px;">
												  <div class="card-text fw-bold fs-5">${searchGallery.gallerytitle}</div>
												  <div class="card-text" style="overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; word-wrap:break-word;">
												 	<p>${searchGallery.gallerycontent}</p> 
												  </div>
												  <div class="card-text">작성자 : ${searchGallery.gallerywriter}</div>
											  </div>
										  </div>
										</div>							    	
								    </c:if>
								  </c:forEach>
							   	</div>
					  		</div>
					  	</div>
					</div>
				</div>
		    	</div>
		    </div>
		</div>
	</div>
	