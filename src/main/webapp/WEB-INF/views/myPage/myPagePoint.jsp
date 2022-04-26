<%@ page session="false" language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<style>
	#myPointTab {
		color: rgb(242, 101, 34);
	}
</style>
<div class="d-flex">
	<%@ include file="/WEB-INF/views/common/menu.jsp" %>

	<div class="col-sm-10 justify-content-center">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" href="#">포인트 내역</a>
		</nav>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
		    <ul class="navbar-nav">
				<!-- <li id="list_total" class="nav-item active"> -->
				<li id="list_total" class="nav-item">
				  <!-- <a class="nav-link" href="#" onClick="DisplayList(list_items, list_element, rows, current_page), SetupPagination(list_items, pagination_element, rows)">전체<span class="sr-only">(current)</span></a> -->
				  <a class="nav-link" href="#" onClick="list_active('list_total'), DisplayList(list_items, list_element, rows, current_page), SetupPagination(list_items, pagination_element, rows)">전체<span class="sr-only">(current)</span></a>
				</li>
				<li id="list_got" class="nav-item">
				  <a class="nav-link" href="#" onClick="list_active('list_got'), DisplayList(list_got_items, list_element, rows, current_page), SetupPagination(list_got_items, pagination_element, rows)">획득</a>
				</li>
				<li id="list_used" class="nav-item">
				  <a class="nav-link" href="#" onClick="list_active('list_used'), DisplayList(list_used_items, list_element, rows, current_page), SetupPagination(list_used_items, pagination_element, rows)">사용</a>
				</li>
		     </ul>
		</nav>
		
		<table class="table">
		  <thead class="thead-light">
		    <tr>
		      <th scope="col">포인트</th>
		      <th scope="col" colspan="2">적립 구분</th>
		      <th scope="col">날짜</th>
		    </tr>
		  </thead>
		  <tbody id="list">
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
		
		<nav aria-label="Page navigation example">
		  <ul class="pagination justify-content-center">
		    <li class="page-item disabled">
		      <a class="page-link">이전으로</a>
		    </li>
		    <li>
			    <div class="pagenumbers" id="pagination" style="display: flex; flex-wrap: wrap;">
			    </div>
		    </li>
<!-- 		    <li class="page-item"><a class="page-link" href="#">2</a></li>
		    <li class="page-item"><a class="page-link" href="#">5</a></li> -->
		    <li class="page-item">
		      <a class="page-link" href="#">다음으로</a>
		    </li>
		  </ul>
		</nav>
	</div>
</div>

<script type="text/javascript" src="/springframework-mini-project/resources/javascript/myPage/myPoint.js">
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>