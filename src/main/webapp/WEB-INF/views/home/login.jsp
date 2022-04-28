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
        width:23rem;
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

<<<<<<< HEAD
#buttons {
	color: #888;
}

.find_text {
	border-right: 1px solid #888;
	
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
.btn{
	width:20rem;
	height:3rem;
	border-radius:1rem;
}
</style>

<script>
	function sendText() {
		let name = "이동현";
		localStorage.setItem("name", name);
	}
</script>
</head>
<div>
	<div class="row">
		<div>
			<div>
				<div style="margin-bottom:3rem; margin-top:10rem; margin-left:10rem;">
					<h1 class="text-uppercase">
				        <strong style="color: #f47d36;">치스토리</strong>
					</h1>
				</div>
                <div style="margin-left:3rem; margin-bottom:2rem;">
                    로그인
                </div>
				<form action="#" method="post">
					<div class="form-group"style="margin-left:3rem;">
						<label for="username"><strong>아이디</strong></label>
                    </br>
                     <input
							type="text" class="form-control" placeholder="이메일을 입력하세요."
							id="username" style="border:0.5px solid lightgrey; width:20rem; height:2rem;" />
					</div>
					<div class="form-group mb-3"style="margin-left:3rem; margin-top:1rem;">
						<label for="password"><Strong>비밀번호</Strong></label> 
                    </br>
                    <input
							type="password" class="form-control" placeholder="비밀번호를 입력하세요."
							id="password" style="border:0.5px solid lightgrey; width:20rem; height:2rem;" />
					</div>

					<div class="mb-4">
						<div id="buttons" class="row justify-content-between mx-3"style="margin-left:3rem; margin-top:1rem;">
							<span><a target="_blank"
								href="https://nid.naver.com/user2/api/route?m=routePwInquiry&amp;lang=ko_KR"
								class="find_text">비밀번호 찾기</a></span> <span><a target="_blank"
								href="https://nid.naver.com/user2/api/route?m=routeIdInquiry&amp;lang=ko_KR"
								class="find_text">아이디 찾기</a></span> <span><a
								href="${pageContext.request.contextPath}/signIn" onclick="sendText()">회원가입</a></span>
						</div>
					</div>

					<input type="submit" value="로그인"
						class="btn btn-block btn-osstem"style="margin-left:3rem; margin-top:2rem;">
					<!-- <span class="text-center my-3 d-block">or</span>
              <a href="#" class="btn btn-block py-2 btn-primary"><i class="fab fa-google mr-2"></i> Google로 로그인 하기</a> -->
				</form>
=======
      .form-control:focus {
        color: #495057;
        background-color: #fff;
        border-color: #f47d36;
        outline: 0;
        box-shadow: 0 0 0 0.25rem rgb(242 101 34 / 25%);
      }
     
    </style>
           <div style="margin-left:2rem; margin-bottom:2rem; margin-top:1rem; text-align:left;">
				<h1 class="text-uppercase" style="color: black; font-size:1.4rem;">
					<!-- 로그인 -->
			        <strong style="color: black;">로그인</strong>
				</h1>
>>>>>>> branch 'master' of https://github.com/SukheeChoi/springframework-mini-project.git
			</div>
			
           <form action="#" method="post" style="text-align:center;">
             <div class="form-group"style="margin-bottom:2rem;margin-left:1rem;">
               <label for="userid" style="margin-right:20rem;"><strong>아이디</strong></label>
                </br>
               <input type="text" class="form-control" placeholder="strongteeth" id="userid"
                style="border:0.5px solid lightgrey; width:20rem; height:2rem;margin-left:0.5rem;"/>       
             </div>
             <div class="form-group"style="margin-bottom:2rem;margin-left:1rem;">
               <label for="userpassword" style="margin-right:20rem;"><strong>비밀번호</strong></label>
                </br>
               <input type="password" class="form-control" placeholder="Password" id="userpassword" 
					        style="border:0.5px solid lightgrey; width:20rem; height:2rem; margin-left:0.5rem;"/>
             </div>
             <div>
             	<input id="loginbtn" type="submit" value="로그인" style="margin-top:2rem;">
             </div>
           </form>
<!--           <script>
            let getName = localStorage.getItem("name");
            document.getElementById('nameLee').value = getName;
            console.log("getName: " + getName);
          </script> -->
    	</section>
   	</div>
  
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
