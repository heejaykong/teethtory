<%@ page session="false" language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<style>
	#userInformationEditorTab {
		color: rgb(242, 101, 34);
	}
</style>
<div class="container-fluid d-flex">
	<%@ include file="/WEB-INF/views/common/menu.jsp" %>

	<div class="col-sm-10 justify-content-center" style="float: left; width: 70%;">
		<div class="ml-5 mr-5 mt-5">
			<div class="mt-4 mb-4">
				<span>이메일</span>
				<form class="form-inline m-3 my-lg-0">
					<input class="form-control mr-sm-2" type="search" placeholder="team5_chaego@Osstem.com"
						aria-label="Search" style="width: 30rem;" />
					<button class="orangeBtn btn my-2 my-sm-0" type="submit">변경</button>
				</form>
			</div>
			<div class="mt-4 mb-4">
				<span>휴대폰 번호</span>
				<form class="form-inline m-3 my-lg-0">
					<input class="form-control mr-sm-2" type="search" placeholder="010-5544-3322"
						aria-label="Search" style="width: 30rem;" />
					<button class="orangeBtn btn my-2 my-sm-0" type="submit">변경</button>
				</form>
			</div>
			<div class="mt-4 mb-4">
				<span>비밀번호</span>
				<form class="form-inline m-3 my-lg-0">
					<input class="form-control mr-sm-2" type="search"
						aria-label="Search" style="width: 30rem;" />
					<button class="orangeBtn btn my-2 my-sm-0" type="submit">변경</button>
				</form>
			</div>
		</div>
		
	</div>
	
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>