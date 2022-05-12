<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/common/meta.jsp" %>
	<title>치스토리-마이페이지</title>
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/appIcon.png">
<style>
	#userInformationEditorTab {
		color: rgb(242, 101, 34);
	}
	.btn{
	 color: white;
        background-color: #f47d36;
        border-color: #f47d36;
        width:95%;
		height:3rem;
		border-radius:1rem;
	}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/loading.jsp" %>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

			<div style="margin-left:0.5rem; margin-top:2rem;">이메일 변경</div>
			<div style="margin-left:0.5rem; margin-top:1rem;">새로운 이메일</div>
			<input type="email" class="form-control" placeholder="새로운 이메일을 입력하세요." id="username"
			                style="border:0.5px solid lightgrey; width:20rem; height:2rem; margin-left:0.5rem;" />
			
			<input type="submit" value="로그인"
									class="btn btn-block btn-osstem"style="margin-top:2rem;height:3rem;">
			<div style="margin-left:0.5rem; margin-top:2rem;">비밀번호 변경</div>
			<div style="margin-left:0.5rem; margin-top:1rem;">현재 비밀번호</div>
			<input type="password" class="form-control" placeholder="현재 사용중인 비밀번호를 입력하세요." id="userpassword"
			                style="border:0.5px solid lightgrey; width:20rem; height:2rem; margin-left:0.5rem;" />
			                <div style="margin-left:0.5rem; margin-top:1rem;">새 비밀번호</div>
			<input type="password" class="form-control" placeholder="8자 이상 영문/숫자/특수문자" id="userpassword"
			                style="border:0.5px solid lightgrey; width:20rem; height:2rem; margin-left:0.5rem;" />
			                <div style="margin-left:0.5rem; margin-top:1rem;">비밀번호 확인</div>
			<input type="password" class="form-control" placeholder="다시 한번 입력하세요." id="userpassword"
			                style="border:0.5px solid lightgrey; width:20rem; height:2rem; margin-left:0.5rem;" />
			<input type="submit" value="비밀번호 변경하기"
									class="btn btn-block btn-osstem"style="margin-top:2rem; height:3rem;">



	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>