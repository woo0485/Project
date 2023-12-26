<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row">
	<div class="col-4 border border-primary" id="festivalMapDetail"
		style="display: none;">
		<div class="row">
			<div class="col text-center fs-3">
				<p class="productName mt-3"></p>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<img alt="" class="productImage" style="width: 100%; height: 250px;">
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
					<span>축제 기간 : </span> <span class="productopendate"></span> - <span class="productclosedate"></span>
				</p>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<p>
					<span>가격 : </span><span class="productPrice"></span><span> 원</span>
				</p>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<p>
					<span>주소 : </span><span class="productLocation"></span>
				</p>
			</div>
		</div>
	</div>
	<div class="col" id="festivalMap">
		<div id="map" style="width: 100%; height: 1100px;"></div>
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
		                    
		                });
		            }
		            
		            processAddress(index + 1);
		        });
		    }
		}

		processAddress(0);

	</script>