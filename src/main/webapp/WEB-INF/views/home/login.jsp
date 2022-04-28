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