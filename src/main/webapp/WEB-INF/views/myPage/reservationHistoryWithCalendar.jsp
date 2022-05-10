<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/views/common/meta.jsp"%>
<title>치스토리-마이페이지</title>

<meta charset='utf-8' />
<!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) -->
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<!-- jquery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- fullcalendar CDN -->
<link
	href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css'
	rel='stylesheet' />
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<!-- fullcalendar 언어 CDN -->
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<style>
/* body 스타일 */
html, body {

	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	/* font-size: 12px; */
}
/* 캘린더 위의 해더 스타일(날짜가 있는 부분) */
.fc-event-time{
	font-size:1px;
	white-space:normal;
}
.fc-event-title{
	display:none;
}

.fc-daygrid-event-dot{
 
}
.fc-header-toolbar {
	padding-top: 1em;
	padding-left: 1em;
	padding-right: 1em;
}

.modal {
	position: absolute;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.1);
	top: 0;
	left: 0;
	display: none;
}
.fc-daygrid-event-dot {
	margin: 0px;
}
.modal_content {
	animation-name: modalcontent;
	animation-duration: 1s;
	animation-direction: forwards;
	width: 400px;
	height: 70%;
	background: #fff;
	border-radius: 10px;
	position: relative;
	top: 30%;
	left: 50%;
	margin-top: -100px;
	margin-left: -200px;
	text-align: center;
	box-sizing: border-box;
	padding: 74px 0;
	line-height: 23px;
	cursor: pointer;
}
@keyframes modalcontent{
	0% { left:50%; top:70%; background-color:#fff; }
	100%  { left:50%; top:30%; background-color:#fff; }
}
</style>
</head>
<%@ include file="/WEB-INF/views/common/loading.jsp" %>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<body class="located-at-bottom-of-header">
	<h1 id="loading" style="font-size: 2rem;">치아를 모으는 중입니다....</h1>
	<!-- calendar 태그 -->
	<div id='calendar-container'>
		<div id='calendar'></div>
	</div>

	<div class="modal">
		<div class="modal_content">
			<h5 id="description">text</h5><span id="date" class="ml-3">text</span>
			<hr>
			<h5 id="title">text</h5>
		</div>
	</div>

	<script>

(function(){
	
	$(function(){
		
// calendar element 취득
		var calendarEl = $('#calendar')[0];
// full-calendar 생성하기
		var calendar = new FullCalendar.Calendar(calendarEl, {
		height: '700px', // calendar 높이 설정
		expandRows: false, // 화면에 맞게 높이 재설정
		slotMinTime: '08:00', // Day 캘린더에서 시작 시간
		slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
		
		
// 해더에 표시할 툴바
		headerToolbar: {
			left: 'prev',
			center: 'title',
			right: 'next'
},
			initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
			navLinks: false, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
			editable: false, // 수정 가능?
			selectable: true, // 달력 일자 드래그 설정가능
			nowIndicator: true, // 현재 시간 마크
			dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
			locale: 'ko', // 한국어 설정

			eventClick: function(info) {
			   	//모달띄우기
			
			$(".modal").fadeIn();

			$("#date").text((info.event.start.toLocaleString()).slice(0, -3));
		    $("#title").text(info.event.title);
		    $("#description").text(info.event.extendedProps.description);
			info.el.style.borderColor = 'red';
			//모달 띄워져있는거 클릭시 없어짐
			$(".modal_content").click(function(){
		   	$(".modal").fadeOut();
		     }); 
			 },

			// 이벤트 start=예약날짜(selectday) title= 병원이름?(denname), description=예약정보

			events: testList
			 

			});
			// 캘린더 랜더링
			
			calendar.render();
			});
			})();
</script>
	<script>
	$("#loading").show();
	getData();
	let testList = [];
	
	function gethistorys() {
		let myDentistList = ${myDentistList}.myDentistList;
		
		const promise = new Promise((resolve, reject) => {
			let list = [];
			// 사용자의 모든 '내 치과'에 예약정보를 확인해서 받아오는 통신.
			for(let i=0; i < myDentistList.length; i++) {
				$.ajax({
					url: "http://localhost:" + myDentistList[i].dendomain + "/springframework-mini-project-dentist/reservation/reservationList",
					method:"POST",
					async: false,
					data: {
						patientssn: "${patientssn}"
					}
				})
				.done((data) => {
					console.log(data.reservationList);
					data.reservationList.forEach((element) => {
						list.push(	{title: element.resdesc
									, description: myDentistList[i].denname
									, start: element.selecteddate + " " +element.selectedtime
									, color: "#6A5ACD"}
						)
					})
				});
			}
			// 사용자의 모든 '내 치과'에 진료정보를 확인해서 받아오는 통신.
			for(let i=0; i < myDentistList.length; i++) {
				$.ajax({
					url: "http://localhost:" + myDentistList[i].dendomain + "/springframework-mini-project-dentist/treatment/getTreatmentByssn",
					method:"POST",
					async: false,
					data: {
						patientssn: "${patientssn}"
					}
				})
				.done((data) => {
					data.treatment.forEach((element) => {
						let newDate = element.treatdate.substr(0,4) + "-" +  element.treatdate.substr(6,2) + "-" + element.treatdate.substr(10,2);
						list.push(	{title: element.treattype
									, description: data.denname
									, start: newDate
									, color: "#FF5675"}
						)
					})
				});
			}
			console.log("allList", list);
			
			if(list != null) {
				resolve(list);
			} else {
				reject({message: "실패"});
			}
			
		});
		return promise;
	}
	
	async function getData() {
		try {
			data = await gethistorys();
			console.log("data", data);
			testList = data;
			$("#loading").hide();
		} catch (error) {
			console.log(error, "error");
		} finally {
			
		}
	}
	</script>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>