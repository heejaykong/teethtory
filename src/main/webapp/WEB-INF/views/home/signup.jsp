<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
	<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>치스토리-회원가입</title>
    
    <link rel="stylesheet" href="/springframework-mini-project/resources/css/reset.css" />
	<link
		rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
    />
    <link rel="stylesheet" href="/springframework-mini-project/resources/css/medical-history-page.css" />
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <style>
    
      /* .container {
        border: 1px solid gray;
        padding: 50px;
        border-radius: 20px;
      } */
      #signupBtn {
         color: white;
        background-color: #f47d36;
        border-color: #f47d36;
        width:90%;
		height:3rem;
		border-radius:1rem;
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
        box-shadow: 0 0 0 0.25rem rgb(242 101 34 / 25%);
      }
     
    </style>
  	</head>
  	<body>
    <div class="container">
      <div class="row">
        <div>
          <div class="form-block">
          
            <div style="margin-bottom:3rem; margin-top:4rem;">
				<h1 class="text-uppercase">
			        <strong style="color: #f47d36; margin-left:7.5rem;">회원가입</strong>
				</h1>
			</div>

   	     	<%-- 경고메시지 --%>
            <c:if test="${error != null}">
	            <div class="alert alert-danger alert-dismissible fade show" role="alert">
				  <strong>저런! 회원가입에 실패하셨어요.</strong>
				  <p>${error}</p>
				  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
				    <span aria-hidden="true">&times;</span>
				  </button>
				</div>
            </c:if>
            
           <form action="signup" method="post">
           	 <div class="form-group"style="margin-bottom:2rem;margin-left:1rem;">
                <label for="username"><strong>이름</strong></label>
                 <br/>
                <input name="username" type="text" class="form-control" placeholder="이름을 입력해 주세요." id="username" value=""
                style="border:0.5px solid lightgrey; width:20rem; height:2rem; margin-left:0.5rem;">
              </div>
              <div class="form-group"style="margin-bottom:2rem;margin-left:1rem;">
                <label for="userssn"><strong>주민등록번호</strong></label>
                 <br/>
                <input name="userssn" type="text" class="form-control" placeholder="주민등록번호를 입력해 주세요." id="userssn" value=""
                style="border:0.5px solid lightgrey; width:20rem; height:2rem; margin-left:0.5rem;">
              </div>
              <div class="form-group"style="margin-bottom:2rem;margin-left:1rem;">
                <label for="userid"><strong>아이디</strong></label>
                 <br/>
                <input name="userid" type="text" class="form-control" placeholder="아이디를 입력해 주세요." id="userid"
                style="border:0.5px solid lightgrey; width:20rem; height:2rem;margin-left:0.5rem;"/>       
              </div>
              <div class="form-group"style="margin-bottom:2rem;margin-left:1rem;">
                <label for="userpassword"><strong>비밀번호</strong></label>
                 <br/>
                <input name="userpassword" type="password" class="form-control" placeholder="비밀번호를 입력해 주세요." id="userpassword" 
				style="border:0.5px solid lightgrey; width:20rem; height:2rem;margin-left:0.5rem;"/>
              </div>
              <div class="form-group"style="margin-bottom:2rem;margin-left:1rem;margin-left:1rem;">
                <label for="password-check"><strong>비밀번호 확인</strong></label>
                 <br/>
                <input type="password" class="form-control" placeholder="비밀번호를 다시 한 번 입력해 주세요." id="password-check" 
                style="border:0.5px solid lightgrey; width:20rem; height:2rem;margin-left:0.5rem;"/>
              </div>
              <div class="form-group"style="margin-bottom:2rem;margin-left:1rem;">
                <label for="userphone"><strong>휴대폰 번호</strong></label>
                <br/>
                <input name="userphone" type="text" class="form-control" placeholder="휴대폰 번호를 입력해 주세요." id="userphone" 
                style="border:0.5px solid lightgrey; width:20rem; height:2rem;margin-left:0.5rem;"/>
              </div>
              <input id="signupBtn" type="submit" value="회원가입" style="margin-top:2rem; margin-left:0.25rem;">
          </form>
          </div>
        </div>
      </div>
    </div>
	</body>
</html>