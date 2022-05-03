<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/common/meta.jsp" %>
	<title>치스토리-치과정보(지도)</title>
	<script>
		function goDentistDetail() {
			location.href = "dentistDetail?denno=" + ${denno};
		}
	</script>
</body>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<link rel="stylesheet" href="/springframework-mini-project/resources/css/reservation.css" />
	<div class="located-at-bottom-of-header">
	<div style="flex-direction: row; width: 10rem;">
		<div><a onclick=window.history.back()><i id="goBackIcon" class="fa-solid fa-angle-left fa-3x"></i></a></div>
		<div><span style="width: 30px"><p class="denname" style="font-size: 2rem; font-weight: 500;"></p></span></div>
	</div>
	<div id="map" style="width:100%;height:400px; margin-bottom:1rem;" onclick="moveRoadView()"></div>
	<div id="denninfo" onClick="goDentistDetail()">
		<span><p class="denname" style="font-size: 2rem; font-weight: 500;"></p></span><br/>
		<span><p id="denaddress" style="font-size: 1.2rem; font-weight: 300;"></p></span><br/>
		<span><p id="dencontact" style="font-size: 1.2rem; font-weight: 300;"></p></span>
	</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a472507b48c1bfef14f1f454d183ffb0"></script>
	<%-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4b29a2d04639a115f1a9cea4ad69f3b9"></script> --%>
	<script>
		$.ajax({
			// console.log('ajax 시작~~');
			method:"POST",
			url: "http://localhost:" + ${dendomain} + "/springframework-mini-project-dentist/deninfo/getdeninfo",
			// url: ${dendomain} + "/springframework-mini-project-dentist/deninfo/getdeninfo",
			data: {
			},
			async: false
		})
		.done((data) => {
			var DENNAME = data.denname; 
			var DENCONTACT = data.dencontact;
			var DENADDRESS = data.denaddress;
			var IMAGECONTENTTYPE = data.imagecontenttype;
			var IMAGEFILENAME = data.imagefilename;
			var DENOWNER = data.denowner;
			var DENREGISTNO = data.denregistno;
			var DENLONGITUDE = data.denlongitude;
			var DENLATITUDE = data.denlatitude;

			var mapContainer = document.getElementById('map'), // 지도를 표시할 div
			mapOption = { 
				center: new kakao.maps.LatLng(DENLONGITUDE, DENLATITUDE), // 지도의 중심좌표
				level: 3 // 지도의 확대 레벨
			};
			
			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			
			//마커를 표시할 위치와 title 객체 배열입니다 
			var positions = [	
				{
					title: DENNAME, 
					latlng: new kakao.maps.LatLng(DENLONGITUDE, DENLATITUDE)
				}
			];
			
			//마커 이미지의 이미지 주소입니다
			var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
			
			for (var i = 0; i < positions.length; i ++) {	
				// 마커 이미지의 이미지 크기 입니다
				var imageSize = new kakao.maps.Size(24, 35); 
				
				// 마커 이미지를 생성합니다    
				var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
				
				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
					map: map, // 마커를 표시할 지도
					position: positions[i].latlng, // 마커를 표시할 위치
					title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
					image : markerImage // 마커 이미지 
				});
			}
			
			//var iwContent = '<h5>오스템 임플란트</h5>';
			
			//인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
				content : DENNAME
			});
			
			//마커에 마우스오버 이벤트를 등록합니다
			kakao.maps.event.addListener(marker, 'mouseover', function() {
			infowindow.open(map, marker);
			});
			
			//마커에 마우스아웃 이벤트를 등록합니다
			kakao.maps.event.addListener(marker, 'mouseout', function() {
			infowindow.close();
			});
			
			//마커 클릭시 해당 치과 이동
			kakao.maps.event.addListener(marker, 'click', function() {
				window.location.href = '/springframework-mini-project/reservation/dentistDetail';
			});

			//지도 상단에 뒤로가기 아이콘 우측에 치과 이름 표시하기.
			let dennames = document.getElementsByClassName('denname');
			for( var i = 0; i < dennames.length; i++ ){
				dennames[i].innerHTML = DENNAME;
			}
			//지도 아래에 치과 이름, 주소, 연락처 띄우기.
			document.getElementById('denaddress').innerHTML = DENADDRESS;
			document.getElementById('dencontact').innerHTML = DENCONTACT;

		});
	</script>

	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</html>



