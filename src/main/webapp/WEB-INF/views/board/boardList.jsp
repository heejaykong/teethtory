<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/common/meta.jsp" %>
	<title>치스토리-커뮤니티</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/pagination.css" />
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
		width:  2rem;
		height: 2rem;
		border-radius: 50%;
	}
	
	.docterCheck {
		font-size: 1rem;
		color: #42A5F5;
	}
	
	#fa-seedling {
		font-size: 1.5rem;
		color:  rgb(164, 211, 147);
	}
	
	#fa-pagelines {
		font-size: 1.5rem;
		color: rgb(13, 173, 27);
	}
	
	#fa-tree {
		font-size: 1.5rem;
		color: rgb(10, 109, 18);
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
	<%@ include file="/WEB-INF/views/common/loading.jsp" %>
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
			<div class="d-flex align-items-center mb-2">
				<%-- <c:if test="${board.backgroundColor != null}"><div class="writer__img mr-2" style="display: inline-block; background-color: ${board.backgroundColor};"></div></c:if> --%>
				<c:if test="${board.backgroundColor != null && board.backgroundColor eq 'fa-seedling'}"><i class="fa-solid fa-seedling mr-2" id="fa-seedling"></i></c:if>
				<c:if test="${board.backgroundColor != null && board.backgroundColor eq 'fa-pagelines'}"><i class="fa-brands fa-pagelines mr-2" id="fa-pagelines"></i></c:if>
				<c:if test="${board.backgroundColor != null && board.backgroundColor eq 'fa-tree'}"><i class="fa-solid fa-tree mr-2" id="fa-tree"></i></c:if>
				<span style="font-weight: bold;" class="mr-1">${board.boardwriter}</span>
				<c:if test="${board.doctor != null}"><i class="fa-solid fa-circle-check mr-2 docterCheck"></i></c:if>
				<span style="color: dimgray;"><fmt:formatDate value="${board.boarddate}" pattern="YYYY.MM.dd. HH:mm"/></span>
			</div>
			<div class="mb-1 ml-1"><h4>${board.boardtitle}</h4></div>
			<div class="ml-1"><h5>${board.boardcontent}</h5></div>
			<div class="d-flex justify-content-end" style="font-size: 0.8rem;">
				<div>
					<c:if test="${board.filecount}"><span><i class="fa-solid fa-image"></i></span><span class="ml-1">1</span></c:if>
					<span class="ml-1" style="color: red"><i class="fa-regular fa-thumbs-up"></i></span><span class="ml-1" style="color: red">${board.boardlike}</span>
					<span class="ml-1" style="color: rgb(18, 220, 247)"><i class="fa-regular fa-comment"></i></span><span class="ml-1" style="color: rgb(18, 220, 247)">${board.commentcount}</span>
				</div>
			</div>
		</div>
		<hr style="margin: 0px;">
		</c:forEach>
	</div>
	
	<nav aria-label="Page navigation example" style="margin-top: 1rem;"> 
	  <ul class="pagination justify-content-center">
	    <%-- <li class="page-item"> --%>
		<%-- <div class="pagination-component"> --%>
			<a href="boardList?pageNo=1">
				<div class="pagination-btn">
					<i class="fa-solid fa-angles-left"></i>
				</div>
			</a>
			<c:if test="${pager.groupNo>1}">
				<a href="boardList?pageNo=${pager.startPageNo-1}">
					<div class="pagination-btn">
						<i class="fa-solid fa-angle-left"></i>
					</div>
				</a>
			</c:if>
	    <%-- </li> --%>
	  
	    <c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
			<c:if test="${pager.pageNo != i}">
				<%-- <li class="page-item"> --%>
				<a href="boardList?pageNo=${i}">
					<div class="pagination-btn">
						${i}
					</div>
				</a>
			</c:if>
			<c:if test="${pager.pageNo == i}">
				<%-- <li class="page-item active" aria-current="page"> --%>
				<a>
					<div class="pagination-btn pagination-btn-current">
						${i}
					</div>
				</a>
			</c:if>
		</c:forEach>
	    <%-- <li class="page-item"> --%>
		    <c:if test="${pager.groupNo<pager.totalGroupNo}">
				<a href="boardList?pageNo=${pager.endPageNo+1}">
					 <div class="pagination-btn">
						<i class="fa-solid fa-angle-right"></i>
					</div>
				</a>
			</c:if>
	    <%-- </li> --%>
	    <li>
			<a href="boardList?pageNo=${pager.totalPageNo}">
				<div class="pagination-btn">
					<i class="fa-solid fa-angles-right"></i>
				</div>
			</a>
		</li>
	    </div>
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
