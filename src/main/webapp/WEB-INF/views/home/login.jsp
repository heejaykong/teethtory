<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/common/meta.jsp" %>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/default-form.css">
	<title>치스토리-로그인</title>
</head>
<body>
	<main class="main located-at-bottom-of-header">
		<div class="logo">
			<a href="${pageContext.request.contextPath}/">
				<h1 class="logo-text-orange-lg">치스토리</h1>
			</a>
		</div>
		<h2 class="page-title">로그인</h2>

		<%-- 로그인 에러 배지 --%>
		<c:if test="${error != null}">
			<div class="alert alert-danger alert-dismissible fade show" role="alert">
				<strong>저런! 로그인에 실패하셨어요.</strong><br>
				<span>${error}</span>
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
		</c:if>
		
		<form action="login" method="post" class="default-form">
			<label for="userid">아이디</label>
			<input id="userid" name="userid" type="text" placeholder="아이디를 입력해 주세요."
			/>

			<label for="userpassword">비밀번호</label>
			<input id="userpassword" name="userpassword" type="password" placeholder="비밀번호를 입력해 주세요."
			/>

			<button type="submit" class="form-submit-btn btn-large-solid">로그인</button>
		</form>
	</main>
</body>
</html>
