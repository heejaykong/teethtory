<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/common/meta.jsp" %>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/default-form.css">
	<title>치스토리-마이페이지</title>

</head>
<body>
	<%@ include file="/WEB-INF/views/common/loading.jsp" %>
	<main class="main located-at-bottom-of-header">
		<div class="logo">
			<a href="${pageContext.request.contextPath}/">
				<h1 class="logo-text-orange-lg">치스토리</h1>
			</a>
		</div>
		
		<h2 class="page-title">탈퇴하기</h2>
		<div style="text-align:center; text-decoration:none; color:grey;">
	        <h5>아이디와 비밀번호를 입력하시면</h5>
	        <h5>탈퇴가 완료됩니다.</h5>
        </div>
		<%-- 로그인 에러 배지 --%>
		<c:if test="${error != null}">
			<div class="alert alert-danger alert-dismissible fade show" role="alert">
				<strong>저런! 로그인에 실패하셨어요.</strong>
				<span>${error}</span>
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
		</c:if>
		
		<form action="deleteAccount" method="post" class="default-form">
			<label for="userid">아이디</label>
			<input id="userid" name="userid" type="text" placeholder="아이디를 입력해 주세요."/>

			<label for="userpassword">비밀번호</label>
			<input id="userpassword" name="userpassword" type="password" placeholder="비밀번호를 입력해 주세요."/>

			<button type="submit" class="form-submit-btn btn-large-solid">회원 탈퇴</button>
		</form>
	</main>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
