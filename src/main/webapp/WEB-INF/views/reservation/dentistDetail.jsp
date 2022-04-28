<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style>
.btn{
color: white;
        background-color: #f47d36;
        border-color: #f47d36;
        width:90%;
	height:3rem;
	border-radius:1rem;
	margin-left:1rem;
}
</style>
   <div>
  <img src="/springframework-mini-project/resources/images/photo17.jpg" width="100%">
   </div>
  <div style="text-align: center; margin-top: 50px;">
        <span style="font-size: xx-large; ">햇살 치과</span>
      </div>
   <div>
      	<a class="btn" href="${pageContext.request.contextPath}/reservationUsingCalendar/">예약하기</a>
      </div> 
      	<div style="margin-left:1rem;">
			<i class="fa-solid fa-phone"></i><div>010-8424-5518</div>
			<i class="fa-solid fa-location-dot"></i><div>진료시간</div>
			<i class="fa-regular fa-clock"></i><div>평일 09:00~18:00 점심시간 13시 ~ 14시</div>
			<div>토요일 09:00~13:00 점심시간 없음</div>
			<div>일요일 휴무</div>
		</div>
      <div class="list-group">

        <a href="#" class="list-group-item list-group-item-action">
          <div class="d-flex">
            <small class="mr-1">
				<i class="fa-regular fa-star"></i>
				<i class="fa-regular fa-star"></i>
				<i class="fa-regular fa-star"></i>
				<i class="fa-regular fa-star"></i>
				<i class="fa-regular fa-star"></i>
			</small>
            <small>5</small>
          </div>
          <div >
          	스케일링도 꼼꼼하게 잘해주십니다^^
          </div>
          <div>
            <small><img src="/images/submit.png" style="width: 10px;"></small>
            <small>roketmissile</small>
            <small>NaN NaN NaN</small>
            <small>NAVER</small>
          </div>
        </a>
       
        <a href="#" class="list-group-item list-group-item-action">
          <div class="d-flex">
            <small class="mr-1">
				<i class="fa-regular fa-star"></i>
				<i class="fa-regular fa-star"></i>
				<i class="fa-regular fa-star"></i>
				<i class="fa-regular fa-star"></i>
				<i class="fa-regular fa-star"></i>
			</small>
            <small>5</small>
          </div>
          <div>
          	의사선생님 최고에요!!!! 광고 좀 하셨으면 좋겠는데 ㅠ.ㅠ 치료때문에 계속 다니고 있는데 늘 만족합니다:)
          </div>
          <div>
            <small><img src="/images/submit.png" style="width: 10px;"></small>
            <small>roketmissile</small>
            <small>NaN NaN NaN</small>
            <small>NAVER</small>
          </div>
        </a>

        <a href="#" class="list-group-item list-group-item-action">
          <div class="d-flex">
            <small class="mr-1">
				<i class="fa-regular fa-star"></i>
				<i class="fa-regular fa-star"></i>
				<i class="fa-regular fa-star"></i>
				<i class="fa-regular fa-star"></i>
				<i class="fa-regular fa-star"></i>
			</small>
            <small>5</small>
          </div>
          <div>
          	친절하고 치료진심으로 잘하심. 실력하고
          </div>
          <div>
            <small><img src="/images/submit.png" style="width: 10px;"></small>
            <small>roketmissile</small>
            <small>NaN NaN NaN</small>
            <small>NAVER</small>
          </div>
        </a>

      </div>
   <%--  <div style="width: 10rem; margin-left: 10rem;">
    	<img src="${pageContext.request.contextPath}/resources/images/iloveosstem.png" width="600px">
    </div> --%>
	 	</section>
	</div> 

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
