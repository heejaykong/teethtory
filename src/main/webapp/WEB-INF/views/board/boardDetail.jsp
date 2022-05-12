<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/common/meta.jsp" %>
	<title>치스토리-커뮤니티</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/pagination.css" />
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
.boardwriter__img {
	width: 2rem;
	height: 2rem;
	border-radius: 50%;
}

.writer__img {
	width: 1.5rem;
	height: 1.5rem;
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

#boardtitle {
	font-size: 1.5rem;
	font-weight: bold;
}

#boardcontent {
	font-size: 1rem;
	color: dimgray;
}

#commentcontent {
	font-size: 1rem;
}
</style>
</head>
<script>
	// let attachedImgData = "${pageContext.request.contextPath}/board/boardDetailAttachedFile?boardno=" + ${board.boardno};
	// if(typeof attachedImgData !== "undefind") {
	// 	$('#attachedImg').attr("src", attachedImgData);
	// } else {
	// 	$('#attachedImg').attr("style", "display: none");
	// }
	$.ajax({
		url: "boardDetailAttachedFile?boardno=" + ${board.boardno},
		method:"GET",
	})
	.done((data) => {
		console.log('data : ' + data);
		console.log('typeof data : ' + typeof data);

		if(typeof data == "undefind") {
			$('#attachedImg').attr("style", "display:none");
		} else {
			$('#attachedImg').attr("src", "boardDetailAttachedFile?boardno=" + ${board.boardno});
		}
	});
</script>
<body>
	<%@ include file="/WEB-INF/views/common/loading.jsp" %>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	
