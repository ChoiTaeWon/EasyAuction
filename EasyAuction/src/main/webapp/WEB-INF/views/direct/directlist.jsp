<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
	<meta charset="utf-8" />
	<title>Easy Auction 직거래</title>
	<link rel="Stylesheet" type="text/css" href="/easyauction/resources/styles/body-style.css"/>
	<link rel="Stylesheet" type="text/css" href="/easyauction/resources/styles/style.css"/>
</head>

	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
	
  <script>
	function initialize() {

		/*
			http://openapi.map.naver.com/api/geocode.php?key=f32441ebcd3cc9de474f8081df1e54e3&encoding=euc-kr&coord=LatLng&query=서울특별시 강남구 강남대로 456
            위의 링크에서 뒤에 주소를 적으면 x,y 값을 구할수 있습니다.
		*/
		var Y_point			= 35.87110100714382;		// Y 좌표
		var X_point			= 128.60169690333006;		// X 좌표

		var zoomLevel		= 16;						// 지도의 확대 레벨 : 숫자가 클수록 확대정도가 큼

		var markerTitle		= "테스트";				// 현재 위치 마커에 마우스를 오버을때 나타나는 정보
		var markerMaxWidth	= 300;						// 마커를 클릭했을때 나타나는 말풍선의 최대 크기

		// 말풍선 내용
		var contentString	= '<div>' +
		'<h2>위즈소프트</h2>'+
		'<p>위즈소프트는 WEB Agency & SI 분야에서 10년 이상의 풍부한 경험을 보유한<br />' +
        '전문 인력으로 구성된 E-Business 전문 기업입니다.</p>' +
		'<a href="showdeal.action" target="_blank">123412341234</a>'+
		'</div>';

		var myLatlng = new google.maps.LatLng(Y_point, X_point);
		var mapOptions = {
							zoom: zoomLevel,
							center: myLatlng,
							mapTypeId: google.maps.MapTypeId.ROADMAP
		}
		var map = new google.maps.Map(document.getElementById('map_view'), mapOptions);

		var marker = new google.maps.Marker({
												position: myLatlng,
												map: map,
												title: markerTitle
		});

		var infowindow = new google.maps.InfoWindow(
													{
														content: contentString,
														maxWidth: markerMaxWidth
													}
		);

		 google.maps.event.addListener(marker, 'click', function() {
			infowindow.open(map, marker);
		});
		/* google.maps.event.addDomListener(window, 'load', initialize); */
	}
    </script>

<body onload="initialize()">

	<div id="wrap">
		<div id="top">
			<c:import url="/WEB-INF/views/include/header.jsp" />
		</div>
		<br/>
		
		<div style="width: 960px;float: left;padding: 0 0 0 0;margin: 0 0 0 0;">
			<table style="width: 100%" >
				<tr>
					<td style="text-align:left;width: 95%">
						<img src="/easyauction/resources/images/direct_deal_ko.png" style="width: 100px;height: 31px">
						<img src="/easyauction/resources/images/direct_deal_en.png" style="width: 125px;height: 31px">
					</td>
				
					<td style="text-align:center;width: 5%"><a href="dealregister.action">
					<img  src="/easyauction/resources/images/write.png" style="padding-bottom: 5px"></a></td>
				</tr>
			</table>
		</div>
		
		
		<div id="map_view" class="mapview"></div>
		
	<br /><br/>
		
		
		
		<section id="wrapper">
		    <article>
		      <p>Finding your location: <span id="status">checking...</span></p>
		    </article>
		    
			<script>
					function success(position) {
					  var s = document.querySelector('#status');
					  
					  if (s.className == 'success') {
					    // not sure why we're hitting this twice in FF, I think it's to do with a cached result coming back    
					    return;
					  }
					  
					  s.innerHTML = "found you!";
					  s.className = 'success';
					  
					  var mapcanvas = document.createElement('div');
					  mapcanvas.id = 'mapcanvas';
					  mapcanvas.style.height = '400px';
					  mapcanvas.style.width = '950px';
					    
					  document.querySelector('article').appendChild(mapcanvas);
					  
					  var latlng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
					  var myOptions = {
					    zoom: 15,
					    center: latlng,
					    mapTypeControl: false,
					    navigationControlOptions: {style: google.maps.NavigationControlStyle.SMALL},
					    mapTypeId: google.maps.MapTypeId.ROADMAP
					  };
					  var map = new google.maps.Map(document.getElementById("mapcanvas"), myOptions);
					  
					  var marker = new google.maps.Marker({
					      position: latlng, 
					      map: map, 
					      title:"You are here! (at least within a "+position.coords.accuracy+" meter radius)"
					  });
					}
					
					function error(msg) {
					  var s = document.querySelector('#status');
					  s.innerHTML = typeof msg == 'string' ? msg : "failed";
					  s.className = 'fail';
					  
					  // console.log(arguments);
					}
					
					if (navigator.geolocation) {
					  navigator.geolocation.getCurrentPosition(success, error);
					} else {
					  error('not supported');
					}
			
			</script>
		
		</section>


		
		
		
		
		
		
		<br/>
		
		<div id="footer">
			<c:import url="/WEB-INF/views/include/footer.jsp" />
		</div>
		
	</div><!-- div wrap 끝 -->
</body>
</html>


