<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style>
	#myDentistRegistrationTab {
		color: rgb(242, 101, 34);
	}
</style>

<!-- <div class="d-flex align-items-center"> -->
<div class="container-fluid d-flex" style="height: 10rem;">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>

	<!-- <div class="col-sm-10  mx-3rem px-2rem" -->
	<div class="col-sm-10"
		style="float: left; width: 70%; padding-left: 50px; padding-right: 50px;">
<!-- 	<div class="col-sm-10 justify-content-center mx-3rem px-2rem" -->
		<div id="myDentistList">
			<div class="m-3"><span>내 치과 목록</span></div> </br>
			<div class="row">
				<div class="dropdown m-1">
				  <button class="myDentistBtn btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-expanded="false">
				    숙희 치과
				  </button>
				  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
				    <a class="dropdown-item" href="#">삭제</a>
				  </div>
				</div>
				<div class="dropdown m-1">
				  <button class="myDentistBtn btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-expanded="false">
				   희재 치과
				  </button>
				  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
				    <a class="dropdown-item" href="#">삭제</a>
				  </div>
				</div>
				<div class="dropdown m-1">
				  <button class="myDentistBtn btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-expanded="false">
				    동현 치과
				  </button>
				  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
				    <a class="dropdown-item" href="#">삭제</a>
				  </div>
				</div>
				<div class="dropdown m-1">
				  <button class="myDentistBtn btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-expanded="false">
				    정민 치과
				  </button>
				  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
				    <a class="dropdown-item" href="#">삭제</a>
				  </div>
				</div>
			</div>
			
		</div>

		<div id="searchDentist">
			<div class="m-3"><span>병원 검색</span></div> </br>
			<form class="form-inline m-3 my-lg-0">
				<input class="form-control mr-sm-2" type="search" placeholder="병원명"
					aria-label="Search" />
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
			</form>
			<div class="m-3">검색되지 않는 치과인가요?<a href="#">치과 등록을 요청해보세요.</a></div> </br>
			
			<div class="row">
				<div class="col"><span>검색 결과</span></div>
				<div class="col-lg-1 mb-2""><a class="btn btn-primary" href="#" role="button"  style="background-color: rgb(242, 101, 34); border-color: rgb(242, 101, 34);">저장</a></div>
			</div>
			
			<ol>
				<div class="row">
					<div class="history-list__item col-sm-4">
						<div class="item__col">
				            <div class="round-thumbnail"><i class="fa-solid fa-tooth fa-lg"></i></div>
				          </div>
				          <div class="item__col">
				            <span class="dentist-visited">햇살치과</span>
				            <span class="dentist-visited">서울시 A구 무슨동</span>
				          </div>
					</div>
					<div class="history-list__item col-sm-4">
						<div class="item__col">
				            <div class="round-thumbnail"><i class="fa-solid fa-tooth fa-lg"></i></div>
				          </div>
				          <div class="item__col">
				            <span class="dentist-visited">햇살치과</span>
				            <span class="dentist-visited">서울시 B구 무슨동</span>
				          </div>
					</div>
					<div class="history-list__item col-sm-4">
						<div class="item__col">
				            <div class="round-thumbnail"><i class="fa-solid fa-tooth fa-lg"></i></div>
				          </div>
				          <div class="item__col">
				            <span class="dentist-visited">햇살치과</span>
				            <span class="dentist-visited">서울시 C구 무슨동</span>
				          </div>
					</div>
					<div class="history-list__item col-sm-4">
						<div class="item__col">
				            <div class="round-thumbnail"><i class="fa-solid fa-tooth fa-lg"></i></div>
				          </div>
				          <div class="item__col">
				            <span class="dentist-visited">햇살치과</span>
				            <span class="dentist-visited">서울시 D구 무슨동</span>
				          </div>
					</div>
					<div class="history-list__item col-sm-4">
						<div class="item__col">
				            <div class="round-thumbnail"><i class="fa-solid fa-tooth fa-lg"></i></div>
				          </div>
				          <div class="item__col">
				            <span class="dentist-visited">햇살치과</span>
				            <span class="dentist-visited">제주도 서귀포시 무슨동</span>
				          </div>
					</div>
					<div class="history-list__item col-sm-4">
						<div class="item__col">
				            <div class="round-thumbnail"><i class="fa-solid fa-tooth fa-lg"></i></div>
				          </div>
				          <div class="item__col">
				            <span class="dentist-visited">햇살치과</span>
				            <span class="dentist-visited">경주시 A구 무슨동</span>
				          </div>
					</div>
					<div class="history-list__item col-sm-4">
						<div class="item__col">
				            <div class="round-thumbnail"><i class="fa-solid fa-tooth fa-lg"></i></div>
				          </div>
				          <div class="item__col">
				            <span class="dentist-visited">햇살치과</span>
				            <span class="dentist-visited">경기도 광명시 무슨동</span>
				          </div>
					</div>
					<div class="history-list__item col-sm-4">
						<div class="item__col">
				            <div class="round-thumbnail"><i class="fa-solid fa-tooth fa-lg"></i></div>
				          </div>
				          <div class="item__col">
				            <span class="dentist-visited">햇살치과</span>
				            <span class="dentist-visited">경기도 안산시 무슨동</span>
				          </div>
					</div>
					<div class="history-list__item col-sm-4">
						<div class="item__col">
				            <div class="round-thumbnail"><i class="fa-solid fa-tooth fa-lg"></i></div>
				          </div>
				          <div class="item__col">
				            <span class="dentist-visited">햇살치과</span>
				            <span class="dentist-visited">경기도 분당시 무슨동</span>
				          </div>
					</div>
					<div class="history-list__item col-sm-4">
						<div class="item__col">
				            <div class="round-thumbnail"><i class="fa-solid fa-tooth fa-lg"></i></div>
				          </div>
				          <div class="item__col">
				            <span class="dentist-visited">햇살치과</span>
				            <span class="dentist-visited">서울시 송파구 무슨동</span>
				          </div>
					</div>
					<div class="history-list__item col-sm-4">
						<div class="item__col">
				            <div class="round-thumbnail"><i class="fa-solid fa-tooth fa-lg"></i></div>
				          </div>
				          <div class="item__col">
				            <span class="dentist-visited">햇살치과</span>
				            <span class="dentist-visited">서울시 마포구 무슨동</span>
				          </div>
					</div>
					<div class="history-list__item col-sm-4">
						<div class="item__col">
				            <div class="round-thumbnail"><i class="fa-solid fa-tooth fa-lg"></i></div>
				          </div>
				          <div class="item__col">
				            <span class="dentist-visited">햇살치과</span>
				            <span class="dentist-visited">서울시 마포구 무슨동</span>
				          </div>
					</div>
				</div>
			</ol>
			
			<nav aria-label="Page navigation example">
			  <ul class="pagination justify-content-center">
			    <li class="page-item"><a class="page-link" href="#">이전으로</a></li>
			    <li class="page-item"><a class="page-link" href="#">1</a></li>
			    <li class="page-item"><a class="page-link" href="#">2</a></li>
			    <li class="page-item"><a class="page-link" href="#">3</a></li>
			    <li class="page-item"><a class="page-link" href="#">다음으로</a></li>
			  </ul>
			</nav>
		</div>
				
	</div>
</div>
	

<%@ include file="/WEB-INF/views/common/footer.jsp" %>