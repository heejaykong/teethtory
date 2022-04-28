<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<div class="d-flex justify-content-between mx-4 mt-2" style="height: 3rem; font-size: 1.5rem;">
		<span>커뮤니티</span>
		<div class="btn-group">
		  <button type="button" class="btn btn-sm dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
		  </button>
		  <div class="dropdown-menu dropdown-menu-right">
		    <button class="dropdown-item" type="button" onclick="location.href='boardForm'">수정</button>
		    <button class="dropdown-item" type="button" onclick="location.href='main'">삭제</button>
		  </div>
		</div>
	</div>
	<hr style="margin: 0px;">
	<div class="donut">
	
		<div class="board d-flex flex-column" style="margin: 1rem 1rem 0.5rem 1rem;">
			<div class="mb-2">
			<span class="mr-2">금니</span>
			<span class="mr-2">${board.boardwriter}</span>
			<span><fmt:formatDate value="${board.boarddate}" pattern="yyyy-MM-dd"/></span></div>
			<div>${board.boardcontent}</div>
			
			<div>
				<img src="${pageContext.request.contextPath}/resources/images/puppy3.jpeg" width="50%" height="100rem;">
				<img src="${pageContext.request.contextPath}/resources/images/puppy1.jpeg" width="50%" height="100rem;">
			</div>
			
			<div style="text-align: left;" class="mt-2">
				<span class="ml-1"><i class="fa-regular fa-thumbs-up"></i></span><span>5</span>
				<span class="ml-1"><i class="fa-regular fa-comment"></i></span><span>2</span>
			</div>
		</div>
		<button class="btn btn-sm mb-3" style="border: 1px solid grey; margin-left: 1rem;">
		<i class="fa-regular fa-thumbs-up mr-1"></i>공감</button>
		
		
		
		<img src="${pageContext.request.contextPath}/resources/images/puppy2.jpeg" width="100%" height="100rem;">
		
		<div class="board d-flex flex-column" style="padding: 1rem;">
			<div class="d-flex justify-content-between mb-2">
				<div>
					<span class="mr-2"><i class="fa-solid fa-medal"></i></span>
					<span class="mr-2">hello</span>
				</div>
				<div class="btn-group" role="group" aria-label="Button group with nested dropdown">
				  <button type="button" class="btn"><i class="fa-regular fa-thumbs-up"></i></button>
				
				  <div class="btn-group dropleft" role="group">
				    <button id="btnGroupDrop1" type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
				    </button>
				    <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
				      <a class="dropdown-item" href="#">댓글 수정</a>
				      <a class="dropdown-item" href="#">댓글 삭제</a>
				    </div>
				  </div>
				</div>
			</div>
			<div>뉴비야 환영한다1111</div>
			<div style="text-align: left;">
				<span>2022.04.25 15:25</span>
				<span class="ml-1"><i class="fa-regular fa-thumbs-up"></i></span><span>15</span>
			</div>
		</div>
		<hr style="margin: 0px;">
		
		<div class="board d-flex flex-column" style="padding: 1rem;">
			<div class="d-flex justify-content-between mb-2">
				<div>
					<span class="mr-2">동니</span>
					<span class="mr-2">ilovedogs</span>
				</div>
				<div class="btn-group" role="group" aria-label="Button group with nested dropdown">
				  <button type="button" class="btn"><i class="fa-regular fa-thumbs-up"></i></button>
				
				  <div class="btn-group dropleft" role="group">
				    <button id="btnGroupDrop1" type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
				    </button>
				    <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
				      <a class="dropdown-item" href="#">댓글 수정</a>
				      <a class="dropdown-item" href="#">댓글 삭제</a>
				    </div>
				  </div>
				</div>
			</div>
			<div>뉴비야 환영한다222222</div>
			<div style="text-align: left;">
				<span>2022.04.25 15:25</span>
				<span class="ml-1"><i class="fa-regular fa-thumbs-up"></i></span><span>4</span>
			</div>
		</div>
		<hr style="margin: 0px;">
		
	</div>
	<nav aria-label="Page navigation example" style="margin-top: 1rem;">
	  <ul class="pagination justify-content-center">
	    <li class="page-item disabled">
	      <a class="page-link">Previous</a>
	    </li>
	    <li class="page-item"><a class="page-link" href="#">1</a></li>
	    <li class="page-item"><a class="page-link" href="#">2</a></li>
	    <li class="page-item"><a class="page-link" href="#">3</a></li>
	    <li class="page-item">
	      <a class="page-link" href="#">Next</a>
	    </li>
	  </ul>
	</nav>





	 	</section>
	</div> 
<%@ include file="/WEB-INF/views/common/footer.jsp"%>