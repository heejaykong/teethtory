<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<div class="d-flex justify-content-between mx-4 mt-2"
	style="height: 3rem; font-size: 1.5rem;">
	<span><i class="fa-solid fa-xmark mr-4" onclick="location.href='boardDetail?boardno=${board.boardno}'"></i>글 수정</span> 
	<span><input type="submit" value="완료" form="boardUpdate" class="btn btn-sm btn-danger"></input> </span>
</div>
<hr style="margin: 0px;">
<div class="donut">

	<div class="board" style="margin: 1rem 1rem 0.5rem 1rem;">
		<form method="post"
			action="boardUpdate" id="boardUpdate">
			<input type="hidden" name="boardno" value="${board.boardno}"/>
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th><input type="text" class="form-control"
							 name="boardtitle" maxlength="50" value="${board.boardtitle}"></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><textarea class="form-control"
								name="boardcontent" maxlength="2048" style="height: 350px;">
								${board.boardcontent}</textarea></td>
					</tr>
					<tr>
						<td><input type="file" name="fileName"></td>
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