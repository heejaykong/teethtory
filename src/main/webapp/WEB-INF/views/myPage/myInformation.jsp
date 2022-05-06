<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/common/meta.jsp"%>
	<title>치스토리 - 설정</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPage/myInformation.css">
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<main class="main located-at-bottom-of-header">

		<%-- TBD: 이메일/비밀번호/휴대폰번호 변경 폼 각각 만들기(현재 전부 myInformationEditor임) --%>
		<%-- TBD: 치스토리 탈퇴하기 요청경로 워딩 바꾸기(signOut -> deleteAccount) --%>
		
		<%-- 회원정보 블록 --%>
		<section class="user-info-settings-block">
			<h1 class="page-title">설정</h1>
			<h3 class="section-title">회원 정보</h3>
			<div class="row-item">
				<p class="row-item__title">이름</p>
				<span class="row-item__content">
					${user.username}
				</span>
			</div>
			<div class="row-item">
				<p class="row-item__title">아이디</p>
				<span class="row-item__content">
					${user.userid}
				</span>
			</div>
			<div class="row-item">
				<p class="row-item__title">이메일</p>
				<span class="row-item__content">
					${user.useremail}
					<a href="myInformationEditor" class="row-item__content__btn">이메일 변경</a>
				</span>
			</div>
			<div class="row-item">
				<p class="row-item__title">비밀번호</p>
				<span class="row-item__content">
					**********
					<a href="myInformationEditor" class="row-item__content__btn">비밀번호 변경</a>
				</span>
			</div>
			<div class="row-item">
				<p class="row-item__title">휴대폰 번호</p>
				<span class="row-item__content">
					${user.userphone}
					<a href="myInformationEditor" class="row-item__content__btn">휴대폰 번호 변경</a>
				</span>
			</div>
		</section>

		<%-- 옅은 막대기 --%>
		<div class="thick-divider"></div>

		<%-- 알림 블록 --%>
		<section class="noti-settings-block">
			<h3 class="section-title">알림</h3>
			
			<div class="custom-control custom-switch">
				<input type="checkbox" class="custom-control-input" id="notiToggleBtn">
				<label class="custom-control-label" for="notiToggleBtn">진료일 하루 전에 알림 수신하기</label>
			</div>

			<a href="deleteAccount(구 signOut)" class="deleteAccountLink">치스토리 탈퇴하기</a>
		</section>
	</main>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
