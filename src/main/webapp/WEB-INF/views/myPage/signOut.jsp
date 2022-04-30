<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/common/meta.jsp" %>
	<title>치스토리-마이페이지</title>
<style>
	#signOutTab {
		color: rgb(242, 101, 34);
	}
	.btn{
	color: white;
        background-color: #f47d36;
        border-color: #f47d36;
       
		height:3rem;
		border-radius:1rem;
	}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>


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
      <input type="submit" value="회원탈퇴"
                  class="btn btn-block btn-osstem"style="margin-left:0.5rem; width:95%; margin-top:2rem;">
	 	</section>
	</div> 


	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
