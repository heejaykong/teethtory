<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<div class="d-flex justify-content-between mx-4 mt-2" style="height: 3rem; font-size: 1.5rem;">
		<span onclick="location.href='boardList'">커뮤니티</span>
		<span>
			<i class="fas fa-search"></i>
			<i class="fa-solid fa-pen-to-square ml-2" onclick="location.href='boardWriteForm'"></i>
		</span>
	</div>
	<hr style="margin: 0px;">
	<img src="${pageContext.request.contextPath}/resources/images/puppy2.jpeg" width="100%" height="100rem;">

	<div class="donut">
		<c:forEach var="board" items="${boards}">
		<div class="board d-flex flex-column" style="padding: 1rem;" onclick="location.href='boardDetail?boardno=${board.boardno}'">
			<div class="mb-2">
				<span class="mr-2">금니</span>
				<span class="mr-2">${board.boardwriter}</span>
				<span><fmt:formatDate value="${board.boarddate}" pattern="yyyy-MM-dd HH:mm"/></span></div>
			<div>${board.boardcontent}</div>
			<div style="text-align: right;" class="mt-2">
				<span><i class="fa-solid fa-image"></i></span><span>1</span>
				<span class="ml-1"><i class="fa-regular fa-thumbs-up"></i></span><span>5</span>
				<span class="ml-1"><i class="fa-regular fa-comment"></i></span><span>2</span>
			</div>
		</div>
		<hr style="margin: 0px;">
		</c:forEach>
	</div>
	
	<nav aria-label="Page navigation example" style="margin-top: 1rem;">
	  <ul class="pagination justify-content-center">
	  <li><a class="page-link" href="boardList?pageNo=1"><<</a></li>
	    <li class="page-item">
			<c:if test="${pager.groupNo>1}">
				<a class="page-link" href="boardList?pageNo=${pager.startPageNo-1}"><</a>
			</c:if>
	    </li>
	  
	    <c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
			<c:if test="${pager.pageNo != i}">
				<li class="page-item"><a class="page-link" href="boardList?pageNo=${i}">${i}</a>
			</c:if>
			<c:if test="${pager.pageNo == i}">
				<li class="page-item active" aria-current="page"><a class="page-link">${i}</a>
			</c:if>
		</c:forEach>
		
	    <li class="page-item">
		    <c:if test="${pager.groupNo<pager.totalGroupNo}">
				<a class="page-link" href="boardList?pageNo=${pager.endPageNo+1}">></a>
			</c:if>
	    </li>
	    <li><a class="page-link" href="boardList?pageNo=${pager.totalPageNo}">>></a></li>
	    
	  </ul>
	</nav>





	 	</section>
	</div> 
<%@ include file="/WEB-INF/views/common/footer.jsp"%>