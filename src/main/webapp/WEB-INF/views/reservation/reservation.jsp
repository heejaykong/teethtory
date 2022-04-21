<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style>
/* history list */
.hospital-name {
	display: flex;
	flex-direction: row;
	align-items: flex-end;
}

.hospital-name__item {
	cursor: pointer;
	border-radius: 1rem;
	padding: 0.8rem 1.2rem;
	box-shadow: 0px 1px 6px rgba(0, 0, 0, 0.2);
	margin-bottom: 0.2rem;
}

.hospital-name__item:hover {
	background-color: #f47d36;
	color: white;
}

.hospital-name__item:hover .treatment-title {
	color: white;
}

.hospital-name__item:hover .item__col .round-thumbnail {
	border-color: white;
}

.hospital-name__item .item__col {
	display: flex;
	flex-direction: column;
}

.hospital-name__item .item__col .round-thumbnail {
	border: 2px solid rgb(242, 101, 34);
	border-radius: 50%;
	width: 3rem;
	height: 3rem;
	display: flex;
	justify-content: center;
	align-items: center;
	margin-right: 0.8rem;
}

.dentist-visited {
	font-size: 0.8rem;
	color: rgb(85, 85, 80);
	margin-bottom: 0.2rem;
}

.treatment-title {
	font-size: 1.2rem;
	color: rgb(242, 101, 34);
	font-weight: 600;
	margin-bottom: 0.2rem;
}

.treatment-date {
	font-size: 1.2rem;
	color: rgb(85, 85, 80);
	font-weight: 600;
	margin-left: 0.2rem;
}

.addr {
	font-size: 0.8rem;
}
</style>
<div style="margin-left: 10rem; margin-right: 10rem;">
	<div class="mb-4 mt-4">
		<div class="mb-3">병원 검색</div>
		<div>
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">돋보기</button>
			</form>
		</div>
		<small>검색되지 않은 치과인가요? <a href="#">치과 등록을 요청해 보세요.</a></small>
	</div>
	<div style="width: 100%">
		<img src="${pageContext.request.contextPath}/resources/images/map.png"
			width="100%">
	</div>
	<div class="mb-3" style="font-size: 25px;">검색 결과</div>
	<a href="${pageContext.request.contextPath}/reservation/registerMyDentist">aaa</a>
	<div style="width: 100%">
		<ol class="hospital-name d-flex">
		
			<div class="hospital-name__item col-md-4" onclick="">
				<div class="item__col">
					<div class="round-thumbnail">
						<i class="fa-solid fa-tooth fa-lg"></i>
					</div>
				</div>
				<div class="item__col">
					<li class="treatment-title">햇살치과</li> <span class="addr">서울시
						마포구 무슨동 111번지</span>
				</div>
			</div>

			<div class="hospital-name__item col-md-4">
				<div class="item__col">
					<div class="round-thumbnail">
						<i class="fa-solid fa-tooth fa-lg"></i>
					</div>
				</div>
				<div class="item__col">
					<li class="treatment-title">고마워치과</li> <span class="addr">서울시
						마포구 무슨동 222번지</span>
				</div>
			</div>

			<div class="hospital-name__item col-md-4">
				<div class="item__col">
					<div class="round-thumbnail">
						<i class="fa-solid fa-tooth fa-lg"></i>
					</div>
				</div>
				<div class="item__col">
					<li class="treatment-title">사랑치과</li> <span class="addr">서울시
						마포구 무슨동 333번지</span>
				</div>
			</div>
		</ol>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>