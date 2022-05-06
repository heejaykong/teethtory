<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/common/meta.jsp" %>
	<title>치스토리-커뮤니티</title>
<style>
.modal{ 
  position:absolute; width:100%; height:100%; background: rgba(0,0,0,0.8); top:0; left:0; display:none;
}
.modal_content{
  width:400px; height:200px;
  background:#fff; border-radius:10px;
  position:relative; top:30%; left:50%;
  margin-top:-100px; margin-left:-200px;
  text-align:center;
  box-sizing:border-box; padding:74px 0;
  line-height:23px; cursor:pointer;
}
	.writer__img {
		width: 1rem;
		height: 1rem;
		border-radius: 50%;
	}
</style>
</head>
<script>
	$.ajax({
		url: "boardDetailAttachedFile?boardno=" + ${board.boardno},
		method:"GET",
	})
	.done((data) => {
		console.log('data : ' + data);
		console.log('typeof data : ' + typeof data);
		if(data == '') {
			$('#attachedImg').attr("style", "display:none");
		} else {
			$('#attachedImg').attr("src", "boardDetailAttachedFile?boardno=" + ${board.boardno});
		}
	});
</script>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	
<div class="located-at-bottom-of-header">
	<div class="d-flex justify-content-between mx-4 mt-2" style="height: 3rem; font-size: 1.5rem;">
		<span style="margin-top:1rem;"onclick="location.href='boardList'">커뮤니티</span>
		<c:if test="${board.boardwriter == userid}">
		<div class="btn-group">
		  <button type="button" class="btn btn-sm dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
		  </button>
		  <div class="dropdown-menu dropdown-menu-right">
		    <button class="dropdown-item" type="button" onclick="location.href='boardUpdateForm?boardno=${board.boardno}'">수정</button>
		    <button class="dropdown-item" type="button" onclick="location.href='boardDelete?boardno=${board.boardno}'">삭제</button>
		  </div>
		</div>
		</c:if>
	</div>
	<hr style="margin: 0px;">
	<div class="donut">
	
		<div class="board d-flex flex-column" style="margin: 1rem 1rem 0.5rem 1rem;">
			<div class="mb-2">
			<div class="writer__img" style="display: inline-block; background-color: ${board.backgroundColor};"></div>
			<span class="mr-2">${board.boardwriter}</span>
			<span><fmt:formatDate value="${board.boarddate}" pattern="yyyy-MM-dd HH:mm"/></span></div>
			<div>${board.boardcontent}</div>
			
			<div>
				<img id="attachedImg" width="50%" height="100rem;">
			</div>
			
			<div style="text-align: left;" class="mt-2">
				<span class="ml-1"><i class="fa-regular fa-thumbs-up"></i></span><span>5</span>
				<span class="ml-1"><i class="fa-regular fa-comment"></i></span><span>2</span>
			</div>
		</div>
		<button class="btn btn-sm mb-3" style="border: 1px solid grey; margin-left: 1rem;">
		<i class="fa-regular fa-thumbs-up mr-1"></i>공감</button>
	</div>
		
		
		<img src="${pageContext.request.contextPath}/resources/images/puppy2.jpeg" width="100%" height="100rem;">
		
		

	<div class="donut">
		<form method="post"
			action="commentWrite" id="commentWrite">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<tr>
				<td><input type="hidden" name="boardno" value="${board.boardno}"/></td>
					<td><textarea required id="updateform" class="form-control" placeholder="글 내용"
							name="commentcontent" maxlength="2048" style="height: 50px; width:92%;"></textarea></td>
				</tr>
			</table>
		</form>
		<button id="write"style="margin-left: 1rem;"class="btn btn-primary btn-sm" form="commentWrite">댓글 작성</button>
		
		<c:forEach var="comment" items="${comments}">
		<div class="board d-flex flex-column" style="padding: 1rem;">
			<div class="d-flex justify-content-between mb-2">
				<div>
					<div class="writer__img" style="display: inline-block; background-color: ${comment.backgroundColor};"></div>
					<span class="mr-2">${comment.commentwriter}</span>
				</div>
				<div class="btn-group" role="group" aria-label="Button group with nested dropdown">
				  <button type="button" class="btn"><i class="fa-regular fa-thumbs-up"></i></button>
				  
				  <c:if test="${comment.commentwriter == userid}">
				  <div class="btn-group dropleft" role="group">
				    <button id="btnGroupDrop1" type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
				    </button>
				    <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
				      <a class="dropdown-item" href="commentUpdateForm?commentno=${comment.commentno}">댓글 수정</a>
				      <a class="dropdown-item" href="commentDelete?commentno=${comment.commentno}">댓글 삭제</a>
				    </div>
				  </div>
				  </c:if>
				</div>
			</div>
			<div id="content">${comment.commentcontent}</div>
			<div style="text-align: left;">
				<span><fmt:formatDate value="${comment.commentdate}" pattern="yyyy-MM-dd HH:mm"/></span>
				<span class="ml-1"><i class="fa-regular fa-thumbs-up"></i></span><span>15</span>
			</div>
		</div>
		<hr style="margin: 0px;">
		</c:forEach>
	</div>
	
	<nav aria-label="Page navigation example" style="margin-top: 1rem;">
	  <ul class="pagination justify-content-center">
	  <li><a class="page-link" href="boardDetail?boardno=${board.boardno}&pageNo=1"><<</a></li>
	    <li class="page-item">
			<c:if test="${pager.groupNo>1}">
				<a class="page-link" href="boardDetail?boardno=${board.boardno}&pageNo=${pager.startPageNo-1}"><</a>
			</c:if>
	    </li>
	  
	    <c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
			<c:if test="${pager.pageNo != i}">
				<li class="page-item"><a class="page-link" href="boardDetail?boardno=${board.boardno}&pageNo=${i}">${i}</a>
			</c:if>
			<c:if test="${pager.pageNo == i}">
				<li class="page-item active" aria-current="page"><a class="page-link">${i}</a>
			</c:if>
		</c:forEach>
		
	    <li class="page-item">
		    <c:if test="${pager.groupNo<pager.totalGroupNo}">
				<a class="page-link" href="boardDetail?boardno=${board.boardno}&pageNo=${pager.endPageNo+1}">></a>
			</c:if>
	    </li>
	    <li><a class="page-link" href="boardDetail?boardno=${board.boardno}&pageNo=${pager.totalPageNo}">>></a></li>
	    
	  </ul>
	</nav>
</div>
<script>

</script>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
