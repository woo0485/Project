<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<script>
	
		
	
</script>
 
<div class="row">
	<div class="col-10 offset-1">


		<div class="row">
			<div class="col">
			
				<div id="carouselExampleCaptions" class="carousel slide">
				    <div class="carousel-indicators">
				        <c:forEach var="product" items="${productList}" varStatus="productLoop" end="5">
				            <c:choose>
				                <c:when test="${productLoop.index == 0}">
				                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="${productLoop.index}" class="active" aria-current="true" aria-label="Slide ${productLoop.index}"></button>
				                </c:when>
				                <c:otherwise>
				                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="${productLoop.index}" aria-label="Slide ${productLoop.index}"></button>
				                </c:otherwise>
				            </c:choose>
				        </c:forEach>
				    </div>
				    
				    <div class="carousel-inner">
				        <c:forEach var="product" items="${productList}" varStatus="productLoop" end="5">
				            <c:choose>
				                <c:when test="${productLoop.index == 0}">
				                    <div class="carousel-item active">
				                        <img src="${product.productimage}" class="d-block w-100" alt="..." style="height: 500px;">
				                        <div class="carousel-caption d-none d-md-block">
				                            <h5>${product.productname}</h5>
				                            <p style="overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 1; -webkit-box-orient: vertical; word-wrap: break-word;">
				                                ${product.productcontent}
				                            </p>
				                        </div>
				                    </div>
				                </c:when>
				                <c:otherwise>
				                    <div class="carousel-item">
				                        <img src="${product.productimage}" class="d-block w-100" alt="..." style="height: 500px;">
				                        <div class="carousel-caption d-none d-md-block">
				                            <h5>${product.productname}</h5>
				                            <p style="overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 1; -webkit-box-orient: vertical; word-wrap: break-word;">
				                                ${product.productcontent}
				                            </p>
				                        </div>
				                    </div>
				                </c:otherwise>
				            </c:choose>
				        </c:forEach>
				    </div>
				    
				    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
				        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				        <span class="visually-hidden">Previous</span>
				    </button>
				    
				    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
				        <span class="carousel-control-next-icon" aria-hidden="true"></span>
				        <span class="visually-hidden">Next</span>
				    </button>
				</div>


			</div>
		</div>


	
	<div class="row my-5">
		<div class="col-1 d-flex align-items-center"><i class="bi bi-arrow-left-circle-fill" style="font-size: 2rem;"></i></div>
		<c:forEach var="gallery" items="${galleryList}" varStatus="galleryLoop" end="10">
			<div class="col gallery-item" style="display: ${galleryLoop.index <=4 ? 'inline' : 'none'};">
				<img style="width: 120%; height: 300px;" src="resources/upload/${gallery.galleryimage}" alt="이미지1">
			</div>
		</c:forEach>
		<div class="col-1 d-flex align-items-center"><i class="bi bi-arrow-right-circle-fill" style="font-size: 2rem;"></i></div>	
	</div>	
	
	
	
	
	<div class="row my-5" id="latestNewsContainer" style="height: 300px;">
	    <div class="col">
	    <h4>최신 축제기사</h4>
	        <c:forEach var="news" items="${newsList}" varStatus="newsLoop" end="10">
	            <div class="row news-item" style="display: ${newsLoop.index <= 4 ? 'none' : 'block'};">
	                <a href="#" style="font-size: 25px;">${news.newstitle}</a>
	            </div>
	        </c:forEach>
	    </div>	
	</div>
	
	<div class="row my-5">
		<div class="col">
			<div id="carouselExampleIndicators" class="carousel slide">
			  <div class="carousel-indicators">
			    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
			    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
			    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
			  </div>
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			      <img src="https://via.placeholder.com/800x200" class="" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="https://via.placeholder.com/800x200" class="" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="https://via.placeholder.com/800x200" class="" alt="...">
			    </div>
			  </div>
			  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			  </button>
			</div>
		</div>
	</div>	
	
	<div class="row my-5">
		<div class="col"><img src="https://via.placeholder.com/150x200" alt="이미지1"></div>
		<div class="col"><img src="https://via.placeholder.com/150x200" alt="이미지1"></div>
		<div class="col"><img src="https://via.placeholder.com/150x200" alt="이미지1"></div>
		<div class="col"><img src="https://via.placeholder.com/150x200" alt="이미지1"></div>	
	</div>		

			
			
			
			
	</div>
</div>