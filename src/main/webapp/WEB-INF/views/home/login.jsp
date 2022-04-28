<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>치스토리-로그인</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="/webapp/resources/css/app.css" />
<style>
/* .container {
  border: 1px solid gray;
  padding: 50px;
  border-radius: 20px;
} */
#loginbtn {
	color: white;
	background-color: #f47d36;
	border-color: #f47d36;
	width: 23rem;
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
	<div style="margin-left: 2rem; margin-bottom: 2rem; margin-top: 1rem; text-align: left;">
		<h1 class="text-uppercase" style="color: black; font-size: 1.4rem;">
			<%-- 로그인 --%>
			<strong style="color: black;">로그인</strong>
		</h1>
	</div>
	<%-- 경고메시지 --%>
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
</body>
</html>
