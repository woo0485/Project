<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="AreaMap" value="${fesivalAreaProduct}"></c:set>

<div class="row mt-5">
	<div class="col-4 border border-dark border-3 mt-2"
		style="border-radius: 17px; --bs-border-opacity: 0.3;">
		<div class="row mt-3 ps-2 pe-2">
			<div class="col text-center">
				<button type="button" class="btn btn-outline-dark btn-lg areabutton pe-3 ps-3" id="seoulProduct" style="width: 73px;">서울</button>
			</div>
			<div class="col text-center">
				<button type="button" class="btn btn-outline-dark btn-lg areabutton"
					id="incheonProduct" style="width: 73px;">인천</button>
			</div>
			<div class="col text-center">
				<button type="button" class="btn btn-outline-dark btn-lg areabutton"
					id="gangwonProduct" style="width: 73px;">강원</button>
			</div>
			<div class="col text-center">
				<button type="button" class="btn btn-outline-dark btn-lg areabutton ps-0 pe-0"
					id="daejeonProduct" style="font-size: 20px; width: 90px;">충북/충남</button>
			</div>
		</div>
		<div class="row mt-3 pb-3 border-bottom border-3 mb-3 ps-2 pe-2">
			<div class="col text-center">
				<button type="button" class="btn btn-outline-dark btn-lg areabutton" id="daeguProduct" style="width: 73px;">대구</button>
			</div>
			<div class="col text-center">
				<button type="button" class="btn btn-outline-dark btn-lg areabutton" id="busanProduct" style="width: 73px;">부산</button>
			</div>
			<div class="col text-center">
				<button type="button" class="btn btn-outline-dark btn-lg areabutton" id="jejuProduct" style="width: 73px;">제주</button>
			</div>
			<div class="col text-center">
				<button type="button" class="btn btn-outline-dark btn-lg ps-0 pe-0 areabutton"
					id="gwangjuProduct" style="font-size: 20px; width: 90px;">전남/전북</button>
			</div>
		</div>
		<div class="row">
			<div class="col" id="startInfo">
				<h4 class="areaName">서울</h4>
				<c:forEach var="seoulProduct" items="${AreaMap['seoul']}" end="3" varStatus="status">
					<div class="row seoulProduct mapProductList ${status.last ? '' : ' border-bottom'} pb-2">
						<div class="col">
							<h5 class="mt-1">${seoulProduct.productname}</h5>
							<a href="productDetail?productno=${seoulProduct.productno}"> <img alt="" src="${seoulProduct.productimage}"
								width="100%" height="200px;">
							</a>
						</div>
					</div>
				</c:forEach>
				<c:forEach var="incheonProduct" items="${AreaMap['incheon']}"
					end="3" varStatus="status">
					<div class="row incheonProduct mapProductList ${status.last ? '' : ' border-bottom'} pb-2"
						style="display: none;">
						<div class="col">
							<h4 class="mt-1">${incheonProduct.productname}</h4>
							<a href="productDetail?productno=${incheonProduct.productno}"> <img alt="" src="${incheonProduct.productimage}"
								width="100%" height="200px;">
							</a>
						</div>
					</div>
				</c:forEach>
				<c:forEach var="gangwonProduct" items="${AreaMap['gangwon']}"
					end="3" varStatus="status">
					<div class="row gangwonProduct mapProductList ${status.last ? '' : ' border-bottom'} pb-2"
						style="display: none;">
						<div class="col">
							<h4 class="mt-1">${gangwonProduct.productname}</h4>
							<a href="productDetail?productno=${gangwonProduct.productno}"> <img alt="" src="${gangwonProduct.productimage}"
								width="100%" height="200px;">
							</a>
						</div>
					</div>
				</c:forEach>
				<c:forEach var="daejeonProduct" items="${AreaMap['daejeon']}"
					end="3" varStatus="status">
					<div class="row daejeonProduct mapProductList ${status.last ? '' : ' border-bottom'} pb-2"
						style="display: none;">
						<div class="col">
							<h4 class="mt-1">${daejeonProduct.productname}</h4>
							<a href="productDetail?productno=${daejeonProduct.productno}"> <img alt="" src="${daejeonProduct.productimage}"
								width="100%" height="200px;">
							</a>
						</div>
					</div>
				</c:forEach>
				<c:forEach var="daeguProduct" items="${AreaMap['daegu']}" end="3" varStatus="status">
					<div class="row daeguProduct mapProductList ${status.last ? '' : ' border-bottom'} pb-2" style="display: none;">
						<div class="col">
							<h4 class="mt-1">${daeguProduct.productname}</h4>
							<a href="productDetail?productno=${daeguProduct.productno}"> <img alt="" src="${daeguProduct.productimage}"
								width="100%" height="200px;">
							</a>
						</div>
					</div>
				</c:forEach>
				<c:forEach var="gwangjuProduct" items="${AreaMap['gwangju']}"
					end="3" varStatus="status">
					<div class="row gwangjuProduct mapProductList ${status.last ? '' : ' border-bottom'} pb-2"
						style="display: none;">
						<div class="col">
							<h4 class="mt-1">${gwangjuProduct.productname}</h4>
							<a href="productDetail?productno=${gwangjuProduct.productno}"> <img alt="" src="${gwangjuProduct.productimage}"
								width="100%" height="200px;">
							</a>
						</div>
					</div>
				</c:forEach>
				<c:forEach var="busanProduct" items="${AreaMap['busan']}" end="3" varStatus="status">
					<div class="row busanProduct mapProductList ${status.last ? '' : ' border-bottom'} pb-2" style="display: none;">
						<div class="col">
							<h4 class="mt-1">${busanProduct.productname}</h4>
							<a href="productDetail?productno=${busanProduct.productno}"> <img alt="" src="${busanProduct.productimage}"
								width="100%" height="200px;">
							</a>
						</div>
					</div>
				</c:forEach>
				<c:forEach var="jejuProduct" items="${AreaMap['jeju']}" end="3" varStatus="status">
					<div class="row jejuProduct mapProductList ${status.last ? '' : ' border-bottom'} pb-2" style="display: none;">
						<div class="col">
							<h4 class="mt-1">${jejuProduct.productname}</h4>
							<a href="productDetail?productno=${jejuProduct.productno}"> <img alt="" src="${jejuProduct.productimage}"
								width="100%" height="200px;">
							</a>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="row">
			<div class="col" id="festivalMapDetail" style="display: none;">
				<div class="row">
					<div class="col text-center fs-3">
						<p class="productName mt-3"></p>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<img alt="" class="productImage"
							style="width: 100%; height: 270px;">
					</div>
				</div>
				<div class="row">
					<div class="col">
						<p class="productContent mt-3" style="font-size: 18px;"></p>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<p class="mt-3">
							<span>&nbsp;축제 기간 : </span> <span class="productopendate"></span>
							- <span class="productclosedate"></span>
						</p>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<p>
							<span>&nbsp;가격 : </span><span class="productPrice"></span><span>원</span>
						</p>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<p>
							<span>&nbsp;주소 : </span><span class="productLocation"></span>
						</p>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<p>
							<span>&nbsp;남은티켓 : </span><span class="productRemainTicket"></span>
						</p>
					</div>
				</div>
				<div class="row">
					<div class="col mb-3">
						<a class="productDetail btn btn-outline-dark">상세보기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col" id="festivalMap">
		<div id="map" style="width: 100%; height: 1250px;"></div>
	</div>
