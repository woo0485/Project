<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 

 <script type="text/javascript">
$(document).ready(function(){
    var owl = $('.owl-carousel');
    
    owl.owlCarousel({
        items:4,                 // 한번에 보여줄 아이템 수
        loop:true,               // 반복여부
        margin:35,               // 오른쪽 간격
        autoplay:true,           // 자동재생 여부
        autoplayTimeout:2500,    // 재생간격
        autoplayHoverPause:true  //마우스오버시 멈출지 여부
    });    
    
    $('.customNextBtn').click(function() {
        owl.trigger('next.owl.carousel');
    })
    
    $('.customPrevBtn').click(function() {
        owl.trigger('prev.owl.carousel', [300]);
    })
});
</script>

<div class="row  mt-3">
	<div class="col-10  offset-1 mt-1">


		<div class="row">
			<div class="col">
			
				<div id="carouselExampleCaptions" class="carousel slide carousel-fade"  data-bs-ride="carousel">
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
				                        <a href="productDetail?productno=${product.productno}"><img src="${product.productimage}" class="d-block w-100" alt="..." style="height: 620px;"></a>
				                        <div class="carousel-caption d-none d-md-block">
				                            <h5 class="fs-3 fw-bold" style="text-shadow:black 2px 0 10px;">${product.productname}</h5>
				                            <p style="text-shadow:black 2px 0 10px; overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 1; -webkit-box-orient: vertical; word-wrap: break-word;">
				                                ${product.productcontent}
				                            </p>
				                        </div>
				                    </div>
				                </c:when>
				                <c:otherwise>
				                    <div class="carousel-item">
				                        <a href="productDetail?productno=${product.productno}"><img src="${product.productimage}" class="d-block w-100" alt="..." style="height: 620px;"></a>
				                        <div class="carousel-caption d-none d-md-block">
				                            <h5 class="fs-3 fw-bold" style="text-shadow:black 2px 0 10px;">${product.productname}</h5>
				                            <p style="text-shadow:black 2px 0 10px; overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 1; -webkit-box-orient: vertical; word-wrap: break-word;">
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
	
	
	<div class="row mt-5" id="latestNewsContainer" style="height: 463px;">
	    <div class="col">
	    <h4 class="fw-bold fs-3 pt-5">최신 축제기사</h4>
	        <c:forEach var="news" items="${newsList}" varStatus="newsLoop" end="10">
	            <div class="row news-item border-bottom mt-4" style="display: ${newsLoop.index <= 4 ? 'none' : 'block'};">
	                <a href="newsdetail?no=${news.newsno}" style="font-size: 25px; color: black;">${news.newstitle}</a>
	            </div>
	        </c:forEach>
	    </div>	
	</div>
	
	
	
	
		<div class="row my-5 owl-carousel owl-theme owl-loaded">
			<div class="col owl-stage-outer" style="margin-top: 100px;">
		 		<h4 class="fw-bold fs-3">갤러리</h4>
		 		<div class="owl-stage">
		  		<c:forEach var="gallery" items="${galleryList}" varStatus="galleryLoop">
					<div class="owl-item">
							<a href="galleryRedirect"><img class="img-responsive" style="width:100%; height: 300px;" src="resources/upload/${gallery.galleryimage[0]}" alt="이미지1"></a>
					</div>
				</c:forEach>
	   		  </div>
	  	 </div>
	 </div>
	
	
	
	
	
			

			
			
			
			
	</div>
</div>