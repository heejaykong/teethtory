<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>미니 프로젝트 메인화면</title>

<link rel="stylesheet"
	href="/springframework-mini-project/resources/css/reset.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/app.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/reset.css" />

<style>
.header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 2rem;
	border-bottom: 1px solid lightgray;
	background-color: rgb(250, 250, 250);
	margin-bottom: 1rem;
}

.header__logo {
	cursor: pointer;
}

.nav__list {
	display: flex;
	align-items: center;
}

.nav__btn {
	display: flex;
	align-items: center;
	color: rgb(85, 85, 80);
	margin-right: 1.5rem;
	cursor: pointer;
}

.nav__btn > i {
	font-size: 0.9rem;
	margin-right: 0.3rem;
}

.round-btn {
	color: rgb(242, 101, 34);
	border: 3.5px solid rgb(242, 101, 34);
	border-radius: 30rem;
	padding: 0.8rem 1rem;
	background-color: white;
}

.aside {
	padding-top: 8rem;
	padding-left: 5rem;
}

body {
	height: 100vh;
}

#wrapper {
	position: relative;
	min-height: 100%;
	padding-bottom: 100px;
}

footer {
	/* height: 100px; */
	position: absolute;
	/* transform: translateY(100%); */
	bottom: 0;
	width: 100%;
	background-color: lightgrey;
}

.footer__column {
	padding: 3rem;
}

/* medical history page CSS*/
.main {
	display: flex;
	flex-direction: column;
}
.mouth-and-history-list-section{
	display: flex;
	justify-content: center;
}
.mouth-and-history-list__col{
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

/* mouth */
.mouth{
	width: 30rem;
	height: 17rem;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	margin-left: 5rem;
}
.mouth__upper-jaw{
	position: relative;
}
.upper-jaw__upper-gum{
}
.upper-jaw__upper-gum > img{
	width: 100%;
}
.upper-jaw__upper-teeth{
}
.upper-jaw__upper-teeth > img{
	cursor: pointer;
	position: absolute;
	
	background-color: rgba(0, 0, 0, 0.9);
	filter: hue-rotate(90deg);
  opacity: 0.9;
}
.upper-jaw__upper-teeth > img:hover{
	margin-top: -0.1rem;
}
.mouth__lower-jaw{
}
.lower-jaw__lower-gum{
}
.lower-jaw__lower-gum > img{
	width: 100%;	
}
.lower-jaw__lower-teeth{
}

/* history list */
.history-list{
	padding: 0.2rem 1rem;
  height: 20rem;
	width: 30rem;
  overflow-y: scroll;
	margin-top: 3rem;
	margin-right: 5rem;
}
.history-list__item{
	cursor: pointer;
	display: flex;
	border-radius: 1rem;
	padding: 0.8rem 1.2rem;
  box-shadow: 0px 1px 6px rgba(0, 0, 0, 0.2);
	margin-bottom: 0.2rem;
}
.item__col {
	display: flex;
	flex-direction: column;
}
.round-thumbnail{
	border: 2px solid rgb(242, 101, 34);
	border-radius: 50%;
	width: 3rem;
	height: 3rem;
	display: flex;
	justify-content: center;
	align-items: center;
	margin-right: 0.8rem;
}
.dentist-visited{
	font-size: 0.8rem;
	color: rgb(85, 85, 80);
	margin-bottom: 0.2rem;
}
.treatment-title{
	font-size: 1.2rem;
	color: rgb(242, 101, 34);
	font-weight: 600;
	margin-bottom: 0.2rem;
}
.treatment-date{
	font-size: 1.2rem;
	color: rgb(85, 85, 80);
	font-weight: 600;
	margin-left: 0.2rem;
}
.cost{
	font-size: 0.8rem;
	color: rgb(242, 101, 34);
}

/* history description card */
.history-desc-section{

}
.desc-card{
	margin: 2rem;
}
.desc-card__header{

}
.desc-card__header__col{

}
.desc-card__body{

}
</style>
</head>

<body>
	<!-- header -->
	<header class="header">
		<div class="header__logo">logo</div>
		<nav class="nav">
			<ul class="nav__list">
				<a href="${pageContext.request.contextPath}/medicalHistoryPage/"
					class="nav__btn"> <i class="fa-solid fa-tooth"></i>
					<li>진료 내역</li>
				</a>
				<a href="#" class="nav__btn"> <i class="fa-solid fa-clipboard"></i>
					<li>진료 예약</li>
				</a>
				<a href="#" class="nav__btn"> <i
					class="fa-solid fa-calendar-day"></i>
					<li>일정 보기</li>
				</a>
				<a href="#" class="nav__btn">
					<li class="round-btn">마이페이지</li>
				</a>
				<a href="#" class="nav__btn">
					<li>로그아웃</li>
				</a>
			</ul>
		</nav>
	</header>