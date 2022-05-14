<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/common/meta.jsp" %>
	<title>치스토리 - 후기 작성</title>
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/appIcon.png">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/treatment/reviewForm.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/list-item.css" />
</head>
<body>
	<%@ include file="/WEB-INF/views/common/loading.jsp" %>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<main class="main located-at-bottom-of-header">
		<h1 class="page-title">후기 작성</h1>

		<%-- 치과 정보요약 영역--%>
		<section class="dentist-info-section">
			<%-- 넘겨받은 치과 정보요약 display --%>
		</section>

		<%-- 후기 작성 영역 --%>
		<form class="review-form">
			
			<input name="userid" id="userid" value="${sessionUserid}" hidden />
			
			<div class="starscore-input">
				<label for="starscore">별점:</label>
				<select name="starscore" id="starscore">
					<option value="5">★★★★★</option>
					<option value="4">★★★★☆</option>
					<option value="3">★★★☆☆</option>
					<option value="2">★★☆☆☆</option>
					<option value="1">★☆☆☆☆</option>
				</select>
			</div>
			<textarea
				name="reviewcontent"
				id="reviewcontent"
				class="review-content-textarea"
				rows="5" cols="30"
				minlength="5"
				maxlength="200"
				placeholder="후기를 작성해 주세요."
				required
			></textarea>
			<button type="submit" class="btn-large-solid">
				후기 등록하기
			</button>
		</form>
	</main>
	
	<%-- 변수 선언 --%>
	<c:set var="treatno" value="${treatno}"/>
	<c:set var="dendomain" value="${dendomain}"/>
	<c:set var="sessionUserid" value="${sessionUserid}"/>

	<script>
		const treatno = '${treatno}';
		const sessionUserid = '${sessionUserid}';
		const dendomain = '${dendomain}'
		
		$(function() {
			// 치과 정보요약 데이터 가져오기
			$.ajax({
				type: "POST",
				url: "http://localhost:" + dendomain + "/springframework-mini-project-dentist/treatment/getTreatmentBytreatno?treatno=" + treatno,
			}).done(({treatno, denname, treatdate, denaddress}) => {
				const treatmentSummary = {
					treatno, denname, treatdate, denaddress
				}
				console.log(treatmentSummary);
				paintTreatmentSummary(treatmentSummary);
			});
		});

		function template({denname, treatdate, denaddress}) {
			return `
				<div class="list-item no-padding no-border-bottom">
					<div class="list-item__info-summary">
						<h4 class="title no-ellipsis">
							`+ denname +`
							<span class="subtitle">`+ treatdate +`</span>
						</h4>
						<p class="text-sm no-ellipsis">`+ denaddress +`</p>
					</div>
				</div>
			`;
		}
		
		function paintTreatmentSummary(treatmentSummary) {
			const summaryTagHTML = template(treatmentSummary);
			$(".dentist-info-section").html(summaryTagHTML);
		}
		
		// form 제출할때 해당 치과 상세페이지로 redirect
		document.querySelector("form").addEventListener("submit", (e) => {
			e.preventDefault();
			
			$.ajax({
				type: "POST",
				url: "http://localhost:" + dendomain + "/springframework-mini-project-dentist/review/postReview?treatno=" + treatno,
				data: {
					userid: sessionUserid,
					starscore: parseFloat($("#starscore").val()),
					reviewcontent: $("#reviewcontent").val()
				}
			}).done(() => {
				// 리뷰를 작성한 치과의 상세페이지로 넘어가면서, 후기목록 영역("#엘리먼트id")으로 스크롤 anchor하기
				location.href = '${pageContext.request.contextPath}' + "/reservation/dentistDetail?dendomain=" + dendomain + "#reviewContainer";
			});
		});
 	</script>
	
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
