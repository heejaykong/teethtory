<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/common/meta.jsp" %>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default-form.css">
	<title>치스토리-회원가입</title>
</head>
<body>
	<main class="main located-at-bottom-of-header">
		<div class="logo">
			<a href="${pageContext.request.contextPath}/">
				<h1 class="logo-text-orange-lg">치스토리</h1>
			</a>
		</div>
		<h2 class="page-title">회원가입</h2>

		<%-- 회원가입 에러 배지 --%>
		<c:if test="${error != null}">
			<div class="alert alert-danger alert-dismissible fade show" role="alert">
				<strong>저런! 회원가입에 실패하셨어요.</strong>
				<span>${error}</span>
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
		</c:if>
		
		<form action="signup" method="post" class="default-form">
			<label for="username">이름</label>
			<input id="username" name="username" type="text" placeholder="이름을 입력해 주세요."/>
			
			<label for="userssn">주민등록번호</label>
			<input id="userssn" name="userssn" type="text" placeholder="주민등록번호를 입력해 주세요."/>
			
			<label for="userid">아이디</label>
			<input id="userid" name="userid" type="text" placeholder="아이디를 입력해 주세요."/>

			<label for="userpassword">비밀번호</label>
			<input id="userpassword" name="userpassword" type="password" placeholder="비밀번호를 입력해 주세요."/>

			<label for="check-userpassword">비밀번호 확인</label>
			<input id="check-userpassword" type="password" placeholder="비밀번호를 한 번 더 입력해 주세요."/>

			<label for="userphone">휴대폰 번호</label>
			<input id="userphone" name="userphone" type="text" placeholder="휴대폰 번호를 입력해 주세요."/>

			<button type="submit" class="form-submit-btn btn-large-solid">회원가입</button>
		</form>
	</main>
</body>
</html>
