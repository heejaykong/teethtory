<%@ page session="false" language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<style>
	#signOutTab {
		color: rgb(242, 101, 34);
	}
	.btn{
	border-radius:1rem;
	 background-color:  #ffa048;
    text-decoration: none;
    color:white;
	}
</style>

			<div>
				<img src="/springframework-mini-project/resources/images/signOut.jpg" style="width:100%;">
			</div>
			<div style="text-align:center;">
				<h3>치스토리 탈퇴하기</h3>
			</div>
				<div style="text-align:center; text-decoration:none; color:grey;">
				<h5>아이디와 비밀번호를 입력하시면</h5>
				<h5>탈퇴가 완료됩니다.</h5>
				</div>
			<div style="margin-left:0.5rem;">아이디</div>
			<input type="email" class="form-control" placeholder="이메일을 입력하세요." id="username"
			                style="border:0.5px solid lightgrey; width:20rem; height:2rem; margin-left:0.5rem;" />
			<div style="margin-left:0.5rem;">비밀번호</div>
			<input type="password" class="form-control" placeholder="비밀번호를 입력하세요." id="userpassword"
			                style="border:0.5px solid lightgrey; width:20rem; height:2rem; margin-left:0.5rem;" />
			<input type="submit" value="로그인"
									class="btn btn-block btn-osstem"style="margin-left:0.5rem; margin-top:2rem; width:22rem; height:3rem;">
	 	</section>
	</div> 

<%@ include file="/WEB-INF/views/common/footer.jsp" %>