<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<div class="d-flex justify-content-between mx-4 mt-2" style="height: 3rem; font-size: 1.5rem;">
		<span>커뮤니티</span>
		<span>
			<i class="fas fa-search"></i>
			<i class="fa-solid fa-pen-to-square ml-2" onclick="location.href='boardForm'"></i>
		</span>
	</div>
	<hr style="margin: 0px;">
	<img src="${pageContext.request.contextPath}/resources/images/puppy2.jpeg" width="100%" height="100rem;">

	<div class="donut">
	
		<div class="board d-flex flex-column" style="padding: 1rem;" onclick="location.href='boardDetail'">
			<div class="mb-2"><span class="mr-2">금니</span><span class="mr-2">strongteeth</span><span>2022.04.25 15:25</span></div>
			<div>교정했는데 원래 이렇게 아픈 거 맞아? 죽을 거 같음. 응응 원래 죽어야 되는데 잠깐 살아있는 거</div>
			<div style="text-align: right;" class="mt-2">
				<span><i class="fa-solid fa-image"></i></span><span>1</span>
				<span class="ml-1"><i class="fa-regular fa-thumbs-up"></i></span><span>5</span>
				<span class="ml-1"><i class="fa-regular fa-comment"></i></span><span>2</span>
			</div>
		</div>
		<hr style="margin: 0px;">
		
		<div class="board d-flex flex-column" style="padding: 1rem;">
			<div class="mb-2"><span class="mr-2"><i class="fa-solid fa-medal"></i></span><span class="mr-2">hello</span><span>2022.04.25 15:25</span></div>
			<div>오스템 임플란트가 정말 품질이 좋나요?</div>
			<div style="text-align: right;" class="mt-2">
				<span class="ml-1"><i class="fa-regular fa-thumbs-up"></i></span><span>5</span>
				<span class="ml-1"><i class="fa-regular fa-comment"></i></span><span>40</span>
			</div>
		</div>
		<hr style="margin: 0px;">
		
		<div class="board d-flex flex-column" style="padding: 1rem;">
			<div class="mb-2"><span class="mr-2">동니</span><span class="mr-2">ilovedogs</span><span>2022.04.25 15:25</span></div>
			<div>부모님 임플란트 해드려야겠다...</div>
			<div style="text-align: right;" class="mt-2">
				<span class="ml-1"><i class="fa-regular fa-thumbs-up"></i></span><span>0</span>
				<span class="ml-1"><i class="fa-regular fa-comment"></i></span><span>0</span>
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