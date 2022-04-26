<%@ page session="false" language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<style>
	#signOutTab {
		color: rgb(242, 101, 34);
	}
</style>
<div class="d-flex">
	<div class="container-fluid d-flex justify-content-center">
		<%@ include file="/WEB-INF/views/common/menu.jsp" %>
	
		<div class="col-sm-10" style="float: left; width: 70%; top: 50%; left: 65%; transform: translate(-50%, -50%);">
			<div class="ml-5 mr-5 mt-5 d-flex flex-column">
				<div class="mt-4" style="float: left; padding-left: 50px; padding-right: 50px;">
					<i class="fa-solid fa-triangle-exclamation" style="color:#cc0000;"></i>
					<span style="font-size: 1rem;">탈퇴시 모든 정보가 지워집니다.</span>
				</div>
			</div>
			
			<div class="ml-5 mr-5 d-flex flex-column">
				<div class="mt-4 mb-4" style="float: left; padding-left: 50px; padding-right: 50px;">
					<span>아이디</span>
					<form class="form-inline m-3 my-lg-0">
						<input class="form-control mr-sm-2" type="search" placeholder="team5_chaego"
							aria-label="Search" style="width: 30rem;" />
					</form>
				</div>
				<div class="mt-4 mb-4" style="float: left; padding-left: 50px; padding-right: 50px;">
					<span>비밀번호</span>
					<form class="form-inline m-3 my-lg-0">
						<input class="form-control mr-sm-2" type="search"
							aria-label="Search" style="width: 30rem;" />
					</form>
				</div>
			</div>
			
			<div class="ml-5 mr-5 d-flex flex-column">
				<div style="float: left; padding-left: 50px; padding-right: 50px;">
					<div class="m-3 my-lg-0">
						<button class="redBtn btn mr-sm-2" type="submit" style="width: 30rem">탈퇴하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>