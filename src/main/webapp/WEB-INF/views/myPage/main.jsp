<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/common/loading.jsp" %>
	<%@ include file="/WEB-INF/views/common/meta.jsp" %>
	<title>치스토리-마이페이지</title>

<style>
#profile{
    width: 100%;
    height: 100%;
    object-fit: cover;
   
}
#profileBox {
    width: 10rem;
    height: 10rem; 
    border-radius: 70%;
    overflow: hidden;
     border:1px solid black;
    margin:auto;
}
.container{
display:flex;
flex-direction:row;
}
a:link { color: red; text-decoration: none;}
a:visited { color: black; text-decoration: none;}
a:hover { color: orange; }
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

<div class="located-at-bottom-of-header">
      <div id="profileBox">
        <img src="/springframework-mini-project/resources/images/signOut.jpg" id="profile"style="width:100%;">
      </div>
      <div style="text-align:center;"><h2>${headerInfo.name}</h4></div>
      <div style="text-align:center;"><h3>${headerInfo.email}</h3></div>
      
    <div class="sidebar-menu__profile-block">
		<div class="profile">
			<div class="profile__img" style="background-color: ${headerInfo.backgroundColor}"></div>
			<div class="profile__nametag">
				<p class="name">
					<span id="username">${headerInfo.name}</span> 님
				</p>
				
				<a href="#">
					<p class="mypoint">
						<span class="mypoint__icon">
							<i class="fa-solid fa-circle-dollar-to-slot"></i>
						</span>
						<span class="mypoint__amount">
							${headerInfo.point}
						</span>
						<span class="mypoint__arrow-right">
							<i class="fa-solid fa-chevron-right"></i>
						</span>
					</p>
				</a>
			</div>
		</div>
	</div>
    <!-- 옅은 회색 분리막대 -->
	<div class="thick-divider"></div>
	
	<!-- 메뉴블록 -->
	<nav class="sidebar-menu__nav-block">
		<ul class="menu-list">
			<a class="menu-btn" href="myDentist">
				<span class="menu-btn__icon"><i class="fa-solid fa-house-chimney-medical"></i></span>
				<li class="menu-btn__name">내 치과</li>
			</a>
			<a class="menu-btn" href="myReservationList">
				<span class="menu-btn__icon"><i class="fa-solid fa-person-circle-check"></i></span>
				<li class="menu-btn__name">예약 현황</li>
			</a>
			<a class="menu-btn" href="myPointList">
				<span class="menu-btn__icon"><i class="fa-solid fa-coins"></i></span>
				<li class="menu-btn__name">내 포인트</li>
			</a>
			<a class="menu-btn" href="reservationHistoryWithCalendar">
				<span class="menu-btn__icon"><i class="fa-solid fa-calendar-day"></i></span>
				<li class="menu-btn__name">캘린더</li>
			</a>
			<a class="menu-btn" href="myInformation">
				<span class="menu-btn__icon"><i class="fa-solid fa-gear"></i></span>
				<li class="menu-btn__name">설정</li>
			</a>
		</ul>
	</nav>
</div>
<script>
	console.log(${headerInfo});

</script>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
