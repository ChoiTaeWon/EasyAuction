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
	<script src="http://code.jquery.com/jquery-1.11.3.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
</head>

 <script type="text/javascript">
 var addressListResult = null;
 var setLatlngAddress = [];
 var latitude =null;
 var longitude =null;
 var geocoder = new google.maps.Geocoder();
 var memberResult = null;
 
 $(function(){
	
 	$.ajax({
		url : "/easyauction/ajax/selectMembersAddress.action",
		async : false,
		type : "GET",
		success : function(members){
			memberResult = members;
			$("#indicator").css("display", "block");
			theNext();
		},
		error : function(){
			alert("members 불러오기 에러");
		}
	}); 
	
 });
 var delay = 100;
 var nextAddress = 0;
 function theNext() {
     if (nextAddress < memberResult.length) {
       setTimeout('getAddress(theNext)', delay);

     } else {
       // We're done. Show map bounds
       //map.fitBounds(bounds);
    	 viewMarker();
    	 //alert("7777777777777777777");
    	 $("#indicator").css("display", "none");
    	 
     }
   }

 
 function getAddress(next) {
	 var item = memberResult[nextAddress];
  	 geocoder.geocode({'address': item.mbAddress1}, function(results, status) {
 
         // If that was successful
         if (status == google.maps.GeocoderStatus.OK) {
        	 latitude = results[0]['geometry']['location']['lat']();
             longitude = results[0]['geometry']['location']['lng']();
             //alert(address+"의 위도는 " + lat + " 이며, 경도는" + lng + " 입니다.");
             var obj = {
						"mbId" : item.mbId,
						"latitude" : latitude , 
						"longitude" : longitude
						}
			setLatlngAddress.push(obj);
           //createMarker(search,lat,lng);
         }
         // ====== Decode the error status ======
         else {
           // === if we were sending the requests to fast, try this one again and increase the delay
           if (status == google.maps.GeocoderStatus.OVER_QUERY_LIMIT) {
             nextAddress--;
             delay++;
           } else {
             /* var reason="Code "+status;
             var msg = 'address="' + search + '" error=' +reason+ '(delay='+delay+'ms)<br>';
             document.getElementById("messages").innerHTML += msg; */
           }   
         }
         nextAddress++;
         next();
       }
     );
   }
 
