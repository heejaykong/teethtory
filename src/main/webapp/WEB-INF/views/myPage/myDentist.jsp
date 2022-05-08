<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/common/meta.jsp" %>
	<title>치스토리 - 내 치과</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPage/myDentist.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/empty-block.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/pagination.css" />
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<main class="main located-at-bottom-of-header">
		
		<%-- '내 치과 목록' 블록 --%>
		<section class="my-dentists-list-block">
			<h1 class="page-title">내 치과 목록</h1>

			<c:if test="${fn:length(myDentists) == 0}">
				<div class="empty-block">
					<img src="${pageContext.request.contextPath}/resources/images/toothCharacter/tears.png" alt="tears-tooth-character">
					<p class="text">
						내 치과 목록이 비었어요.<br/>
						내 치과를 추가해 주세요.
					</p>
				</div>
			</c:if>		
			
			<c:forEach var="myDentist" items="${myDentists}">
				<%-- 내 치과 리스트아이템 --%>
				<div class="dentist-list-item" data-denno="${myDentist.denno}" data-denname="${myDentist.denname}">
					<div class="dentist-list-item__main-body">
						<div class="main-body__col">
							<div class="main-body__img"></div>
							<div class="main-body__nametag">
								<p class="name overflow-ellipsis">${myDentist.denname}</p>
								<span class="address overflow-ellipsis">${myDentist.denaddress}</span>
							</div>
						</div>
						<div class="main-body__col">
							<span class="dropdown-btn">
								<i class="fa-solid fa-chevron-down"></i>
							</span>
						</div>
					</div>
					<%-- 바디 클릭하면 보이는 드롭다운메뉴--%>
					<div class="dentist-list-item__dropdown-menu-list basic-shadow" style="display: none;">
						<ol class="menu-list">
							<li class="menu-btn delete-btn"
								data-toggle="modal" data-target="#confirmModal">
								내 치과 목록에서 삭제하기
							</li>
						</ol>
					</div>
				</div>
			</c:forEach>
		</section>
		
		<div class="thick-divider"></div>

		<%-- '추가하기' 블록 --%>
		<section class="add-dentist-block">
			<h3 class="section-title-sm">추가하기</h3>

			<%-- 검색바 --%>
			<div class="search-bar-component">
				<input id="searchInput" type="text" class="search-bar__input" placeholder="내 치과를 검색해 보세요."/>
				<span id="searchBtn" class="search-bar__submit-btn">
					<i class="fa-solid fa-magnifying-glass"></i>
				</span>
			</div>
			
			<%-- 검색결과 --%>
			<div class="search-result">
				<c:if test="${fn:length(searchedDentistList) == 0}">
					<div class="empty-block">
						<img src="${pageContext.request.contextPath}/resources/images/toothCharacter/looking-with-a-magnifying-glass.png" alt="looking-with-a-magnifying-glass-tooth-character">
						<p class="text">검색된 치과가 없어요.</p>
					</div>
				</c:if>
				
				<c:if test="${fn:length(searchedDentistList) > 0}">
					<c:forEach var="searchedDentist" items="${searchedDentistList}">
						<%-- 검색결과 치과 리스트 아이템 --%>
						<%-- TBD: 이미 내 치과에 등록된 놈이면 모양 비활성화하기 기능구현 --%>
						<div class="dentist-list-item" data-denno="${searchedDentist.denno}" data-denname="${searchedDentist.denname}">
							<div class="dentist-list-item__main-body">
								<div class="main-body__col">
									<div class="main-body__img"></div>
									<div class="main-body__nametag">
										<p class="name overflow-ellipsis">${searchedDentist.denname}</p>
										<span class="address overflow-ellipsis">${searchedDentist.denaddress}</span>
									</div>
								</div>
								<div class="main-body__col">
									<span class="dropdown-btn">
										<i class="fa-solid fa-chevron-down"></i>
									</span>
								</div>
							</div>
							<%-- 바디 클릭하면 보이는 드롭다운메뉴--%>
							<div class="dentist-list-item__dropdown-menu-list basic-shadow" style="display: none;">
								<ol class="menu-list">
									<li class="menu-btn add-btn"
										data-toggle="modal" data-target="#confirmModal">
										내 치과 목록에 추가하기
									</li>
								</ol>
							</div>
						</div>
					</c:forEach>

					<%-- 페이지네이션 --%>
					<div class="pagination-component">
						<a href="myDentist?denname=${denname}&pageNo=1">
							<div class="pagination-btn">
								<i class="fa-solid fa-angles-left"></i>
							</div>
						</a>
						<c:if test="${pager.groupNo>1}">
							<a href="myDentist?denname=${denname}&pageNo=${pager.startPageNo-1}">
								<div class="pagination-btn">
									<i class="fa-solid fa-angle-left"></i>
								</div>
							</a>
						</c:if>
		
						<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
							<c:if test="${pager.pageNo != i}">
								<a href="myDentist?denname=${denname}&pageNo=${i}">
									<div class="pagination-btn">
										${i}
									</div>
								</a>
							</c:if>
							<c:if test="${pager.pageNo == i}">
								<a href="myDentist?denname=${denname}&pageNo=${i}">
									<div class="pagination-btn pagination-btn-current">
										${i}
									</div>
								</a>
							</c:if>
						</c:forEach>
		
						<c:if test="${pager.groupNo<pager.totalGroupNo}">
							<a href="myDentist?denname=${denname}&pageNo=${pager.endPageNo+1}">
								<div class="pagination-btn">
									<i class="fa-solid fa-angle-right"></i>
								</div>
							</a>
						</c:if>
						<a href="myDentist?denname=${denname}&pageNo=${pager.totalPageNo}">
							<div class="pagination-btn">
								<i class="fa-solid fa-angles-right"></i>
							</div>
						</a>
					</div>
				</c:if>
			</div>

		</section>
	</main>
	
	<%-- 치과 삭제/추가 시 뜨는 모달 --%>
	<div id="confirmModal" class="modal fade" tabindex="-1" aria-labelledby="confirmModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title"></h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<%--
					선택된 버튼에 따라
					내 치과 목록에서 삭제하시겠어요?
					또는
					내 치과 목록에 추가하시겠어요? 표시
					--%>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-osstem-secondary" data-dismiss="modal">아뇨</button>
					<button id="confirmBtn" type="button" class="btn btn-osstem-primary">네</button>
				</div>
			</div>
		</div>
	</div>

	<script>
		// 검색바 로직
		$("#searchBtn").on("click", () => {
			const searchingKeyword = $("#searchInput").val();
			location.href = "myDentist?denname=" + searchingKeyword;
		});

		function isDeleteBtn(btnTriggered) {
			if (!btnTriggered[0].classList.contains("delete-btn")){
				return false;
			}
			return true;			
		}

		$(function() {
			// 치과당 클릭할 때 클릭된 타겟의 드롭다운 토글하기
			$(".dentist-list-item").click(function(){
				$(".dentist-list-item__dropdown-menu-list", this).toggle();
			});
			$('#confirmModal').on('show.bs.modal', function (event) {
				const btnTriggered = $(event.relatedTarget);
				const targetDenno = btnTriggered.closest("[data-denno]").data("denno");
				const targetDenname = btnTriggered.closest("[data-denname]").data("denname");

				// 모달을 trigger한 치과와 버튼(삭제/추가)에 따라 내용 다르게 그려주기
				const modal = $(this);
				//const message =  btnTriggered[0].classList.contains("delete-btn") ?
				const message =  isDeleteBtn(btnTriggered) ?
						"내 치과 목록에서 삭제하시겠어요?" : "내 치과 목록에 추가하시겠어요?";
				modal.find(".modal-title").html(targetDenname);
				modal.find(".modal-body").html(message);

				// 모달의 '예' 버튼 선택 시 상황(삭제/추가)에 따라 다르게 요청하기
				$('#confirmBtn').on("click", function() {
					const task = isDeleteBtn(btnTriggered) ? "delete" : "add";
					location.href = "myDentist?denno=" + targetDenno + "&task=" + task;
				});
			});
		})
	</script>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
