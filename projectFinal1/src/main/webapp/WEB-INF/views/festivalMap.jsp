<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row">
	<div class="col-4 border border-primary" style="display: none;" id="festivalMapDetail">
		<div class="row">
			<div class="col text-center fs-1">
				<p class="productName mt-3"></p>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<img alt="" class="productImage" style="width: 100%; height: 300px;">
			</div>
		</div>
	</div>
	<div class="col" id="festivalMap">
		<div id="map" style="width: 100%; height: 900px;"></div>
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
		                	festivalMapDetail.style.maxHeight = '200px';
		                	var productName = document.getElementsByClassName('productName');
		                    productName[0].innerHTML = location.productname;
		                	var productImage = document.getElementsByClassName('productImage');
		                    productImage[0].src = location.productimage;
		                    
		                });
		            }
		            
		            processAddress(index + 1);
		        });
		    }
		}

		processAddress(0);

	</script>