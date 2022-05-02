<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
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

      <div id="profileBox">
        <img src="/springframework-mini-project/resources/images/signOut.jpg" id="profile"style="width:100%;">
      </div>
      <div style="text-align:center;"><h2>홍길동</h4></div>
      <div style="text-align:center;"><h3>abcde@gmail.com</h3></div>
      <hr>
      <div class="container located-at-bottom-of-heade">
      <div>
      <i class="fa-solid fa-house-chimney-medical"></i>
      </div>
      <div style="margin-left:0.5rem; margin-bottom:0.5rem;"><a href="myDentist"><h4>내 치과</h4></a></div>
      </div>
      <div class="container">
      <div><i class="fa-solid fa-person-circle-check"></i></div>
      <div style="margin-left:0.5rem; margin-bottom:0.5rem;"><a href="myReservationList"><h4>예약 현황</h4></a></div>
      </div>

      <div class="container">
      <div><i class="fa-solid fa-coins"></i></div>
      <div style="margin-left:0.5rem; margin-bottom:0.5rem;"><a href="myPointList"><h4>내 포인트</h4></a></div>
      </div>
      <div class="container">
      <div><i class="fa-solid fa-calendar-day"></i></div>
      <div style="margin-left:0.5rem; margin-bottom:0.5rem;"><a href="reservationHistoryWithCalendar"><h4>캘린더</h4></a></div>
      </div>
      <div class="container">
      <div><i class="fa-solid fa-gear"></i></div>
      <div style="margin-left:0.5rem; margin-bottom:0.5rem;"><a href="myInformation"><h4>설정</h4></a></div>
      </div>


	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
