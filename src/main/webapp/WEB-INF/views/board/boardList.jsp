<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/common/loading.jsp" %>
	<%@ include file="/WEB-INF/views/common/meta.jsp" %>
	<title>치스토리-커뮤니티</title>
</head>
<style>
	.fa-search{
		font-weight : 900;
		font-family: "Font Awesome 5 Free";
		background-color : transparent;
		border : none;
		cursor : pointer;
		position : absolute;
		right : 5px;
		top : 50%;
		transform : translatey(-50%);
	}
	
	.writer__img {
		width:  0.7rem;
		height: 0.7rem;
		border-radius: 50%;
	}
    h4 {
    	font-size: 1.1rem;
    	font-weight: bold;
    }
    
    h5 {
    	font-size: 0.8rem;
    	color: dimgray;
    }
}
</style>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	
<div class="located-at-bottom-of-header">
	<div class="d-flex justify-content-between mx-4 mt-2" style="height: 3rem; font-size: 1.5rem;">
		<span style="margin-top:0.7rem;" onclick="location.href='boardList'">자유게시판</span>
		
		<div style="position:relative; margin-top:0.2rem; margin-right: -4rem;">
		<input id="search" type="text" value="" style="width:8rem; border-radius: 0.2rem;"/>
		<i class="fas fa-search" style="position:absolute; margin-bottom:0.8rem;" onclick="searchBoard()"></i>
		</div>
		<i style="margin-top:0.8rem; margin-right: -1rem;"class="fa-solid fa-pen-to-square" onclick="location.href='boardWriteForm'"></i>
	
	</div>
	<hr style="margin: 0px;">

	<div class="donut mx-3 mt-2" >
		<c:forEach var="board" items="${boards}">
		<div class="board d-flex flex-column" style="padding: 0.5rem;" onclick="location.href='boardDetail?boardno=${board.boardno}'">
			<div class="mb-1"><h4>${board.boardtitle}</h4></div>
			<div class="mb-2"><h5>${board.boardcontent}</h5></div>
			<div class="d-flex justify-content-between" style="font-size: 0.8rem;">
				<div style="color: dimgray;">
					<span><fmt:formatDate value="${board.boarddate}" pattern="MM/dd"/></span>
					<c:if test="${board.backgroundColor != null}"><div class="writer__img ml-2" style="display: inline-block; background-color: ${board.backgroundColor};"></div></c:if>
					<span class="mr-2">${board.boardwriter}</span>
				</div>
				<div>
					<c:if test="${board.filecount}"><span><i class="fa-solid fa-image"></i></span><span class="ml-1">1</span></c:if>
					<span class="ml-1" style="color: red"><i class="fa-regular fa-thumbs-up"></i></span><span class="ml-1" style="color: red">0</span>
					<span class="ml-1" style="color: rgb(18, 220, 247)"><i class="fa-regular fa-comment"></i></span><span class="ml-1" style="color: rgb(18, 220, 247)">${board.commentcount}</span>
				</div>
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
	</div>
	<script>
		
		function searchBoard(){
			var s = document.getElementById('search').value;
			
			location.href='searchBoardList?boardtitle='+s;
			
		}
		
	
	</script>


	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
