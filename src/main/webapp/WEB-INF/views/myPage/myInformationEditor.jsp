<%@ page session="false" language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<style>
	#userInformationEditorTab {
		color: rgb(242, 101, 34);
	}
	.btn{
	
	
	border-radius:1rem;
	 background-color:  #ffa048;
    text-decoration: none;
    color:white;
	}
</style>
<div style="margin-left:0.5rem; margin-top:2rem;">이메일 변경</div>
<div style="margin-left:0.5rem; margin-top:1rem;">새로운 이메일</div>
<input type="email" class="form-control" placeholder="새로운 이메일을 입력하세요." id="username"
                style="border:0.5px solid lightgrey; width:20rem; height:2rem; margin-left:0.5rem;" />

<input type="submit" value="로그인"
						class="btn btn-block btn-osstem"style="margin-left:0.5rem; margin-top:2rem; width:22rem; height:3rem;">
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
						class="btn btn-block btn-osstem"style="margin-left:0.5rem; margin-top:2rem; width:22rem; height:3rem;">
						

<%@ include file="/WEB-INF/views/common/footer.jsp" %>