<div class="located-at-bottom-of-header">
	<div class="d-flex justify-content-between mx-4 mt-2" style="height: 3rem; font-size: 1.5rem;">
		<span style="margin-top:0.7rem;"onclick="location.href='boardList'">커뮤니티</span>
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
	
	<div class="donut mx-3 mt-2" >
	
		<div class="board d-flex flex-column" style="padding: 0.5rem;">
			<div class="d-flex mb-3">
				<c:if test="${board.backgroundColor != null && board.backgroundColor eq 'fa-seedling'}"><i class="fa-solid fa-seedling mr-2" id="fa-seedling"></i></c:if>
				<c:if test="${board.backgroundColor != null && board.backgroundColor eq 'fa-pagelines'}"><i class="fa-brands fa-pagelines mr-2" id="fa-pagelines"></i></c:if>
				<c:if test="${board.backgroundColor != null && board.backgroundColor eq 'fa-tree'}"><i class="fa-solid fa-tree mr-2" id="fa-tree"></i></c:if>

				<div class="d-flex flex-column">
					<span class="mr-2"><h4>${board.boardwriter}</h4></span>
					<span style="color: dimgray; font-size: 0.8rem;"><fmt:formatDate value="${board.boarddate}" pattern="MM/dd HH:mm"/></span>
				</div>
				<c:if test="${board.backgroundColor != null && board.backgroundColor eq 'fa-user-doctor'}"><i class="fa-solid fa-circle-check mr-2 docterCheck"></i></c:if>
			</div>
			
			<div class="mb-3" id="boardtitle">${board.boardtitle}</div>
			<div class="mb-2" id="boardcontent">${board.boardcontent}</div>
			<c:if test="${board.filecount}"><img id="attachedImg" style="background-size: cover; width: 100%;"></c:if>
			<div style="font-size: 0.8rem;" class="mt-2">
				<div>
					<span class="ml-1" style="color: red"><i class="fa-regular fa-thumbs-up"></i></span><span class="ml-1" style="color: red">${board.boardlike}</span>
					<span class="ml-1" style="color: rgb(18, 220, 247)"><i class="fa-regular fa-comment"></i></span><span class="ml-1" style="color: rgb(18, 220, 247)">${board.commentcount}</span>
				</div>
			</div>
		</div>
		<button class="btn btn-sm mb-2" style="border: 1px solid grey; margin-left: 0.5rem;"><i class="fa-regular fa-thumbs-up mr-1"></i>공감</button>
		<hr style="margin: 0px;">
		<a href="${banner.bannerlink}" target="_blank">
		<img id="banner" src="${pageContext.request.contextPath}/resources/images/banner/${banner.bannername}" 
			 style="background-size: cover; width: 100%;">
		</a>
	<div class="donut mt-2">
		<div class="d-flex mb-2">
			<form method="post" action="commentWrite" id="commentWrite">
				<table style="width: auto;">
					<tr>
						<td style="display: none;"><input type="hidden" name="boardno" value="${board.boardno}" style="display: none;"/></td>
						<td><input style="width: 15.5rem;" required id="updateform" class="form-control" placeholder="댓글을 입력하세요." name="commentcontent" type="text"/></td>
					</tr>
				</table>
			</form>
			<button id="write" style="margin-left: 1rem;"class="btn btn-primary btn-sm" form="commentWrite">댓글 작성</button>
		</div>
		
		<c:forEach var="comment" items="${comments}">
		<hr style="margin: 0px;">
		<div class="board d-flex flex-column" style="padding: 0.5rem;">
			<div class="d-flex justify-content-between align-items-center">
				<div class="d-flex">
					<c:if test="${comment.backgroundColor != null && comment.backgroundColor eq 'fa-seedling'}"><i class="fa-solid fa-seedling mr-2" id="fa-seedling"></i></c:if>
					<c:if test="${comment.backgroundColor != null && comment.backgroundColor eq 'fa-pagelines'}"><i class="fa-brands fa-pagelines mr-2" id="fa-pagelines"></i></c:if>
					<c:if test="${comment.backgroundColor != null && comment.backgroundColor eq 'fa-tree'}"><i class="fa-solid fa-tree mr-2" id="fa-tree"></i></c:if>
					<div style="font-size: 1.1rem; font-weight: bold;" class="mt-1">
						${comment.commentwriter}
						<c:if test="${comment.backgroundColor != null && comment.backgroundColor eq 'fa-user-doctor'}"><i class="fa-solid fa-circle-check mr-2 docterCheck"></i></c:if>
					</div>
					
				</div>
				
				<div class="btn-group" role="group" aria-label="Button group with nested dropdown">
				  <button type="button" class="btn"><i class="fa-regular fa-thumbs-up"></i></button>
				  
			  <c:if test="${comment.commentwriter == userid}">
				  <div class="btn-group dropleft" role="group">
				    <button id="btnGroupDrop1" type="button" class="btn " data-toggle="dropdown" aria-expanded="false">
				    	<i class="fa-solid fa-ellipsis-vertical"></i>
				    </button>
				    <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
				      <a class="dropdown-item" href="commentUpdateForm?commentno=${comment.commentno}">댓글 수정</a>
				      <a class="dropdown-item" href="commentDelete?commentno=${comment.commentno}">댓글 삭제</a>
				    </div>
				  </div>
				  </c:if>
				</div>
			</div>
			
			<div id="commentcontent" class="mb-2">${comment.commentcontent}</div>
			<div style="text-align: left; font-size: 0.8rem;">
				<span style="color: dimgray;"><fmt:formatDate value="${comment.commentdate}" pattern="MM/dd HH:mm"/></span>
				<span class="ml-1" style="color: red"><i class="fa-regular fa-thumbs-up"></i></span><span style="color: red" class="ml-1">${comment.commentlike}</span>
			</div>
		</div>
		</c:forEach>
	</div>
	<c:if test="${pager != null}">
	<nav aria-label="Page navigation example" style="margin-top: 1rem;">
	  <ul class="pagination justify-content-center">
	  <%-- <li> --%>
	  <div class="pagination-component">
	  	<a href="boardDetail?boardno=${board.boardno}&pageNo=1">
			 <div class="pagination-btn">
				<i class="fa-solid fa-angles-left"></i>
			</div>
		</a>
	<%-- </li> --%>
	    <%-- <li class="page-item"> --%>
			<c:if test="${pager.groupNo>1}">
				<a href="boardDetail?boardno=${board.boardno}&pageNo=${pager.startPageNo-1}">
					<div class="pagination-btn">
						<i class="fa-solid fa-angle-left"></i>
					</div>
				</a>
			</c:if>
	    <%-- </li> --%>
	  
	    <c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
			<c:if test="${pager.pageNo != i}">
				<%-- <li class="page-item"> --%>
				<a href="boardDetail?boardno=${board.boardno}&pageNo=${i}">
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
				<a href="boardDetail?boardno=${board.boardno}&pageNo=${pager.endPageNo+1}">
					<div class="pagination-btn">
						<i class="fa-solid fa-angle-right"></i>
					</div>
				</a>
			</c:if>
	    <%-- </li> --%>
	    <%-- <li> --%>
		<a href="boardDetail?boardno=${board.boardno}&pageNo=${pager.totalPageNo}">
			 <div class="pagination-btn">
				<i class="fa-solid fa-angles-right"></i>
			</div>
		</a>
		<%-- </li> --%>
		</div>
	  </ul>
	</nav>
	</c:if>
</div>
</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