</div>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=abce31385331908a9e09f4180abae798&libraries=services"></script>
<script>
		var mapContainer = document.getElementById('map'),
		
		mapOption = {
			center : new kakao.maps.LatLng(37.5642135, 126.97500),
			level : 6
		};

		var map = new kakao.maps.Map(mapContainer, mapOption);

		var geocoder = new kakao.maps.services.Geocoder();
		
		document.getElementById('seoulProduct').addEventListener('click', function() {
	        moveMapCenter(37.5642135, 126.97500, 7);
	    });
		document.getElementById('incheonProduct').addEventListener('click', function() {
	        moveMapCenter(37.4563, 126.7052, 8);
	    });
		document.getElementById('gangwonProduct').addEventListener('click', function() {
	        moveMapCenter(37.5556, 128.2094, 10);
	    });
		document.getElementById('daejeonProduct').addEventListener('click', function() {
	        moveMapCenter(36.3504, 127.3845, 10);
	    });
		document.getElementById('daeguProduct').addEventListener('click', function() {
	        moveMapCenter(35.8714, 128.6014, 10);
	    });
		document.getElementById('busanProduct').addEventListener('click', function() {
	        moveMapCenter(35.1796, 129.0756, 8);
	    });
		document.getElementById('jejuProduct').addEventListener('click', function() {
	        moveMapCenter(33.4890, 126.4983, 9);
	    });
		document.getElementById('gwangjuProduct').addEventListener('click', function() {
	        moveMapCenter(35.1595, 126.8514, 11);
	    });
		
		function moveMapCenter(latitude, longitude, zoomLevel) {
		    var newCenter = new kakao.maps.LatLng(latitude, longitude);
		    
		    map.setCenter(newCenter);
		    map.setLevel(zoomLevel);

		}

		function makeOverListener(map, marker, infowindow) {
			return function() {
				infowindow.open(map, marker);
			};
		}

		function makeOutListener(infowindow) {
			return function() {
				infowindow.close();
			};
		}
		
		function formatDate(timestamp) {
			  if (!timestamp || isNaN(timestamp)) {
			    console.log("Invalid timestamp:", timestamp);
			    return "--";
			  }

			  const date = new Date(timestamp);
			  console.log("Formatted date:", date);

			  const year = date.getFullYear();
			  const month = (date.getMonth() + 1).toString().padStart(2, '0');
			  const day = date.getDate().toString().padStart(2, '0');

			  
			  return year + "." + month + "." + day;
			}
		
		var locationList = ${festivalMap};

		function processAddress(index) {
		    if (index < locationList.length) {
		        var location = locationList[index];
		        geocoder.addressSearch(location.productlocation, function(result, status) {
		        	
		            if (status === kakao.maps.services.Status.OK) {
		                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		                var marker = new kakao.maps.Marker({
		                    map: map,
		                    position: coords,
		                    data : location
		                });
		                
		                var infowindow = new kakao.maps.InfoWindow({
		                    content: "<div style='font-size: 20px; width:260px;'>" + location.productname +
		                    "<img alt='' src='" + location.productimage + "' style='width:100%; height:170px;'></div>"
		                });
		                kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		                kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
		                kakao.maps.event.addListener(marker, 'click', function() {
		                	var festivalStartInfo = document.getElementById('startInfo');
		                	festivalStartInfo.style.display = 'none';
		                	var festivalMapDetail = document.getElementById('festivalMapDetail');
		                	festivalMapDetail.style.display = 'block';
		                	var productName = document.getElementsByClassName('productName');
		                    productName[0].innerHTML = location.productname;
		                	var productImage = document.getElementsByClassName('productImage');
		                    productImage[0].src = location.productimage;
		                	var productContent = document.getElementsByClassName('productContent');
		                	productContent[0].innerHTML = location.productcontent;
		                	const startDate = location.productopendate;
		                	const endDate = location.productclosedate;
		                	var productOpenDate = document.querySelector('.productopendate');
		                	productOpenDate.innerHTML = formatDate(startDate);
		                	var productCloseDate = document.querySelector('.productclosedate');
		                	productCloseDate.innerHTML = formatDate(endDate);
		                	var productLocation = document.querySelector('.productLocation');
		                	productLocation.innerHTML = location.productlocation;
		                	var productPrice = document.querySelector('.productPrice');
		                	productPrice.innerHTML = location.productprice;
		                	var productRemainTicket = document.querySelector('.productRemainTicket');
		                	if( location.productremainticketcount == 0 ){
		                		productRemainTicket.innerHTML = "매진";
		                	} else {
		                		productRemainTicket.innerHTML = location.productremainticketcount + "장";
		                	}
		                	var productDetail = document.querySelector('.productDetail');
		                	productDetail.href = "productDetail?productno=" + location.productno;
		                	
		                    
		                });
		            }
		            
		            processAddress(index + 1);
		        });
		    }
		}

		processAddress(0);

	</script>