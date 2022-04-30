<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/common/meta.jsp" %>
	<title>치스토리-로그인</title>
	<style>
		#loginbtn {
			color: white;
			background-color: #f47d36;
			border-color: #f47d36;
			width: 95%;
			height: 3rem;
			border-radius: 1rem;
		}
		
		.btn:hover {
			color: white;
			background-color: #fc6d1a;
			border-color: #fc6d1a;
		}
		
		.form-group {
			width: 400px;
		}
		
		#buttons {
			font-size: 13px;
			color: #888;
		}
		
		a {
			color: black;
		}
		
		a:hover {
			color: #f47d36;
		}
		
		.form-control:focus {
			color: #495057;
			background-color: #fff;
			border-color: #f47d36;
			outline: 0;
			box-shadow: 0 0 0 0.25rem rgb(242 101 34/ 25%);
		}
	</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	
	<div style="margin-left: 2rem; margin-bottom: 2rem; margin-top: 1rem; text-align: left;">
		<h1 class="text-uppercase" style="color: black; font-size: 1.4rem;">
			로그인
			<strong style="color: black;">로그인</strong>
		</h1>
	</div>
	경고메시지
	<c:if test="${error != null}">
		<div class="alert alert-danger alert-dismissible fade show"
			role="alert">
			<strong>저런! 로그인에 실패하셨어요.</strong>
			<p>${error}</p>
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
	</c:if>
	<form action="login" method="post" style="text-align: center;">
		<div class="form-group"
			style="margin-bottom: 2rem; margin-left: 1rem;">
			<label for="userid" style="margin-right: 20rem;"><strong>아이디</strong></label>
			<br/>
			<input id="userid" name="userid" type="text" class="form-control"
				placeholder="아이디를 입력해 주세요."
				style="border: 0.5px solid lightgrey; width: 20rem; height: 2rem; margin-left: 0.5rem;" />
		</div>
		<div class="form-group"
			style="margin-bottom: 2rem; margin-left: 1rem;">
			<label for="userpassword" style="margin-right: 20rem;"><strong>비밀번호</strong></label>
			<br/>
			<input id="userpassword" name="userpassword" type="password"
				class="form-control" placeholder="비밀번호를 입력해 주세요."
				style="border: 0.5px solid lightgrey; width: 20rem; height: 2rem; margin-left: 0.5rem;" />
		</div>
		<div>
			<input id="loginbtn" type="submit" value="로그인"
				style="margin-top: 2rem;">
		</div>
	</form>
	
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
