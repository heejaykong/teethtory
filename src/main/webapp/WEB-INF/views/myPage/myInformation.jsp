<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/common/meta.jsp" %>
	<title>치스토리-마이페이지</title>

<style>
.container{
	display:flex;
	flex-direction:row;
}
#changebtn {
        color: white;
        background-color: #f47d36;
        border-color: #f47d36;
        width:100%;
	height:3rem;
	border-radius:1rem;
      }
      
.toggle-switch input{
  -webkit-appearance:none;
  -webkit-border-radius:0;
}

  
.toggle-switch input{
  -webkit-appearance:none;
  -webkit-border-radius:0;
}

#container{
  display: flex;
  width: 100%;

}
.toggle-switch input[type=checkbox]{
  display: none;
}

.toggle-track{
  display: inline-block;
  position: relative;
  width: 60px;
  height: 25px;
  border-radius:60px;
  background: #8b8b8b;
}
.toggle-track:before{
  content:'';
  display: block;
  position: absolute;
  top: -6px;
  left: -15px;
  width: 27px;
  height: 27px; 
  margin: 5px;
  background: #fff;
  border-radius:100%;
  border:1px solid #8b8b8b;
  transition:left 0.3s;
}
.toggle-switch input[type=checkbox] + label .toggle-track:after{
  content:'OFF';
  display: inline-block;
  position: absolute;
  right: 8px;
  color: #fff;
}

.toggle-switch input[type=checkbox]:checked + label .toggle-track{
  background: #FA9AA6;
}
.toggle-switch input[type=checkbox]:checked + label .toggle-track:before{
  left: 40px;
  border:1px solid #FA9AA6;
}
.toggle-switch input[type=checkbox]:checked + label .toggle-track:after{
  content:'ON';
  left: 5px;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

        <div style="margin-left:1rem; margin-top:1rem;"><h4>설정</h4></div>
        <hr>
        <div style="margin-left:1rem;"><strong><h4>회원정보</h4></strong></div>
        <hr>

        <div class="container">
        <div style="margin-right:2.5rem; margin-bottom:1rem;">이름</div>
        <div>김영희</div>
        </div>

        <div class="container">
        <div style="margin-right:1.7rem; margin-bottom:1rem;">아이디</div>
        <div>strongteeth99</div>
        </div>

        <div class="container">
        <div style="margin-right:1.7rem; margin-bottom:1rem;">이메일</div>
        <div>strongteeth99@gmail.com</div>
        </div>

        <div class="container">
        <div style="margin-right:1rem; margin-bottom:1rem;">비밀번호</div>
        <div>*******</div>
        </div>

        <div class="container">
        <div style="margin-right:1rem; margin-bottom:1rem;">휴대번호</div>
        <div>010-1234-5678</div>
        </div>


        <button id="changebtn" style="margin-top:2rem; margin-left:0.25rem; text-align:center;"
        onclick="location.href='myInformationEditor'">회원정보 수정</button>
		
				
        <hr>
        <div style="margin-left:1rem; margin-bottom:1rem"><a href="easteregg"><h4>비용</h4></a></div>
        
        <div style="margin-top:2rem; margin-left:1rem;">
        <a href='signOut'>
          치스토리 탈퇴하기
        </a>
        </div>


	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
