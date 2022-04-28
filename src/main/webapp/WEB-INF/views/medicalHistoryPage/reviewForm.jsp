<%@ page contentType="text/html; charset=UTF-8"%> <%@ include
file="/WEB-INF/views/common/header.jsp"%>

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
    	</section>
   	</div>

<script>
  $(function () {
    $(".upper-jaw__upper-teeth>img").attr("data-toggle", "tooltip");
    $(".upper-jaw__upper-teeth>img").attr("data-placement", "top");
    $(".upper-jaw__upper-teeth>img").attr("data-html", "true");
    $('[data-toggle="tooltip"]').tooltip();
  });
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