</script>    
    
 <script type="text/javascript">
	 var markers = [];
	 var map;
	 var geocoder;
	 var infowindow = null;
	
	 var latitude = 0;
	 var longitude = 0;
	 
	 function initialize() {
	 	geocoder = new google.maps.Geocoder();
	
	 	// GPS 인식 가능 여부(현재 위치)
	 	if (navigator.geolocation) {
	 		navigator.geolocation.getCurrentPosition(function (pos) {
	 			// 현재 위경도 값(GPS) 변수에 넣기.
	 			var latitude = pos.coords.latitude;
	 			var longitude = pos.coords.longitude;
	 			var mapOptions = {
	 				zoom: 14,
	 				mapTypeId: google.maps.MapTypeId.ROADMAP,
	 				center: new google.maps.LatLng(latitude,longitude)
	 			};
	 			map = new google.maps.Map(document.getElementById('map'),mapOptions);
	 			// 현재 위치 마커 생성
	 			var marker = new google.maps.Marker({
	 				position: new google.maps.LatLng(latitude,longitude),
	 				map: map,
	 				draggable: false,
	 				icon: "http://maps.google.com/mapfiles/ms/micons/man.png"
	 			});
	 			markers.push(marker);
	 			
	 			
	 			// 현재 위치 기준 원 그리기
	 			var populationOptions = {
	 				strokeColor: '#000000',
	 				strokeOpacity: 0.6,
	 				strokeWeight: 2,
	 				fillColor: '#808080',
	 				fillOpacity: 0.5,
	 				map: map,
	 				center: new google.maps.LatLng(latitude,longitude) ,
	 				radius: 1300
	 			};
	 			cityCircle = new google.maps.Circle(populationOptions);
	
	 			viewMarker();
	
		 		}, function (error) {
		 			switch (error.code) {
		 			case 1:
		 				$("#errormsg").html("User denied the request for Geolocation.");
		 				break;
		 			case 2:
		 				$("#errormsg").html("Location information is unavailable.");
		 				break;
		 			case 3:
		 				$("#errormsg").html("The request to get user location timed out.");
		 				break;
		 			case 0:
		 				$("#errormsg").html("An unknown error occurred.");
		 				break;
		 			}
	 		});
	 	} else {
	 		alert("Geolocation is not supported by this browser.");
	 	}
	 }

 
 // 드롭 마커 보기
 function viewMarker() {
	 var markerList = setLatlngAddress;
		var listLen = markerList.length;
		
		for(var i=0; i<listLen; i++){
			var markerId = markerList[i].mbId;
			var marker = new google.maps.Marker({
				position: new google.maps.LatLng(markerList[i].latitude,markerList[i].longitude),
				map: map,
				draggable: false,
				animation: google.maps.Animation.DROP,
				title : "회원 [" + markerList[i].mbId + "]의 게시글 목록"
				//html: markerList[i].cont
				//icon: markerList[i].icon,
			});
			
			addMarkerListener(marker, markerId);
			
			markers.push(marker);
			
			
		}
		
		
		
		
 }
 
 function addMarkerListener(marker, markerId){
	 google.maps.event.addListener(marker, "click", function () {
			
			
			var contentString="<div>"+ markerId +"님의 게시물 목록</div><br/>";
		 	$.ajax({
				url : "/easyauction/ajax/selectAuctionListByAucWriter.action",
				async : false,
				type : "GET",
				data : {
					mbId : markerId
				},
				success : function(auctions){
					if(auctions != null){
						//auction{mbId, title, content, ...뭐 이렇게 올건데 1회원에 2이상 게시물 있을 수있음}
						$.each(auctions, function(index, item){
							
							var tempString	= '<div>' +
							'<h2>'+item.aucItemName+'</h2>'+
							'<p>'+item.aucAdText+'</p>' +
							'<a href="showdeal.action?aucno='+item.aucNo+'" target="_blank">'
							+ item.aucTitle +'</a></div><br/><br/>';
							contentString = contentString + tempString; 
						});
						
					}
					else{
						var tempString = '<div>'
							+'<h2>'+ item.mbId+'님의 게시물</h2>'
							+'<p>회원님이 올린 게시물이 없습니다</p></div>';
						contentString = contentString + tempString; 
					}
					
				},
				error : function(){
					alert("auctions 불러오기 에러");
				}
			}); 
			
		 	var infowindow = new google.maps.InfoWindow({
		 		content: contentString,
				maxWidth: 500
		 	});
		 	
			infowindow.setContent(contentString);
			infowindow.open(map, this);
		});
		
	 
 }

 // 마커 제거 함수
 function fnRemoveMarker(){
 	for (var i = 1; i < markers.length; i++) {
 		markers[i].setMap(null);
 	}
 }

 $( window ).load(function() {
 	initialize();
 });

  
 </script>  

<body>

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
				
					<td style="text-align:center;width: 5%"><a href="directregister.action">
					<img  src="/easyauction/resources/images/write.png" style="padding-bottom: 5px"></a></td>
				</tr>
			</table>
		</div>
		
		<!-- <div id="panel">
                   <input id="address" type="textbox" value="Seoul"> 
                   <input type="button" value="GO" onclick="codeAddress()">
         </div>
         <br/>          
		<div id="map_view" class="mapview"></div>
		 -->
		
		<div id="map" style="width:960px;height:500px;margin-top:20px;"></div>
		<input type="button" value="마커 삭제" onclick="Javascript:fnRemoveMarker();" />
		<input type="button" value="마커 읽어오기" onclick="Javascript:viewMarker();" />
		
		
	<br /><br/>

		<br/>
		
		<div id="footer">
			<c:import url="/WEB-INF/views/include/footer.jsp" />
		</div>
		
	</div><!-- div wrap 끝 -->
	
	<div id="indicator" style="position: absolute;z-index: 1;left: 500px;top: 500px;display: none">
		<h1>기다려주세여</h1>
	</div>
</body>
</html>


