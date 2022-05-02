<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/common/meta.jsp" %>
	<title>치스토리-커뮤니티</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
<div class="located-at-bottom-of-header">
<div class="d-flex justify-content-between mx-4 mt-2"
	style="height: 3rem; font-size: 1.5rem;">
	<span><i class="fa-solid fa-xmark mr-4" onclick="location.href='boardDetail?boardno=${comment.boardno}'"></i>댓글 수정</span> 
	<span><input type="submit" value="완료" form="commentUpdate" class="btn btn-sm btn-danger"></input> </span>
</div>
<hr style="margin: 0px;">
<div class="donut">

	<div class="comment" style="margin: 1rem 1rem 0.5rem 1rem;">
		<form method="post"
			action="commentUpdate" id="commentUpdate">
			<input type="hidden" name="boardno" value="${comment.boardno}"/>
			<input type="hidden" name="commentno" value="${comment.commentno}"/>
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<tbody>
					<tr>
						<td><textarea class="form-control"
								name="commentcontent" maxlength="2048" style="height: 350px;">
								${comment.commentcontent}</textarea></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>

	<img
		src="${pageContext.request.contextPath}/resources/images/puppy2.jpeg"
		width="100%" height="100rem;">
</div>
</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>