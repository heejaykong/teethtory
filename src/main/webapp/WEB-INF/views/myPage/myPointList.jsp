<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/common/meta.jsp" %>
	<title>치스토리-마이페이지</title>
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/appIcon.png">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/pagination.css" />
<style>
/* 	#myPointTab {
		color: rgb(242, 101, 34);
	} */
	.fa-coins{
		color:  #ffa048;
	}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/loading.jsp" %>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

			<div class="d-flex located-at-bottom-of-header">
				<div class="col-sm-10">
					<nav class="navbar navbar-expand-lg navbar-light bg-light">
						<a class="navbar-brand" href="#">포인트 내역</a>
					</nav>
					<div class="d-flex mb-2" style="margin-top:1rem; margin-left:1rem;">
						<h2 class="mr-2"><strong>내 포인트</strong></h2>
						<div class="mr-1"><i class="fa-solid fa-coins"></i></div>
						<div><h2>${pointBalance}</h2></div>
					</div>
					<div class="container" style="display:flex; flex-direction:column; text-decoration:none; color:#ffa048;">

						<div style="display:flex; flex-direction:column;">
							<nav class="navbar navbar-expand-lg navbar-light bg-light">
								<ul class="navbar-nav">
									<div class="container" style="display:flex; flex-direction:row;">
										<div style="margin-right:1rem;">
											<li class="nav-item">
												<a id="list_total" class="nav-link" onClick="list_active('list_total'), get_list(1)">전체<span class="sr-only">(current)</span></a>
												<%-- <a id="list_total" class="nav-link active" href="?specification=total" onClick="list_active('list_total')">전체<span class="sr-only">(current)</span></a> --%>
												<%-- <a class="nav-link" href="#" onClick="list_active('list_total'), DisplayList(list_items, list_element, rows, current_page), SetupPagination(list_items, pagination_element, rows)">전체<span class="sr-only">(current)</span></a> --%>
											</li>
										</div>
										<div style="margin-right:1rem;">
											<li class="nav-item">
												<a id="list_got" class="nav-link" onClick="list_active('list_got'), get_list(1)">획득</a>
												<%-- <a class="nav-link" href="#" onClick="list_active('list_got'), DisplayList(list_got_items, list_element, rows, current_page), SetupPagination(list_got_items, pagination_element, rows)">획득</a> --%>
											</li>
										</div>
										<div style="margin-right:1rem;">
											<li class="nav-item">
												<a id="list_used" class="nav-link" onClick="list_active('list_used'), get_list(1)">사용</a>
												<%-- <a class="nav-link" href="#" onClick="list_active('list_used'), DisplayList(list_used_items, list_element, rows, current_page), SetupPagination(list_used_items, pagination_element, rows)">사용</a> --%>
											</li>
										</div>
									</div>
								</ul>
							</nav>
						</div>
						<table class="table">
							<thead class="thead-light">
								<tr>
								<th scope="col">포인트</th>
								<th scope="col">적립 구분</th>
								<th scope="col">날짜</th>
								</tr>
							</thead>
							<tbody id="list">
							<c:forEach var="point" items="${points}">
								<tr>
									<td>
										<c:if test="${point.pointisplus==true}">
											+
										</c:if>
										<c:if test="${point.pointisplus==false}">
											-
										</c:if>
										${point.pointamount}
									</td>
									<td>${point.pointdesc}</td>
									<td><fmt:formatDate value="${point.pointdate}" pattern="yyyy-MM-dd"/></td>
								</tr>
							</c:forEach>
						<!--  <tr>
							<td>+100</td>
							<td class="left" colspan="2">로그인 포인트</td>
							<td>2022.04.16</td>
							</tr>
							<tr>
							<td>-10,000</td>
							<td class="left" colspan="2">스케일링 할인</td>
							<td>2022.04.16</td>
							</tr> -->
							</tbody>
						</table>
						<nav aria-label="Page navigation example" style="margin-top: 1rem;">
							<ul class="pagination justify-content-center">
								<tr>
									<td class="text-center">
										<a onClick="get_list(1)">
											<div class="pagination-btn">
												<i class="fa-solid fa-angles-left"></i>
											</div>
										</a>
										<%-- <a class="btn btn-outline-primary btn-sm" href="myPointList?pageNo=1">처음</a> --%>
										<c:if test="${pager.groupNo>1}">
											<a onClick="get_list(${pager.startPageNo-1})">
												<div class="pagination-btn">
													<i class="fa-solid fa-angle-left"></i>
												</div>
											</a>
											<%-- <a class="btn btn-outline-info btn-sm" href="myPointList?pageNo=${pager.startPageNo-1}">이전</a> --%>
										</c:if>
										
										<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
											<c:if test="${pager.pageNo != i}">
												<a onClick="get_list(${i})">
													<div class="pagination-btn">
														${i}
													</div>
												</a>
												<%-- <a class="btn btn-outline-success btn-sm" href="myPointList?pageNo=${i}">${i}</a> --%>
											</c:if>
											<c:if test="${pager.pageNo == i}">
												<a onClick="get_list(${i})">
													<div class="pagination-btn pagination-btn-current">
														${i}
													</div>
												</a>
												<%-- <a class="btn btn-danger btn-sm" href="myPointList?pageNo=${i}">${i}</a> --%>
											</c:if>
										</c:forEach>
										
										<c:if test="${pager.groupNo<pager.totalGroupNo}">
											<a onClick="get_list(${pager.endPageNo+1})">
												<div class="pagination-btn">
													<i class="fa-solid fa-angle-right"></i>
												</div>
											</a>
										</c:if>
										<a onClick="get_list(${pager.totalPageNo})">
											<div class="pagination-btn">
												<i class="fa-solid fa-angles-right"></i>
											</div>
										</a>
									</td>
								</tr>
							</ul>
						</nav>
						<%-- <nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
							<li class="page-item disabled">
							<a class="page-link">이전으로</a>
							</li>
							<li>
								<div class="pagenumbers" id="pagination" style="display: flex; flex-wrap: wrap;">
								</div>
							</li>
							<li class="page-item">
							<a class="page-link" href="#">다음으로</a>
							</li>
						</ul>
						</nav> --%>
					</div>
				</div>
			</div>


	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<script>
	function list_active(list_id) {
		let list = document.getElementById(list_id);
		list.setAttribute("class", "active");

		const LS_SPECIFICATION_TOTAL = "TOTAL";
		const LS_SPECIFICATION_GOT = "GOT";
		const LS_SPECIFICATION_USED = "USED";
	
		let list_total_element = document.getElementById("list_total");
		let list_got_element = document.getElementById("list_got");
		let list_used_element = document.getElementById("list_used");
		
		//사용 안 하는 탭들 active 속성 제거.
		if(list_id === "list_total") {
			
			localStorage.setItem("selectedTab", LS_SPECIFICATION_TOTAL);
			console.log('list_total 외에 active 속성 제거');
			
		} else if(list_id === "list_got") {
			
			localStorage.setItem("selectedTab", LS_SPECIFICATION_GOT);
			console.log('list_got 외에 active 속성 제거');
			
		} else if(list_id === "list_used") {
			
			localStorage.setItem("selectedTab", LS_SPECIFICATION_USED);
			console.log('list_used 외에 active 속성 제거');
			
		}
	
		if(localStorage.getItem("selectedTab") === null) {
			localStorage.setItem("selectedTab", LS_SPECIFICATION_TOTAL);
		} else {
			localStorage.setItem("selectedTab", localStorage.getItem("selectedTab"));
		}
		
	}
			
	function get_list(pageNo) {
		const userId = 'spring';
		let specification = localStorage.getItem("selectedTab");
		location.href = "myPointList?pageNo=" + pageNo + "&specification=" + specification;
	}
</script>

</body>
</html>
