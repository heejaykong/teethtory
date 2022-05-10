<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/common/meta.jsp" %>
	<title>치스토리 - 진료 예약하기</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reservation/main.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/pagination.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/search-bar.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/empty-block.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/list-item.css" />
</head>
<body>
	<%@ include file="/WEB-INF/views/common/loading.jsp" %>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
    <main class="main located-at-bottom-of-header">

		<%-- 검색바 영역 --%>
		<section class="search-bar-block">
			<h1 class="page-title">진료 예약하기</h1>

			<h3 class="section-title">치과 찾기</h3>
	
			<%-- 검색바 --%>
			<div class="search-bar-component">
				<div class="input-and-button">
					<input id="searchInput" type="text" class="search-bar__input" placeholder="치과를 검색해 보세요."/>
					<span id="searchBtn" class="search-bar__submit-btn">
						<i class="fa-solid fa-magnifying-glass"></i>
					</span>
				</div>
				<p class="small-guide-text">찾으시는 치과가 없나요? <a href="#">치과 등록을 요청하세요.</a></p>
			</div>
		</section>

		<%-- 옅은 회색 분리막대 --%>
		<div class="thick-divider"></div>
		
		<%-- 검색결과 영역 --%>
		<%-- 
		내치과	검색치과 	검색어 존재여부
		0		0			1			= (내치과상관없이) 없어요 출력
		1		0			1			= (내치과상관없이) 없어요 출력
		0		1			1			= (내치과상관없이) 검색결과 출력
		1		1			1			= (내치과상관없이) 검색결과 출력
		1		0			0			= 내치과목록 출력
		0		0			0			= 출력하는 것 없음
		--%>
		<section class="search-result-block">
			<c:choose>
				<c:when test="${empty fn:trim(denname)}">
					<%-- 내치과목록 출력 --%>
					<c:forEach var="myDentist" items="${myDentistList}">
						<a href="reservationUsingMap?dendomain=${myDentist.dendomain}">
							<div class="list-item hover-effect" data-dendomain="${myDentist.dendomain}">
								<div class="list-item__info-summary">
									<h4 class="title">
										${myDentist.denname}
										<span class="subtitle">
											<i class="fa-solid fa-circle-check"></i>
											내 치과
										</span>
									</h4>
									<p class="text-sm">${myDentist.denaddress}</p>
								</div>
								<div class="list-item__thumbnail">
									<img src="http://localhost:${myDentist.dendomain}/springframework-mini-project-dentist/deninfo/getDentistImage" onerror="handleNoImage(event)" alt="thumbnail image"/>
								</div>
							</div>
						</a>
						
					</c:forEach>
				</c:when> 
				<c:otherwise>
					<c:choose>
						<c:when test="${fn:length(searchedDentistList) == 0}">
							<div class="empty-block">
								<img src="${pageContext.request.contextPath}/resources/images/toothCharacter/looking-with-a-magnifying-glass.png" alt="looking-with-a-magnifying-glass">
								<p class="text">
									검색한 치과가 없어요.
								</p>
							</div>
						</c:when> 
						<c:otherwise>
							<c:forEach var="searchedDentist" items="${searchedDentistList}">
								<%-- 검색결과 출력 --%>
								<a href="reservationUsingMap?dendomain=${searchedDentist.dendomain}">
									<div class="list-item hover-effect" data-dendomain="${searchedDentist.dendomain}">
										<div class="list-item__info-summary">
											<h4 class="title">
												${searchedDentist.denname}
												<%-- 내치과일 경우에만 '내치과' 딱지 붙여줌 --%>
												<c:if test="${fn:contains(myDentistList, searchedDentist)}">
													<span class="subtitle">
														<i class="fa-solid fa-circle-check"></i>
														내 치과
													</span>		
												</c:if>
											</h4>
											<p class="text-sm">${searchedDentist.denaddress}</p>
										</div>
										<div class="list-item__thumbnail">
											<img src="http://localhost:${searchedDentist.dendomain}/springframework-mini-project-dentist/deninfo/getDentistImage" onerror="handleNoImage(event)" alt="thumbnail image"/>
										</div>
									</div>
								</a>
							</c:forEach>

							<%-- 검색결과 페이지네이션 --%>
							<div class="pagination-component">
								<a onClick="getPage(1)">
									<div class="pagination-btn">
									<i class="fa-solid fa-angles-left"></i>
									</div>
								</a>
								<c:if test="${pager.groupNo>1}">
									<a onClick="getPage(${pager.startPageNo-1})">
										<div class="pagination-btn">
											<i class="fa-solid fa-angle-left"></i>
										</div>
									</a>
								</c:if>
								<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
									<c:if test="${pager.pageNo != i}">
										<a onClick="getPage(${i})">
											<div class="pagination-btn">
												${i}
											</div>
										</a>
									</c:if>
									<c:if test="${pager.pageNo == i}">
										<a onClick="getPage(${i})">
											<div class="pagination-btn pagination-btn-current">
												${i}
											</div>
										</a>
									</c:if>
								</c:forEach>
								<c:if test="${pager.groupNo<pager.totalGroupNo}">
									<a onClick="getPage(${pager.endPageNo+1})">
										<div class="pagination-btn">
											<i class="fa-solid fa-angle-right"></i>
										</div>
									</a>
								</c:if>
								<%-- <c:if test="${pager.totalGroupNo == null}">
									<a>
										<div class="pagination-btn">
											<i class="fa-solid fa-angles-right"></i>
										</div>
									</a>
								</c:if> --%>
								<a onClick="getPage(${pager.totalPageNo})">
									<div class="pagination-btn">
										<i class="fa-solid fa-angles-right"></i>
									</div>
								</a>
							</div> <%-- 페이지네이션 끝 --%>
				
						</c:otherwise>
					</c:choose>
				</c:otherwise> 
			</c:choose>

			<%-- 변수 선언 --%>
			<c:set var="denname" value="${denname}" />
			<script>
				const denname = '${denname}';
				function getPage(pageNo) {
					location.href = "main?denname=" + denname +"&pageNo=" + pageNo;
				}
				function handleNoImage(event){
					const target = event.target;
					target.onerror = null;
					target.src = "${pageContext.request.contextPath}/resources/images/no-image.jpg";
				}
				// 메인함수
				$(function() {
					// 검색 시 요청
					$("#searchBtn").on("click", () => {
						const searchingKeyword = $("#searchInput").val();
						location.href = "main?denname=" + searchingKeyword;
					});
				});
			</script>
        </section>
	</main>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>