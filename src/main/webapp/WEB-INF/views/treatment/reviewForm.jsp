<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/common/meta.jsp" %>
	<title>후기 작성 - 치스토리</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/treatment/reviewForm.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/list-item.css" />
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

<<<<<<< HEAD
	<main class="main">
	  <section class="history-desc-section row"> 
	    <article class="desc-card card col-mid-8 justify-content-center">
	      <div class="desc-card__header card-header px-5 py-4 d-flex">
	        <div class="desc-card__header__col flex-grow-1">
	          <div class="round-thumbnail mb-3">
	            <i class="fa-solid fa-tooth fa-lg"></i>
	          </div>
	          <h6 class="dentist-visited">서울시 마포구 무슨동 햇살치과</h6>
	          <h1 class="treatment-title">
	            임플란트<span class="treatment-date" style="margin-right:1rem;">2022. 05. 04.</span>
	            <div class="dropdown" style="display:inline-block;">
				  별점:
				  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-expanded="false">
				    ★★★★★
				  </button>
				  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
				    <a class="dropdown-item" href="#">★★★★★</a>
				    <a class="dropdown-item" href="#">★★★★☆</a>
				    <a class="dropdown-item" href="#">★★★☆☆</a>
				    <a class="dropdown-item" href="#">★★☆☆☆</a>
				    <a class="dropdown-item" href="#">★☆☆☆☆</a>
				  </div>
				</div>
	          </h1>
	        </div>
	      </div>
	      <!-- 여기 form태그로 다시 만들어야 함 -->
	      <div class="desc-card__body card-body px-5 py-4">
		      <textarea class="form-control" aria-label="With textarea" placeholder="후기를 작성하세요."></textarea>
		      <div style="text-align:right;">
			      <a href="cancelForm"><button type="button" class="btn btn-light">취소</button></a>
			      <a href="postReview"><button type="button" class="btn btn-warning">작성</button></a>
		      </div>
	      </div>
	    </article>
	  </section>
	</main>

	<main class="main located-at-bottom-of-header">
		<h1 class="page-title">후기 작성</h1>


		<%-- 치과 정보요약 영역--%>
		<section class="dentist-info-section">
			<%-- TBD: 넘어온 치과정보 뿌려주기(아래 script태그 참고) --%>
		</section>
		<script>
			const DUMMY_OBJECT = {
				denname: "부산 치과",
				treatdate: "2007-02-02", // TBD: yyyy. MM. dd. 형식으로 뿌려야 함
				denaddress: "부산시 해운대구 어쩌구로 897-767"
			};
			function template({denname, treatdate, denaddress}) {
				return `
					<div class="list-item no-padding no-border-bottom">
						<div class="list-item__info-summary">
							<h4 class="title">
								`+ denname +`
								<span class="subtitle">`+ treatdate +`</span>
							</h4>
							<p class="text-sm">`+ denaddress +`</p>
						</div>
					</div>
				`;
			}
			$(function() {
				const element = template(DUMMY_OBJECT);
				$(".dentist-info-section").html(element);
			});
		</script>

		<%-- 후기 작성 영역 --%>
		<form action="reviewForm" class="review-form">
			<div class="starscore-input">
				<label for="starscore">별점:</label>
				<select name="starscore" id="starscore">
					<%-- 희재코멘트:
					TBD: 별점 0.5 단위로 받을 수 있도록
					select 박스에서 직접 별 찍을 수 있도록 별 버튼으로 만들기
					아래는 걍 하다가 만거 아까워서 걍 주석처리한거임
					<option value="5.0" selected>
						<i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star"></i>
					</option>
					<option value="4.5">
						<i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star"></i>
						&#xf5c0;
					</option>
					<option value="4.0">
						<i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star"></i>
						&#xf005;
					</option>
					<option value="3.5">
						<i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star"></i>
						&#xf5c0;
						&#xf005;
						&#xf005;
					</option>
					<option value="3.0">
						<i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star"></i>
						&#xf005;
						&#xf005;
						&#xf005;
						&#xf005;
					</option>
					<option value="2.5">
						<i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star"></i>
						&#xf5c0;
						&#xf005;
						&#xf005;
					</option>
					<option value="2.0">
						<i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star"></i>
						&#xf005;
						&#xf005;
						&#xf005;
					</option>
					<option value="1.5">
						
						<i class="fa-solid fa-star"></i>
						&#xf5c0;
						&#xf005;
						&#xf005;
						&#xf005;
					</option>
					<option value="1.0">
						<i class="fa-solid fa-star"></i>
						&#xf005;
						&#xf005;
						&#xf005;
						&#xf005;
					</option>
					<option value="0.5">
						&#xf5c0;
						&#xf005;
						&#xf005;
						&#xf005;
						&#xf005;
					</option>
					<option value="0.0">
						&#xf005;
						&#xf005;
						&#xf005;
						&#xf005;
						&#xf005;
					</option> --%>
					<option value="5">★★★★★</option>
					<option value="4">★★★★☆</option>
					<option value="3">★★★☆☆</option>
					<option value="2">★★☆☆☆</option>
					<option value="1">★☆☆☆☆</option>
				</select>
			</div>
			<textarea
				name="reviewcontent"
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

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
