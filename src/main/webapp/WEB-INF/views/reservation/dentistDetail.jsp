<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/views/common/meta.jsp"%>
<title>치스토리-치과 상세</title>
<style>
#Registered {
	color: white;
	background-color: #f47d36;
	border-color: #f47d36;
	width: 95%;
	height: 3rem;
	border-radius: 1rem;
	margin-left: 0.5rem;
	margin-bottom: 1rem;
}

.fa-phone {
	color: #ffa048;
}

.fa-location-dot {
	color: #ffa048;
}

.fa-clock {
	color: #ffa048;
}
</style>
<script>
	localStorage.setItem('dendomain', "${dendomain}");
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/loading.jsp" %>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
	  <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        내 치과 목록에 추가하시겠습니까?
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">아니오</button>
	        <button id="btn-yes" type="button" class="btn btn-primary" style="width: 10rem;">예</button>
	      </div>
	    </div>
	</div>
</div>

<script>
	$('#exampleModal').on('show.bs.modal', function (event) {
	  	var button = $(event.relatedTarget) // Button that triggered the modal
	  	var recipient = button.data('whatever') // Extract info from data-* attributes
	  	var body = button.data('body')
	  	// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	  	// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	  	console.log("aaa");
	  	var modal = $(this)
	  	modal.find('.modal-title').text(recipient)
	  	modal.find('.modal-body').text(body)

        //모달에서 사용자가 '예'선택시에, 예약화면으로 넘어감.(denno 필요.)
        let yesBtn = document.getElementById('btn-yes');
        // yesBtn.onclick = function() {
        //     let denNoForReservation = document.getElementById('denNo').value;
        //     //내 치과에 등록된 치과인지 점검.
        //     location.href = "";
        //     //내 치과에 등록된
        // }
	})
	
	function handleHidden(e, task, denno) {
		const targetEl = e.target;
		const theElement = targetEl.parentNode.parentNode.parentNode.querySelector(".history-list-hidden__item");
		$(targetEl.parentNode.parentNode.parentNode.querySelector(".history-list-hidden__item")).toggle();
		
		const denName = targetEl.parentNode.parentNode.querySelector(".denName");
		const denidvalue = $(targetEl.parentNode.parentNode.querySelector(".denName")).text();
		theElement.dataset.whatever = denidvalue;

		const hiddenDenNo = denno;
		if(task === 'add') {
			location.href = "myDentist?denno=" + denno + "&task=" + task;
		} else if(task === 'delete') {
			location.href = "myDentist?denno=" + denno + "&task=" + task;
		}
	}
	
	function toggleOff(e) {
		const targetEl = e.target;
		$(targetEl).toggle();
	}
</script>
<div class="located-at-bottom-of-header">
	<div>
		<img src="${pageContext.request.contextPath}/resources/images/puppy2.jpeg" width="100%" height="100rem;">
	</div>
	<div class="mx-3" style="text-align: center;">
		<div id="denname" class="mt-4 mb-1" style="font-size: 2rem;"></div>
		<div class="mb-3">
			<i class="fa-solid fa-star" style="color: #ffa048;"></i>
			<span id="averageStars" style="color: #ffa048;"></span>
			<span>리뷰</span>
			<span id="totalReviewNum" style="color: #ffa048;"></span>
		</div>
		<a class="btn-large-solid mb-4" onclick="checkRegistered()" style="display: block;">진료 예약하기</a>
	</div>
		<%-- dendomain 파라메터로 전달해야 함. --%>
	

	<div class="mx-5">
		<div class="d-flex mb-2">
			<i class="fa-solid fa-phone mr-4"></i>
			<div id="dencontact"></div>
		</div>
		
		<div class="d-flex mb-2">
			<i class="fa-solid fa-location-dot mr-4"></i>
			<div id="denaddress" class="ml-1"></div>
		</div>
		
		<div class="d-flex mb-2">
			<i class="fa-regular fa-clock mr-4"></i>
			<div>
				<div class="mb-2">진료시간</div>
				<div id="businessHourContainer">
					<div id="mon" class="mb-2"></div>
					<div id="tue" class="mb-2"></div>
					<div id="wed" class="mb-2"></div>
					<div id="thur" class="mb-2"></div>
					<div id="fri" class="mb-2"></div>
					<div id="sat" class="mb-2"></div>
					<div id="sun" class="mb-2"></div>
				</div>			
			</div>
		</div>
		
		<div class="d-flex">
			<div id="businessHourContainer">
				<div id="mon"></div>
				<div id="tue"></div>
				<div id="wed"></div>
				<div id="thur"></div>
				<div id="fri"></div>
				<div id="sat"></div>
				<div id="sun"></div>
			</div>
		</div>
	</div>

	<div id="reviewContainer" class="list-group">
		<%-- 여기에 ajax로 받아온 후기 정보 대입. --%>
	</div>
	<div id="reviewPaginationContainer">
		<%-- 여기에 페이지네이션 처리. --%>
	</div>
