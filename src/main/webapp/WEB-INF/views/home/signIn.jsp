<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<style>

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
	
}

#buttons {
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
	box-shadow: 0 0 0 0.25rem rgb(242 101 34/ 25%);
}

.btn {
	width: 20rem;
	height: 3rem;
	border-radius: 1rem;
}
</style>
<div style="width: 100%">
	<div>
		<div class="row">
			<div>
				<div>
					<div
						style="margin-bottom: 3rem; margin-top: 10rem; margin-left: 10rem;">
						<h1 class="text-uppercase">
							<strong style="color: #f47d36;">치스토리</strong>
						</h1>
					</div>
					<div style="margin-left: 3rem; margin-bottom: 2rem;">회원가입</div>
					<form action="#" method="post">
						<div class="form-group"
							style="margin-left: 3rem; margin-bottom: 2rem;">
							<label for="password"><strong>이름</strong></label> </br> <input
								type="text" class="form-control" placeholder="홍길동" id="nameLee"
								value=""
								style="border: 0.5px solid lightgrey; width: 20rem; height: 2rem;" />

						</div>
						<div class="form-group"
							style="margin-left: 3rem; margin-bottom: 2rem;">
							<label for="username"><strong>아이디</strong></label> </br> <input
								type="email" class="form-control" placeholder="Email@email.com"
								id="username"
								style="border: 0.5px solid lightgrey; width: 20rem; height: 2rem;" />
						</div>
						<div class="form-group"
							style="margin-left: 3rem; margin-bottom: 2rem;">
							<label for="password"><strong>비밀번호</strong></label> </br> <input
								type="password" class="form-control" placeholder="Password"
								id="password"
								style="border: 0.5px solid lightgrey; width: 20rem; height: 2rem;" />

						</div>
						<div class="form-group"
							style="margin-left: 3rem; margin-bottom: 2rem;">
							<label for="password"><strong>비밀번호 확인</strong></label> </br> <input
								type="" class="form-control" placeholder="Password"
								id="checkpassword"
								style="border: 0.5px solid lightgrey; width: 20rem; height: 2rem;" />

						</div>

						<div class="form-group mb-4"
							style="margin-left: 3rem; margin-bottom: 2rem;">
							<label for="password"><strong>휴대폰 번호</strong></label> </br> <input
								type="tel" class="form-control" placeholder="010-1234-5678"
								id="phonenumber"
								style="border: 0.5px solid lightgrey; width: 20rem; height: 2rem;" />
						</div>
						<input type="submit" value="회원가입" class="btn btn-block btn-osstem"
							style="margin-left: 3rem; margin-top: 2rem;">
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
</div>
