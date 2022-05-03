<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/common/meta.jsp" %>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home/home.css">
	<title>치스토리</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<main class="main located-at-bottom-of-header">
		<%-- 상단 캐러셀 이미지 --%>
		<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="${pageContext.request.contextPath}/resources/images/home1.jpg"
						class="d-block w-100" alt="home carousel image1"/>
				</div>
				<div class="carousel-item">
					<img src="${pageContext.request.contextPath}/resources/images/puppy2.jpeg"
						class="d-block w-100" alt="home carousel image2"/>
				</div>
				<div class="carousel-item">
					<img src="${pageContext.request.contextPath}/resources/images/puppy3.jpeg"
						class="d-block w-100" alt="home carousel image3"/>
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-target="#carouselExampleIndicators" data-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-target="#carouselExampleIndicators" data-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</button>
		</div>

		<%-- 서비스 설명 --%>
		<section class="home-explain-section background-pale-peach">
			<p class="sub-copy">
				치과 진료내역,<br/>
				한 곳에 모아볼 순 없을까?
			</p>
			<h1 class="main-copy">
				이젠 치스토리에서<br/>
				쉽게 확인하세요.
			</h1>
			<div class="home-explain-image">
				<img src="https://dummyimage.com/600x400/000/fff" alt="home main image 1">
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
				<img src="https://dummyimage.com/600x400/000/fff" alt="home main image 2">
			</div>
		</section>
	</main>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
