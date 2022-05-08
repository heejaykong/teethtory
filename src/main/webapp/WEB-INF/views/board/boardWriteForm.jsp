<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/common/meta.jsp" %>
	<title>치스토리-커뮤니티</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/loading.jsp" %>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
<div class="located-at-bottom-of-header">
<div class="d-flex justify-content-between align-items-center mx-4 mt-2"
	style="height: 3rem; font-size: 1.5rem;">
	<span><i class="fa-solid fa-xmark mr-4" onclick="location.href='boardList'"></i>글 쓰기</span> 
	<span><input  type="submit" id="complete" value="완료" form="boardWriteForm" class="btn btn-sm btn-danger"></input> </span>
</div>
<hr style="margin: 0px;">
<div class="donut">

	<div class="board" style="margin: 1rem 1rem 0.5rem 1rem;">
		<form id="boardWriteForm" method="post" action="boardWrite" enctype="multipart/form-data">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th><input required type="text" class="form-control" id="title"
							placeholder="글 제목" name="boardtitle" maxlength="50"></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><textarea required class="form-control" placeholder="글 내용" id="content"
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
</div>
	<script>
	
	</script>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>