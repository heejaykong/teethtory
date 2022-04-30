<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/common/meta.jsp" %>
	<title>치스토리-상세내용</title>
	<link rel="stylesheet" href="/springframework-mini-project/resources/css/treatment.css" />
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>


	<main class="main">
	    <h1 class="page-title" id="treatment-type">충치 치료</h1>
	    <section class="mouth-section">
	        <div class="mouth">
	            <div class="mouth__upper-jaw">
	              <div class="upper-jaw__upper-gum">
	                <img
	                  src="${pageContext.request.contextPath}/resources/images/teethAndGums/upper_jaw.png"
	                  alt="upper gum"
	                />
	              </div>
	              <div class="upper-jaw__upper-teeth">
	                <!-- 각 이빨 img태그의 title 속성은 툴팁에 들어가는 html임. -->
	                <img
	                  class="tooth"
	                  title="<b id='toothNum'>18번<br/>치아</b>"
	                  style="top: 69%; left: 5.6%; width: 5.8%"
	                  src="${pageContext.request.contextPath}/resources/images/teethAndGums/upperTeeth/18.png"
	                />
	                <img
	                  class="tooth"
	                  title="<b id='toothNum'>17번<br/>치아</b>"
	                  style="top: 58.4%; left: 11.4%; width: 6.82333154%"
	                  src="${pageContext.request.contextPath}/resources/images/teethAndGums/upperTeeth/17.png"
	                />
	                <img
	                  class="tooth"
	                  title="<b id='toothNum'>16번<br/>치아</b>"
	                  style="top: 48%; left: 17.5%; width: 6.82333154%"
	                  src="${pageContext.request.contextPath}/resources/images/teethAndGums/upperTeeth/16.png"
	                />
	                <img
	                  class="tooth"
	                  title="<b id='toothNum'>15번<br/>치아</b>"
	                  style="top: 41%; left: 24.1%; width: 4.9%"
	                  src="${pageContext.request.contextPath}/resources/images/teethAndGums/upperTeeth/15.png"
	                />
	                <img
	                  class="tooth"
	                  title="<b id='toothNum'>14번<br/>치아</b>"
	                  style="top: 33.6%; left: 28.5%; width: 5.59%"
	                  src="${pageContext.request.contextPath}/resources/images/teethAndGums/upperTeeth/14.png"
	                />
	                <img
	                  class="tooth"
	                  title="<b id='toothNum'>13번<br/>치아</b>"
	                  style="top: 28%; left: 33.4%; width: 5.3%"
	                  src="${pageContext.request.contextPath}/resources/images/teethAndGums/upperTeeth/13.png"
	                />
	                <img
	                  class="tooth"
	                  title="<b id='toothNum'>12번<br/>치아</b>"
	                  style="top: 29.5%; left: 38.5%; width: 5.03%"
	                  src="${pageContext.request.contextPath}/resources/images/teethAndGums/upperTeeth/12.png"
	                />
	                <img
	                  class="tooth"
	                  title="<b id='toothNum'>11번<br/>치아</b>"
	                  style="top: 24.3%; left: 43.2%; width: 6.77%"
	                  src="${pageContext.request.contextPath}/resources/images/teethAndGums/upperTeeth/11.png"
	                />
	                <img
	                  class="tooth"
	                  title="<b id='toothNum'>21번<br/>치아</b>"
	                  style="top: 24.3%; left: 49.9%; width: 6.45%"
	                  src="${pageContext.request.contextPath}/resources/images/teethAndGums/upperTeeth/21.png"
	                />
	                <img
	                  class="tooth"
	                  title="<b id='toothNum'>22번<br/>치아</b>"
	                  style="top: 30.5%; left: 56%; width: 5.02%"
	                  src="${pageContext.request.contextPath}/resources/images/teethAndGums/upperTeeth/22.png"
	                />
	                <img
	                  class="tooth"
	                  title="<b id='toothNum'>23번<br/>치아</b>"
	                  style="top: 27.57%; left: 60.9%; width: 5%"
	                  src="${pageContext.request.contextPath}/resources/images/teethAndGums/upperTeeth/23.png"
	                />
	                <img
	                  class="tooth"
	                  title="<b id='toothNum'>24번<br/>치아</b>"
	                  style="top: 34.9%; left: 65.6%; width: 5.02%"
	                  src="${pageContext.request.contextPath}/resources/images/teethAndGums/upperTeeth/24.png"
	                />
	                <img
	                  class="tooth"
	                  title="<b id='toothNum'>25번<br/>치아</b>"
	                  style="top: 42%; left: 70.7%; width: 5.15%"
	                  src="${pageContext.request.contextPath}/resources/images/teethAndGums/upperTeeth/25.png"
	                />
	                <img
	                  class="tooth"
	                  title="<b id='toothNum'>26번<br/>치아</b>"
	                  style="top: 49%; left: 75.7%; width: 5.15%"
	                  src="${pageContext.request.contextPath}/resources/images/teethAndGums/upperTeeth/26.png"
	                />
	                <img
	                  class="tooth"
	                  title="<b id='toothNum'>27번<br/>치아</b>"
	                  style="top: 58.5%; left: 81.8%; width: 6.45%"
	                  src="${pageContext.request.contextPath}/resources/images/teethAndGums/upperTeeth/27.png"
	                />
	                <img
	                  class="tooth"
	                  title="<b id='toothNum'>28번<br/>치아</b>"
	                  style="top: 67.7%; left: 88.2%; width: 6.3%"
	                  src="${pageContext.request.contextPath}/resources/images/teethAndGums/upperTeeth/28.png"
	                />
	              </div>
	            </div>
	            <div class="mouth__lower-jaw">
	              <div class="lower-jaw__lower-gum">
	                <img
	                  src="${pageContext.request.contextPath}/resources/images/teethAndGums/lower_jaw.png"
	                  alt="lower gum"
	                />
	              </div>
	              <div class="lower-jaw__lower-teeth"></div>
	            </div>
	          </div>
	    </section>
	    <section class="treatment-desc-section">
	      <ul>
	
	        <li class="desc-item">
	            <h6 class="desc-item__title">치료일</h6>
	            <p class="desc-item__content"><span id="treatment-date">2022. 01. 03. (금)</span></p>
	        </li>
	        <li class="desc-item">
	            <h6 class="desc-item__title">치료한 치아</h6>
	            <p class="desc-item__content"><span id="teeth-number">#16, #17</span></p>
	        </li>
	        <li class="desc-item">
	            <h6 class="desc-item__title">병명</h6>
	            <p class="desc-item__content"><span id="disease-name">충치</span></p>
	        </li>
	        <li class="desc-item">
	            <h6 class="desc-item__title">소견 내용</h6>
	            <p class="desc-item__content"><span id="doctor-comment">교정 장치 부착 2개월 이후 #16, 17 치아 시림증상 호소. 두 치아 모두 레진치료 진행함.</span></p>
	        </li>
	        <li class="desc-item">
	            <h6 class="desc-item__title">촬영 이미지</h6>
	            <p class="desc-item__content">치료 전</p>
	            <!-- tbd -->
	            <div class="before-imgs-wrapper">
	              <!-- <a href="imageDetail/1">
	                <img class="content__img" src="https://dummyimage.com/600x400/000/fff" alt="dummy"/>
	              </a>
	              <a href="#">
	                <img class="content__img" src="https://dummyimage.com/600x400/000/fff" alt="dummy"/>
	              </a> -->
	            </div>
	            <p class="desc-item__content">치료 후</p>
	            <div class="after-imgs-wrapper">
	              <!-- <a href="#">
	                <img class="content__img" src="https://dummyimage.com/600x400/000/fff" alt="dummy"/>
	              </a>
	              <a href="#">
	                <img class="content__img" src="https://dummyimage.com/600x400/000/fff" alt="dummy"/>
	              </a> -->
	            </div>
	        </li>
	        <li class="desc-item">
	            <h6 class="desc-item__title">치료기구 제조사</h6>
	            <p class="desc-item__content"><span id="equipment-company">오스템 임플란트</span></p>
	        </li>
	        <li class="desc-item">
	            <h6 class="desc-item__title">의사</h6>
	            <p class="desc-item__content"><span id="doctor-name">김긍정(<span id="dentist-name">Ant 치과</span>)</span></p>
	        </li>
	        <li class="desc-item">
	            <h6 class="desc-item__title">치료비</h6>
	            <p class="desc-item__content"><span id="cost">60,000</span>원</p>
	        </li>
	      </ul>
	      <a href="reviewForm" class="btn-large-solid">치료 후기 작성하기</a>
	      <a href="#" class="btn-large-hollow">이 치과 진료 예약하기</a>
	    </section>
	</main>
	<script>
	  const DUMMY_TOOTH_ID_LIST = [16, 17];
	  const DUMMY_BEFORE_IMAGES_SRC = ["before_cavity1.jpg", "before_cavity2.jpg"];
	  const DUMMY_AFTER_IMAGES_SRC = ["after_cavity2.png", "after_cavity1.jpg"];
	  
	  $(function(){
	    // 각 치아에 id 동적으로 부여
	    document.querySelectorAll(".mouth .tooth").forEach((tooth)=>{
	      const srcList = tooth.src.split("/")
	      const toothId = srcList[srcList.length-1].split(".")[0];
	      tooth.id = toothId;
	    });
	  
	    // 동적으로 표시해야 할 치아들을 각각 표시하기
	    DUMMY_TOOTH_ID_LIST.forEach(toothId => {
	      $("#"+toothId).addClass('marked-teeth');
	    });
	
	    // 이미지 동적으로 랜더링
	    DUMMY_BEFORE_IMAGES_SRC.forEach(src => {
	      $(".before-imgs-wrapper").append(
	        "<a href='#'><img class='content__img' src='${pageContext.request.contextPath}/resources/images/treatment/"+ src +"' alt='dummy'/></a>"
	      );
	    });
	    DUMMY_AFTER_IMAGES_SRC.forEach(src => {
	      $(".after-imgs-wrapper").append(
	        "<a href='#'><img class='content__img' src='${pageContext.request.contextPath}/resources/images/treatment/"+ src +"' alt='dummy'/></a>"
	      );
	    });
	  });
	  $(function () {
	    $(".upper-jaw__upper-teeth>img").attr("data-toggle", "tooltip");
	    $(".upper-jaw__upper-teeth>img").attr("data-placement", "top");
	    $(".upper-jaw__upper-teeth>img").attr("data-html", "true");
	    $('[data-toggle="tooltip"]').tooltip();
	  });
	</script>


	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
