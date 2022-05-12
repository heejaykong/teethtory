<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/common/meta.jsp" %>
	<title>치스토리 - 마이페이지</title>
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/appIcon.png">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPage/main.css">
</head>
<body>
	<%@ include file="/WEB-INF/views/common/loading.jsp" %>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<main class="main located-at-bottom-of-header">
		<%-- 마이페이지 프로필블록 --%>
		<section class="profile-block">
			<div class="mypage__profile__img">
				<c:if test="${headerInfo.backgroundColor != null && headerInfo.backgroundColor eq 'fa-seedling'}"><i class="fa-solid fa-seedling" id="header-seedling"></i></c:if>
				<c:if test="${headerInfo.backgroundColor != null && headerInfo.backgroundColor eq 'fa-pagelines'}"><i class="fa-brands fa-pagelines" id="header-pagelines"></i></c:if>
				<c:if test="${headerInfo.backgroundColor != null && headerInfo.backgroundColor eq 'fa-tree'}"><i class="fa-solid fa-tree" id="header-tree"></i></c:if>
				<c:if test="${headerInfo.doctor != null}"><i class="fa-solid fa-circle-check docterCheck" id="header-doctor"></i></c:if>
			</div>
			<p class="name">${headerInfo.name}</p>
			<span class="email">${headerInfo.email}</span>
		</section>
		
		<%-- 옅은 회색 분리막대 --%>
		<div class="thick-divider"></div>
		
		<%-- 마이페이지 메뉴블록 --%>
		<nav class="mypage__nav-block">
			<ul class="menu-list">
				<a class="menu-btn" href="myDentist">
					<span class="menu-btn__icon"><i class="fa-solid fa-house-medical"></i></span>
					<li class="menu-btn__name">내 치과</li>
				</a>
				<a class="menu-btn" href="myReservationList">
					<span class="menu-btn__icon"><i class="fa-solid fa-hospital-user"></i></span>
					<li class="menu-btn__name">예약 현황</li>
				</a>
				<a class="menu-btn-style-2" href="myPointList">
					<div class="menu-btn-style-2__col">
						<span class="menu-btn__icon"><i class="fa-solid fa-circle-dollar-to-slot"></i></span>
						<li class="menu-btn__name">내 포인트</li>
					</div>
					<div class="menu-btn-style-2__col">
						<span class="mypoint__amount">
							<fmt:formatNumber type="number" maxFractionDigits="3" value="${headerInfo.point}" />
						</span>
						<span class="mypoint__arrow-right">
							<i class="fa-solid fa-chevron-right"></i>
						</span>
					</div>
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
	</main>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
