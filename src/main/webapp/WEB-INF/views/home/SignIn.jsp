<%@ page session="false" language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700;900&display=swap" rel="stylesheet" />
    <title>SignUp Form</title>
    <style>
      body {
        height: 100vh;
        display: flex;
        align-items: center;
        font-family: "Noto Sans KR", sans-serif;
      }

      /* .container {
        border: 1px solid gray;
        padding: 50px;
        border-radius: 20px;
      } */

      .btn {
        color: white;
        background-color: #f47d36;
        border-color: #f47d36;
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
        <div class="col-xs-12 mx-auto">
          <div class="form-block mx-5">
            <div class="text-center mb-5" style="border-bottom: 2px solid #f47d36; padding: 20px">
              <h3 class="text-uppercase">Sign Up <strong style="color: #f47d36">Osstem</strong></h3>
            </div>
            <form action="#" method="post">
              <div class="form-group">
                <label for="username"><strong>아이디</strong></label>
                <input type="email" class="form-control" placeholder="Email@email.com" id="username" />
              </div>
              <div class="form-group">
                <label for="password"><strong>비밀번호</strong></label>
                <input type="password" class="form-control" placeholder="Password" id="password" />
              </div>
              <div class="form-group">
                <label for="password"><strong>비밀번호 확인</strong></label>
                <input type="" class="form-control" placeholder="Password" id="checkpassword" />
              </div>
              <div class="form-group">
                <label for="password"><strong>이름</strong></label>
                <input type="text" class="form-control" placeholder="홍길동" id="nameLee" value=""/>
              </div>
              <div class="form-group mb-4">
                <label for="password"><strong>휴대폰 번호</strong></label>
                <input type="tel" class="form-control" placeholder="010-1234-5678" id="phonenumber" />
              </div>
              <input type="submit" value="회원가입" class="btn btn-block py-2 btn-outline-danger" />
            </form>
          </div>
          <script>
            let getName = localStorage.getItem("name");
            document.getElementById('nameLee').value = getName;
            console.log("getName: " + getName);
          </script>
        </div>
      </div>
    </div>
  </body>
</html>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>