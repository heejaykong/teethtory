<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>  
<style>

</style>

   
<div id="map" style="width:100%;height:400px; margin-bottom:1rem;"></div>
</section>
</div>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4b29a2d04639a115f1a9cea4ad69f3b9"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도 표시 div 
mapOption = { 
    center: new kakao.maps.LatLng(37.495031, 127.123998), // 지도의 중심좌표
    level: 3 // 지도 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도 생성 

//마커표시 위치
var markerPosition  = new kakao.maps.LatLng(37.495031, 127.123998); 

//마커 생성
var marker = new kakao.maps.Marker({
position: markerPosition
});

//마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

//마커 위에 정보
var iwContent = '<div style="padding:5px; text-align:center;"><h>Ant 치과</h></div>', // 문자 표시
iwPosition = new kakao.maps.LatLng(37.495031, 127.123998); //문자 표시 위치

//마커 위 치과 이름 생성
var infowindow = new kakao.maps.InfoWindow({
position : iwPosition, 
content : iwContent 
});

//마커 위에 치과 이름 표시
infowindow.open(map, marker); 

//마커 클릭시 해당 치과 이동
kakao.maps.event.addListener(marker, 'click', function() {
	window.location.href = '/springframework-mini-project/reservation/dentistDetail/';
});

</script>


<!-- cbf9332a5bce7cf86038a39b88018dd1 -->
<!-- https://map.kakao.com/link/search/치과 -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
