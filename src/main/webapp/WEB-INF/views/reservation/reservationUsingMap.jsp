<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/common/meta.jsp" %>
	<title>치스토리 - 치과정보</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reservation/reservationUsingMap.css" />
</head>
<body>
	<%@ include file="/WEB-INF/views/common/loading.jsp" %>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	
	<main class="main located-at-bottom-of-header">
		<div class="map-header background-gray">
			<div id="goBackIcon">
				<a onclick = window.history.back()><i class="fa-solid fa-angle-left"></i></a>
			</div>
			<h1 class="denname"><%-- 치과 이름 --%></h1>
		</div>
		
		<%-- 지도 --%>
		<div id="map"></div>

		<div class="modal">
			<div class="modal_content">
				<div id="denninfo">
					<span><p class="denname" style="font-size: 2rem; font-weight: 500; color:rgb(242, 101, 34);"></p></span><br/>
					<span><p id="denaddress" style="font-size: 1.2rem; font-weight: 300;"></p></span><br/>
					<span><p id="dencontact" style="font-size: 1.2rem; font-weight: 300;"></p></span>
					<button class="btn-large-solid"style="margin-top:1rem;"onClick="goDentistDetail()">상세보기</button>
				</div>
			</div>
		</div>
		
		<%-- 지도 아래 치과 정보 --%>
		<div class="map-bottom background-gray" onclick="goDentistDetail()">
			<h3 class="map-bottom__denname"></h3>
			<p class="map-bottom__denaddress"></p>
			<span class="map-bottom__dencontact">01--222</span>
		</div>
	</main>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a472507b48c1bfef14f1f454d183ffb0"></script>
	<script>
		function goDentistDetail() {
			location.href = "dentistDetail?dendomain=" + ${dendomain};
		}
	</script>
	<script>
		$.ajax({
			method:"POST",
			url: "http://localhost:" + ${dendomain} + "/springframework-mini-project-dentist/deninfo/getdeninfo",
			data: {},
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
			
			//지도 상단에 뒤로가기 아이콘 우측에 치과 이름 표시하기.
			let dennames = document.getElementsByClassName('denname');
			for( var i = 0; i < dennames.length; i++ ){
				dennames[i].innerHTML = DENNAME;
			}
			//모달에 치과 이름, 주소, 연락처 띄우기.
			$('#denaddress').html(DENADDRESS);
			$('#dencontact').html(DENCONTACT);
			
			//지도 아래에 치과 이름, 주소, 연락처 띄우기.			
			$('.map-bottom__denname').html(DENNAME);
			$('.map-bottom__denaddress').html(DENADDRESS);
			$('.map-bottom__dencontact').html(DENCONTACT);
			
			kakao.maps.event.addListener(marker,'click',function(){
				$(".modal").fadeIn();
          		$(".modal_content").click(function(){
        		$(".modal").fadeOut();
        		}); 
			})
		});
	</script>
	
	<%-- fontawesome CDN --%>
	<script src="https://kit.fontawesome.com/f58f043c2e.js" crossorigin="anonymous"></script>
</body>
</html>



