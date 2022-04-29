<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<div class="d-flex justify-content-between mx-4 mt-2"
	style="height: 3rem; font-size: 1.5rem;">
	<span><i class="fa-solid fa-xmark mr-4" onclick="location.href='boardList'"></i>글 쓰기</span> 
	<span><input type="submit" value="완료" form="boardWriteForm" class="btn btn-sm btn-danger"></input> </span>
</div>
<hr style="margin: 0px;">
<div class="donut">

	<div class="board" style="margin: 1rem 1rem 0.5rem 1rem;">
		<form id="boardWriteForm" method="post" action="boardWrite" enctype="multipart/form-data">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th><input type="text" class="form-control"
							placeholder="글 제목" name="boardtitle" maxlength="50"></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><textarea class="form-control" placeholder="글 내용"
								name="boardcontent" maxlength="2048" style="height: 350px;"></textarea></td>
					</tr>
					<tr>
						<td><input id="battach" type="file" name="battach" class="form-control"></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>

	<img
		src="${pageContext.request.contextPath}/resources/images/puppy2.jpeg"
		width="100%" height="100rem;">
</div>







</section>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>