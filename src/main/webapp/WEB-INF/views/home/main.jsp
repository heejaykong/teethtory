<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>

	<%@ include file="/WEB-INF/views/common/meta.jsp" %>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home/home.css">
	<title>치스토리</title>
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/appIcon.png">
</head>
<body>
	<%@ include file="/WEB-INF/views/common/loading.jsp" %>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<main class="main located-at-bottom-of-header">
		<%-- 서비스 설명 --%>
		<section class="home-explain-section background-pale-peach" style="padding-bottom: 0;">
			<p class="sub-copy">
				치과 진료내역,<br/>
				한 곳에 모아볼 순 없을까?
			</p>
			<h1 class="main-copy">
				이젠 치스토리에서<br/>
				쉽게 확인하세요.
			</h1>
			<div class="home-explain-image">
				<img src="${pageContext.request.contextPath}/resources/images/intro/intro1_crop.png" alt="home main image 1">
			</div>
		</section>
		<section class="home-explain-section background-gray">
			<p class="sub-copy">
				찾아갈 필요 없이,<br/>
				온라인으로 간편하게!
			</p>
			<h1 class="main-copy">
				치스토리의<br/>
				진료예약 서비스를<br/>
				이용해 보세요.
			</h1>
			<div class="home-explain-image">
				<img src="${pageContext.request.contextPath}/resources/images/intro/intro2.png" alt="home main image 2">
			</div>
		</section>
		<section class="home-explain-section">
			<p class="sub-copy">
				매일매일 로그인하면<br/>
				스케일링 진료가 공짜!
			</p>
			<h1 class="main-copy">
				포인트를 모아<br/>
				진료 혜택도 받아요.
			</h1>
			<div class="home-explain-image">
				<img src="${pageContext.request.contextPath}/resources/images/intro/intro3.png" alt="home main image 2">
			</div>
		</section>
	</main>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
