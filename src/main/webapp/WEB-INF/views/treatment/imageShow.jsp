<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/common/loading.jsp" %>
	<%@ include file="/WEB-INF/views/common/meta.jsp" %>
	<title>후기 작성 - 이미지</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/treatment/reviewForm.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/list-item.css" />
	<style>
	.image-show-page {
		height: 100vh;
		background-color: var(--almost-black-gray);
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.content {
		width: 100%;
	}
	.content__img {
		width: 100%;
	}
	</style>
</head>
<body>
	<main class="image-show-page">
		<div class="content"></div>
		
		<%-- 변수 선언 --%>
		<c:set var="filename" value="${filename}" />

		<script>
			const filename = '${filename}';
			$(function() {
				$(".content").append(
					"<img class='content__img' src='http://localhost:8082/springframework-mini-project-dentist/resources/images/treatment/" + filename + "' alt='content image'/>"
				);
			});
		</script>
	</main>
</body>
</html>
