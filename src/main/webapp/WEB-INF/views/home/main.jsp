<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/common/meta.jsp" %>
	<title>치스토리</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="/springframework-mini-project/resources/images/home1.jpg"
					class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="/springframework-mini-project/resources/images/puppy2.jpeg"
					class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="/springframework-mini-project/resources/images/puppy3.jpeg"
					class="d-block w-100" alt="...">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-target="#carouselExampleIndicators" data-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-target="#carouselExampleIndicators" data-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
		</button>
	</div>
	
	<div>
		<img src="/springframework-mini-project/resources/images/home3.jpg"
			style="width: 100%;">
	</div>
	<div>
		<img src="/springframework-mini-project/resources/images/home2.jpg"
			style="width: 100%;">
	</div>
	
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
