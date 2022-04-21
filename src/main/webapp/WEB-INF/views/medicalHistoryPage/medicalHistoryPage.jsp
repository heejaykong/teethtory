<%@ page contentType="text/html; charset=UTF-8"%> <%@ include
file="/WEB-INF/views/common/header.jsp"%>

<main class="main">
  <section class="mouth-and-history-list-section row">
    <div class="mouth-and-history-list__col col-md-6">
      <div class="mouth">
        <div class="mouth__upper-jaw">
          <div class="upper-jaw__upper-gum">
            <img
              src="${pageContext.request.contextPath}/resources/images/teethAndGums/upper-jaw.png"
              alt="upper gum"
            />
          </div>
          <div class="upper-jaw__upper-teeth">
            <!-- 각 이빨 img태그의 title 속성은 툴팁에 들어가는 html임. -->
            <img
              title="<b id='toothNum'>18번<br/>치아</b>"
              style="top: 4.75rem; left: 1.65rem; width: 5.8%"
              src="${pageContext.request.contextPath}/resources/images/teethAndGums/upperTeeth/18.png"
            />
            <img
              title="<b id='toothNum'>17번<br/>치아</b>"
              style="top: 3.95rem; left: 3.39rem; width: 6.82333154%"
              src="${pageContext.request.contextPath}/resources/images/teethAndGums/upperTeeth/17.png"
            />
            <img
              title="<b id='toothNum'>16번<br/>치아</b>"
              style="top: 3.35rem; left: 5.32rem; width: 6.82333154%"
              src="${pageContext.request.contextPath}/resources/images/teethAndGums/upperTeeth/16.png"
            />
            <img
              title="<b id='toothNum'>15번<br/>치아</b>"
              style="top: 2.78rem; left: 7.22rem; width: 4.9%"
              src="${pageContext.request.contextPath}/resources/images/teethAndGums/upperTeeth/15.png"
            />
            <img
              title="<b id='toothNum'>14번<br/>치아</b>"
              style="top: 2.28rem; left: 8.55rem; width: 5.59%"
              src="${pageContext.request.contextPath}/resources/images/teethAndGums/upperTeeth/14.png"
            />
            <img
              title="<b id='toothNum'>13번<br/>치아</b>"
              style="top: 1.9rem; left: 10.01rem; width: 5.3%"
              src="${pageContext.request.contextPath}/resources/images/teethAndGums/upperTeeth/13.png"
            />
            <img
              title="<b id='toothNum'>12번<br/>치아</b>"
              style="top: 2rem; left: 11.55rem; width: 5.03%"
              src="${pageContext.request.contextPath}/resources/images/teethAndGums/upperTeeth/12.png"
            />
            <img
              title="<b id='toothNum'>11번<br/>치아</b>"
              style="top: 1.65rem; left: 12.95rem; width: 6.77%"
              src="${pageContext.request.contextPath}/resources/images/teethAndGums/upperTeeth/11.png"
            />
            <img
              title="<b id='toothNum'>21번<br/>치아</b>"
              style="top: 1.65rem; left: 14.95rem; width: 6.45%"
              src="${pageContext.request.contextPath}/resources/images/teethAndGums/upperTeeth/21.png"
            />
            <img
              title="<b id='toothNum'>22번<br/>치아</b>"
              style="top: 2.07rem; left: 16.8rem; width: 5.02%"
              src="${pageContext.request.contextPath}/resources/images/teethAndGums/upperTeeth/22.png"
            />
            <img
              title="<b id='toothNum'>23번<br/>치아</b>"
              style="top: 1.87rem; left: 18.27rem; width: 5%"
              src="${pageContext.request.contextPath}/resources/images/teethAndGums/upperTeeth/23.png"
            />
            <img
              title="<b id='toothNum'>24번<br/>치아</b>"
              style="top: 2.37rem; left: 19.69rem; width: 5.02%"
              src="${pageContext.request.contextPath}/resources/images/teethAndGums/upperTeeth/24.png"
            />
            <img
              title="<b id='toothNum'>25번<br/>치아</b>"
              style="top: 2.87rem; left: 21.18rem; width: 5.15%"
              src="${pageContext.request.contextPath}/resources/images/teethAndGums/upperTeeth/25.png"
            />
            <img
              title="<b id='toothNum'>26번<br/>치아</b>"
              style="top: 3.37rem; left: 22.68rem; width: 5.15%"
              src="${pageContext.request.contextPath}/resources/images/teethAndGums/upperTeeth/26.png"
            />
            <img
              title="<b id='toothNum'>27번<br/>치아</b>"
              style="top: 4.02rem; left: 24.52rem; width: 6.45%"
              src="${pageContext.request.contextPath}/resources/images/teethAndGums/upperTeeth/27.png"
            />
            <img
              title="<b id='toothNum'>28번<br/>치아</b>"
              style="top: 4.65rem; left: 26.45rem; width: 6.3%"
              src="${pageContext.request.contextPath}/resources/images/teethAndGums/upperTeeth/28.png"
            />
          </div>
        </div>
        <div class="mouth__lower-jaw">
          <div class="lower-jaw__lower-gum">
            <img
              src="${pageContext.request.contextPath}/resources/images/teethAndGums/lower-jaw.png"
              alt="lower gum"
            />
          </div>
          <div class="lower-jaw__lower-teeth"></div>
        </div>
      </div>
    </div>
    <div class="mouth-and-history-list__col col-md-6">
      <ol class="history-list">
        <div class="history-list__item">
          <div class="item__col">
            <div class="round-thumbnail">
              <i class="fa-solid fa-tooth fa-lg"></i>
            </div>
          </div>
          <div class="item__col">
            <span class="dentist-visited">서울시 마포구 무슨동 햇살치과</span>
            <li class="treatment-title">
              임플란트<span class="treatment-date">2022. 05. 04.</span>
            </li>
            <span class="cost">2,000,000원</span>
          </div>
        </div>
        <div class="history-list__item">
          <div class="item__col">
            <div class="round-thumbnail">
              <i class="fa-solid fa-tooth fa-lg"></i>
            </div>
          </div>
          <div class="item__col">
            <span class="dentist-visited">서울시 마포구 무슨동 햇살치과</span>
            <li class="treatment-title">
              임플란트<span class="treatment-date">2022. 05. 04.</span>
            </li>
            <span class="cost">2,000,000원</span>
          </div>
        </div>
        <div class="history-list__item">
          <div class="item__col">
            <div class="round-thumbnail">
              <i class="fa-solid fa-tooth fa-lg"></i>
            </div>
          </div>
          <div class="item__col">
            <span class="dentist-visited">서울시 마포구 무슨동 햇살치과</span>
            <li class="treatment-title">
              임플란트<span class="treatment-date">2022. 05. 04.</span>
            </li>
            <span class="cost">2,000,000원</span>
          </div>
        </div>
        <div class="history-list__item">
          <div class="item__col">
            <div class="round-thumbnail">
              <i class="fa-solid fa-tooth fa-lg"></i>
            </div>
          </div>
          <div class="item__col">
            <span class="dentist-visited">서울시 마포구 무슨동 햇살치과</span>
            <li class="treatment-title">
              임플란트<span class="treatment-date">2022. 05. 04.</span>
            </li>
            <span class="cost">2,000,000원</span>
          </div>
        </div>
        <div class="history-list__item">
          <div class="item__col">
            <div class="round-thumbnail">
              <i class="fa-solid fa-tooth fa-lg"></i>
            </div>
          </div>
          <div class="item__col">
            <span class="dentist-visited">서울시 마포구 무슨동 햇살치과</span>
            <li class="treatment-title">
              임플란트<span class="treatment-date">2022. 05. 04.</span>
            </li>
            <span class="cost">2,000,000원</span>
          </div>
        </div>
      </ol>
    </div>
  </section>
  <section class="history-desc-section row">
    <article class="desc-card card col-mid-8 justify-content-center">
      <div class="desc-card__header card-header px-5 py-4 d-flex">
        <div class="desc-card__header__col flex-grow-1">
          <div class="round-thumbnail mb-3">
            <i class="fa-solid fa-tooth fa-lg"></i>
          </div>
          <h6 class="dentist-visited">서울시 마포구 무슨동 햇살치과</h6>
          <h1 class="treatment-title">
            임플란트<span class="treatment-date">2022. 05. 04.</span>
          </h1>
        </div>
        <div class="desc-card__header__col">
          <i class="fa-solid fa-pen"></i>
          <a href="reviewForm">후기 작성하기</a>
        </div>
      </div>
      <div class="desc-card__body card-body px-5 py-4">
        (의사가 기록한 진료내용) Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo
        ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis
        dis parturient montes, nascetur ridiculus mus. Donec quam felis,
        ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa
        quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget,
        arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.
        Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras
        dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend
        tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac,
        enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus.
        Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean
        imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper
        ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus
        eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing
        sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar,
        hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec
        vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit
        amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris
        sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget
        bibendum sodales, augue velit cursus nunc,
      </div>
    </article>
  </section>
</main>
<script>
  $(function () {
    $(".upper-jaw__upper-teeth>img").attr("data-toggle", "tooltip");
    $(".upper-jaw__upper-teeth>img").attr("data-placement", "top");
    $(".upper-jaw__upper-teeth>img").attr("data-html", "true");
    $('[data-toggle="tooltip"]').tooltip();
  });
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