</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	<script>
		function checkRegistered() {
			console.log('localStorage.getItem("denno") : ' + localStorage.getItem("denno"));
			$.ajax({
				method:"POST",
				url: "${pageContext.request.contextPath}/reservation/dentistDetail",
				data: {
					denno: localStorage.getItem("denno")
				}
			})
			.done((data) => {
				console.log('data : ' + data);
				console.log('typeof data : ' + typeof data);

				if(data.alreadyRegistered === 1) {//1: 내 치과로 등록되어 있음.
					console.log(localStorage.getItem("dendomain"));
					location.href = "reservationUsingCalendar?dendomain=" + localStorage.getItem("dendomain");
				} else {//0: 내 치과로 등록 필요.
					if(data.registrationResult === 1) {
						location.href = "reservationUsingCalendar?dendomain=" + localStorage.getItem("dendomain");
					} else {
						alert('예약을 진행할 수 없는 사유가 발생했습니다. *관리자에게 문의 요망*');	
					}
				}
			});
		}
	</script>
	<script>
		// 치과의 기본정보를 가져오는 ajax 통신.(deninfo)
		$.ajax({
			method:"POST",
			url: "http://localhost:"+ ${dendomain} +"/springframework-mini-project-dentist/deninfo/getdeninfo",
			// url: ${dendomain} + "/springframework-mini-project-dentist/deninfo/getdeninfo",
			data: {
			},
		})
		.done((data) => {
			document.getElementById('denname').innerHTML = data.denname;
			document.getElementById('dencontact').innerHTML = data.dencontact;
			document.getElementById('denaddress').innerHTML = data.denaddress;
		});

		//치과의 영업시간을 가져옴.
		$.ajax({
			method:"POST",
			url: "http://localhost:" + ${dendomain} + "/springframework-mini-project-dentist/businesshour/getBusinessHour",
			data: {
			},
		})
		.done((data) => {
			console.log('data : ' + data);
			console.log('typeof data : ' + typeof data);
			console.log('data[0] : ' + data[0]);
			console.log('typeof data[0] : ' + typeof data[0]);
			console.log('data[0][0] : ' + data[0][0]);
			console.log('typeof data[0][0] : ' + typeof data[0][0]);
			console.log('Object.keys(data).length : ' + Object.keys(data).length);

			for(let i=0; i<Object.keys(data).length; i++) {
				let businessDay = data[i][0];
				let businessHour = data[i][1];
				let startTime = -1;
				let endTime = -1;
				let startLunchTime = -1;
				let endLunchTime = -1;
				
				let bitArray = businessHour.split('');
				console.log('typeof bitArray : ' + typeof bitArray);
				//시작시간.
				if(businessHour.indexOf("1") === -1) {

				} else if(businessHour.indexOf("1") % 2 === 0) {
					startTime = businessHour.indexOf("1") / 2 + ":00";
					console.log('startTime : ' + startTime);
				} else {
					startTime = parseInt(businessHour.indexOf("1") / 2) + ":30";
					console.log('startTime : ' + startTime);
				}
				//종료시간.
				if(businessHour.lastIndexOf("1") === -1) {
					
				} else if(businessHour.lastIndexOf("1") % 2 === 0){
					endTime = businessHour.lastIndexOf("1") / 2 + ":00";
				} else {
					endTime = parseInt(businessHour.lastIndexOf("1") / 2) + ":30";
				}

				if(startTime === -1) {
					businessHourForHtml = "휴진";
				} else {
					businessHourForHtml = startTime + " ~ " + endTime;
				}

				if(businessDay === "MONDAY") {
					document.getElementById('mon').innerHTML = "월 " + businessHourForHtml;
				} else if(businessDay === "TUESDAY") {
					document.getElementById('tue').innerHTML = "화 " + businessHourForHtml;
				} else if(businessDay === "WEDNESDAY") {
					document.getElementById('wed').innerHTML = "수 " + businessHourForHtml;
				} else if(businessDay === "THURSDAY") {
					document.getElementById('thur').innerHTML ="목 " + businessHourForHtml;
				} else if(businessDay === "FRIDAY") {
					document.getElementById('fri').innerHTML = "금 " + businessHourForHtml;
				} else if(businessDay === "SATURDAY") {
					document.getElementById('sat').innerHTML = "토 " + businessHourForHtml;
				} else if(businessDay === "SUNDAY") {
					document.getElementById('sun').innerHTML = "일 " + businessHourForHtml;
				}
			}

		});

		function getReviewsWithPagination(pageNoParam) {
			var pageNo = 1;
			if(pageNoParam !== -1) {
				var pageNo = pageNoParam;
			}

			// 치과의 후기정보를 가져오는 ajax 통신.(reviews)
			$.ajax({
				// console.log('ajax 시작~~');
				method:"POST",
				// async: false,
				url: "http://localhost:"+ ${dendomain} +"/springframework-mini-project-dentist/review/getReviews",
				// url: ${dendomain} + "/springframework-mini-project-dentist/review/getReviews",
				data: {
					pageNo: pageNo
				}
			})
			.done((data) => {
				//pager 객체 변수로 선언.
				var pager = data.pager;

				document.getElementById('averageStars').innerHTML = data.averageStars;
				document.getElementById('totalReviewNum').innerHTML = data.totalReviewNum;

				console.log('data : ' + data);
				console.log('data.reviredate : ' + data.reviewdate);
				console.log('data.averageStars : ' + data.averageStars);
				console.log('data.totalReviewNum : ' + data.totalReviewNum);
				console.log('data.reviewList : ' + data.reviewList);
				console.log('typeof data.reviewList : ' + typeof data.reviewList);
				//리뷰 내용 추가.
				let aReviewHtml = '';
				for(let i=0; i<data.reviewList.length; i++) {
					console.log('i : ' + i);
					aReviewHtml += '<a href="#" class="list-group-item list-group-item-action" style="font-size: 0.9rem;">';
					aReviewHtml += '	<div class="d-flex mb-1" style="color: #ffa048;">';
					aReviewHtml += '		<small class="mr-2">';
					if(data.reviewList[i]["starscore"] % 1 !== 0) {//n.5점
						console.log('data.reviewList[i]["starscore"] : ' + data.reviewList[i]["starscore"]);
						console.log('parseInt(data.reviewList[i]["starscore"]) : ' + parseInt(data.reviewList[i]["starscore"]));
						console.log('parseInt(data.reviewList[i]["starscore"]) : ' + parseInt(data.reviewList[i]["starscore"]));
						for(let j=0; j<parseInt(data.reviewList[i]["starscore"]); j++) {
							aReviewHtml += '			<i class="fa-solid fa-star"></i>';
						}
						aReviewHtml += '			<i class="fa-solid fa-star-half-stroke"></i>';
						for(let j=0; j<5-parseInt(data.reviewList[i]["starscore"])-1; j++) {
							aReviewHtml += '			<i class="fa-regular fa-star"></i>';
						}
					} else {//n.0점
						for(let j=0; j<parseInt(data.reviewList[i]["starscore"]); j++) {
							aReviewHtml += '			<i class="fa-solid fa-star"></i>';
						}
						for(let j=0; j<5 - parseInt(data.reviewList[i]["starscore"]); j++) {
							aReviewHtml += '			<i class="fa-regular fa-star"></i>';
						}
					}
					aReviewHtml += '		</small>';
					aReviewHtml += '		<small>' + data.reviewList[i]["starscore"] + '</small>';
					aReviewHtml += '	</div>';
					aReviewHtml += '	<div class="mb-1" style="font-weight: bold;">' + data.reviewList[i]["reviewcontent"] + '</div>';
					aReviewHtml += '	<div>';
/* 					aReviewHtml += '		<small><img src="/images/submit.png" style="width: 10px;"></small>'; */
					aReviewHtml += '		<small>' + data.reviewList[i]["userid"] + " | " + '</small>';
					aReviewHtml += '		<small>' + data.reviewList[i]["reviewdate"] + " | " + '</small>';
					aReviewHtml += '		<small>' + data.reviewList[i]["lastvisitcount"] + '번째 방문</small>';
					aReviewHtml += '	</div>';
					aReviewHtml += '</a>';
				}
				
				$("#reviewContainer").html(aReviewHtml);
				//리뷰 페이지네이션 추가.
				let aReviewPaginationHtml = '';
				aReviewPaginationHtml += '<a class="btn btn-outline-primary btn-sm" onClick="getReviewsWithPagination(1)" style="margin-left:3rem;">처음</a>';

				if(pager[0].groupNo>1) {
					aReviewPaginationHtml += '	<a class="btn btn-outline-info btn-sm" onClick="getReviewsWithPagination(' + parseInt(pager[0].startPageNo-1) + ')">이전</a>';
				}

				for(let i=pager[0].startPageNo; i<=pager[0].endPageNo; i++) {
					if(pager.pageNo != i) {
						aReviewPaginationHtml += '		<a class="btn btn-outline-success btn-sm" onClick="getReviewsWithPagination(' + i + ')">' + i + '</a>';
					} else {
						aReviewPaginationHtml += '		<a class="btn btn-outline-success btn-sm" onClick="getReviewsWithPagination(' + i + ')">' + i + '</a>';
					}
				}
				if(pager[0].groupNo<pager[0].totalGroupNo) {
					let nextPageNo = pager[0].endPageNo+1;
					aReviewPaginationHtml += '		<a class="btn btn-outline-info btn-sm" onClick="getReviewsWithPagination(' + parseInt(pager[0].endPageNo+1) + ')">다음</a>';
				}
				aReviewPaginationHtml += '		<a class="btn btn-outline-primary btn-sm"  onClick="getReviewsWithPagination(' + parseInt(pager[0].totalPageNo) + ')">맨끝</a>';

				$("#reviewPaginationContainer").html(aReviewPaginationHtml);
			});

		}
		getReviewsWithPagination(-1);
	</script>
	<script>
		$(function() {
			// 희재 코멘트:
			// 만약 사용자가 후기를 작성해서 이 화면으로 redirect 된 경우라면
			// local.href 끝에 "#(엘리먼트id값)"이 붙게 됨. "#(엘리먼트id값)"이 붙은 경우
			// 해당 엘리먼트로 스크롤 anchor 처리하려는 코드임(동작은 하지만 수정 필요).
			const id = location.hash.substring(1);
			if (tag !== "") {
				const targetEl = document.querySelector("#"+id);
				$('html,body').animate({scrollTop: $("#"+id).offset().top},'slow');
			}
		});
	</script>
</body>
</html>