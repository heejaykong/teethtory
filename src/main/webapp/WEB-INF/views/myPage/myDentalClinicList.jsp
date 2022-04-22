<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style>
#myDentistRegistrationTab {
	color: rgb(242, 101, 34);
}
</style>

<div class="d-flex" style="height: 100rem;">
	<%@ include file="/WEB-INF/views/common/menu.jsp"%>

	<div class="flex-grow-1" style="padding: 50px; ">
		<div id="myDentistList">
			<div class="mb-4">
				<span>내 치과 목록</span>
			</div>
			<div class="d-flex">
				<div class="dropdown mr-2">
					<button class="myDentistBtn btn btn-secondary dropdown-toggle"
						type="button" id="dropdownMenuButton" data-toggle="dropdown"
						aria-expanded="false">숙희 치과</button>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						<a class="dropdown-item" href="#">삭제</a>
					</div>
				</div>
				<div class="dropdown mr-2">
					<button class="myDentistBtn btn btn-secondary dropdown-toggle"
						type="button" id="dropdownMenuButton" data-toggle="dropdown"
						aria-expanded="false">희재 치과</button>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						<a class="dropdown-item" href="#">삭제</a>
					</div>
				</div>
				<div class="dropdown mr-2">
					<button class="myDentistBtn btn btn-secondary dropdown-toggle"
						type="button" id="dropdownMenuButton" data-toggle="dropdown"
						aria-expanded="false">동현 치과</button>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						<a class="dropdown-item" href="#">삭제</a>
					</div>
				</div>
				<div class="dropdown mr-2">
					<button class="myDentistBtn btn btn-secondary dropdown-toggle"
						type="button" id="dropdownMenuButton" data-toggle="dropdown"
						aria-expanded="false">정민 치과</button>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						<a class="dropdown-item" href="#">삭제</a>
					</div>
				</div>
			</div>

		</div>

		<div>
			<div class="mb-4 mt-4">
				<div class="mb-3">병원 검색</div>
				<div>
					<form class="form-inline my-2 my-lg-0">
						<input class="form-control mr-sm-2" type="search"
							placeholder="병원명" aria-label="Search">
						<button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
					</form>
				</div>
				<small>검색되지 않은 치과인가요? <a href="#">치과 등록을 요청해 보세요.</a></small>
			</div>

			<div class="mb-2">
				<span>검색 결과</span> <a class="btn btn-primary" href="#" role="button"
					style="background-color: rgb(242, 101, 34); border-color: rgb(242, 101, 34);">저장</a>
			</div>

			<ol>
				<div class="d-flex">
					<div class="history-list__item" style="width: 400px;">
						<div class="item__col">
							<div class="round-thumbnail">
								<i class="fa-solid fa-tooth fa-lg"></i>
							</div>
						</div>
						<div class="item__col">
							<span class="dentist-visited">햇살치과</span> <span
								class="dentist-visited">서울시 A구 무슨동</span>
						</div>
					</div>
					<div class="history-list__item">
						<div class="item__col">
							<div class="round-thumbnail">
								<i class="fa-solid fa-tooth fa-lg"></i>
							</div>
						</div>
						<div class="item__col">
							<span class="dentist-visited">햇살치과</span> <span
								class="dentist-visited">서울시 B구 무슨동</span>
						</div>
					</div>
					<div class="history-list__item">
						<div class="item__col">
							<div class="round-thumbnail">
								<i class="fa-solid fa-tooth fa-lg"></i>
							</div>
						</div>
						<div class="item__col">
							<span class="dentist-visited">햇살치과</span> <span
								class="dentist-visited">서울시 C구 무슨동</span>
						</div>
					</div>
				</div>
				<div class="d-flex">
					<div class="history-list__item">
						<div class="item__col">
							<div class="round-thumbnail">
								<i class="fa-solid fa-tooth fa-lg"></i>
							</div>
						</div>
						<div class="item__col">
							<span class="dentist-visited">햇살치과</span> <span
								class="dentist-visited">서울시 D구 무슨동</span>
						</div>
					</div>
					<div class="history-list__item">
						<div class="item__col">
							<div class="round-thumbnail">
								<i class="fa-solid fa-tooth fa-lg"></i>
							</div>
						</div>
						<div class="item__col">
							<span class="dentist-visited">햇살치과</span> <span
								class="dentist-visited">제주도 서귀포시 무슨동</span>
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


<%@ include file="/WEB-INF/views/common/footer.jsp"%>