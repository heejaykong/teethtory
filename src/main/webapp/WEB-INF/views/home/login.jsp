<%@ page session="false" language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

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

    <div class="container">
      <div class="row">
        <div>
          <div class="form-block">
          
            <div style="margin-bottom:3rem; margin-top:4rem;">
					<h1 class="text-uppercase">
				        <strong style="color: #f47d36; margin-left:8.4rem;">로그인</strong>
					</h1>
				</div>
				
            <form action="#" method="post">
           	 
              <div class="form-group"style="margin-bottom:2rem;margin-left:1rem;">
                <label for="username"><strong>아이디</strong></label>
                 </br>
                <input type="email" class="form-control" placeholder="Email@email.com" id="username"
                style="border:0.5px solid lightgrey; width:20rem; height:2rem;margin-left:0.5rem;"/>       
              </div>
              <div class="form-group"style="margin-bottom:2rem;margin-left:1rem;">
                <label for="password"><strong>비밀번호</strong></label>
                 </br>
                <input type="password" class="form-control" placeholder="Password" id="password" 
				style="border:0.5px solid lightgrey; width:20rem; height:2rem;margin-left:0.5rem;"/>
                
              </div>
             
              <input id="loginbtn" type="submit" value="로그인"  style="margin-top:2rem; margin-left:0.25rem;">
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
  
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
