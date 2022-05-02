<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/views/common/meta.jsp"%>
<title>치스토리-치과 상세</title>
<style>
.btn {
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
</head>
<body>
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
        yesBtn.onclick = function() {
            let denNoForReservation = document.getElementById('denNo').value;
            //내 치과에 등록된 치과인지 점검.
            location.href = "";
            //내 치과에 등록된
        }
	})
	
	function handleHidden(e, task, denno) {
		const targetEl = e.target;
		const theElement = targetEl.parentNode.parentNode.parentNode.querySelector(".history-list-hidden__item");
		$(targetEl.parentNode.parentNode.parentNode.querySelector(".history-list-hidden__item")).toggle();
		
		const denName = targetEl.parentNode.parentNode.querySelector(".denName");
		const denidvalue = $(targetEl.parentNode.parentNode.querySelector(".denName")).text();
		theElement.dataset.whatever = denidvalue;

		// const hiddenDenNo = denno;
		// if(task === 'add') {
		// 	location.href = "myDentist?denno=" + denno + "&task=" + task;
		// } else if(task === 'delete') {
		// 	location.href = "myDentist?denno=" + denno + "&task=" + task;
		// }
	}
	
	function toggleOff(e) {
		const targetEl = e.target;
		$(targetEl).toggle();
	}
</script>

	<div>
		<img
			src="${pageContext.request.contextPath}/resources/images/photo17.jpg"
			width="100%">
	</div>
	<div style="text-align: center; margin-top: 50px;">
		<span id="denname" style="font-size: xx-large;"></span>
	</div>
	<div style="text-align: center; flex-direction: row;">
		<div><i class="fa-solid fa-star"></i></div>
		<div id="averageStars"></div>
		<div><p>리뷰</p></div>
		<div id="totalReviewNum"></div>
	</div>
	<div>
		<%-- dendomain 파라메터로 전달해야 함. --%>
		<a class="btn"
			href="${pageContext.request.contextPath}/reservationUsingCalendar/">예약하기</a>
	</div>
	<div style="margin-left: 1rem;">
		<div style="display: flex; flex-direction: row;">
			<div>
				<i class="fa-solid fa-phone"></i>
			</div>
			<div id="dencontact"></div>
		</div>
		<div style="display: flex; flex-direction: row;">
			<div>
				<i class="fa-solid fa-location-dot"></i>
			</div>
			<div id="denaddress"></div>
		</div>
		<div style="display: flex; flex-direction: row;">
			<div>
				<i class="fa-solid fa-location-dot"></i>
			</div>
			<div>진료시간</div>
		</div>
		<div style="display: flex; flex-direction: row;">
			<div>
				<i class="fa-regular fa-clock"></i>
			</div>
			<div>평일 09:00~18:00 점심시간 13시 ~ 14시</div>
		</div>

		<div>토요일 09:00~13:00 점심시간 없음</div>
		<div>일요일 휴무</div>
	</div>

	<div id="reviewContainer" class="list-group">
		<%-- 여기에 ajax로 받아온 후기 정보 대입. --%>
	</div>
	<div id="reviewPaginationContainer">
		<a class="btn btn-outline-primary btn-sm" onClick="getReviewList(1)">처음</a>
		<c:if test="${pager.groupNo>1}">
			<a class="btn btn-outline-info btn-sm" onClick="getReviewList(${pager.startPageNo-1})">이전</a>
		</c:if>
		
		<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
			<c:if test="${pager.pageNo != i}">
				<a class="btn btn-outline-success btn-sm" onClick="getReviewList(${i})">${i}</a>
			</c:if>
			<c:if test="${pager.pageNo == i}">
				<a class="btn btn-outline-success btn-sm" onClick="getReviewList(${i})">${i}</a>
			</c:if>
		</c:forEach>
		
		<c:if test="${pager.groupNo<pager.totalGroupNo}">
			<a class="btn btn-outline-info btn-sm" onClick="getReviewList(${pager.endPageNo+1})">다음</a>
		</c:if>
		<a class="btn btn-outline-primary btn-sm"  onClick="getReviewList(${pager.totalPageNo})">맨끝</a>
	</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

	<script>
		// 치과의 기본정보를 가져오는 ajax 통신.(deninfo)
		$.ajax({
			// console.log('ajax 시작~~');
			method:"POST",
			url: "http://localhost:8082/springframework-mini-project-dentist/deninfo/getdeninfo",
			// url: ${dendomain} + "/springframework-mini-project-dentist/deninfo/getdeninfo",
			data: {
			},
		})
		.done((data) => {
			document.getElementById('denname').innerHTML = data.denname;
			document.getElementById('dencontact').innerHTML = data.dencontact;
			document.getElementById('denaddress').innerHTML = data.denaddress;

			// var DENNAME = data.denname; 
			// var DENCONTACT = data.dencontact;
			// var DENADDRESS = data.denaddress;
			// var IMAGECONTENTTYPE = data.imagecontenttype;
			// var IMAGEFILENAME = data.imagefilename;
			// var DENOWNER = data.denowner;
			// var DENREGISTNO = data.denregistno;
			// var DENLONGITUDE = data.denlongitude;
			// var DENLATITUDE = data.denlatitude;
		});

		// function getReviewList(pageNo) {
		// 	if(pageNo === null) {
		// 		pageNo = 1;
		// 	} else {
				
		// 	}

			// 치과의 후기정보를 가져오는 ajax 통신.(reviews)
			$.ajax({
				// console.log('ajax 시작~~');
				method:"POST",
				async: false,
				url: "http://localhost:8082/springframework-mini-project-dentist/review/getReviews",
				// url: ${dendomain} + "/springframework-mini-project-dentist/review/getReviews",
				data: {
					// pageNo: pageNo
				}
			})
			.done((data) => {
				document.getElementById('averageStars').innerHTML = data.averageStars;
				document.getElementById('totalReviewNum').innerHTML = data.totalReviewNum;

				console.log('data : ' + data);
				console.log('data.averageStars : ' + data.averageStars);
				console.log('data.totalReviewNum : ' + data.totalReviewNum);
				console.log('data.reviewList : ' + data.reviewList);
				console.log('typeof data.reviewList : ' + typeof data.reviewList);
				console.log('data.reviewList[0]["userid"] : ' + data.reviewList[0]['userid']);
				//리뷰 내용 추가.
				let aReviewHtml = '';
				for(let i=0; i<data.reviewList.length; i++) {
					console.log('i : ' + i);
					aReviewHtml += '<a href="#" class="list-group-item list-group-item-action">';
					aReviewHtml += '	<div class="d-flex">';
					aReviewHtml += '		<small class="mr-1">';
					if(data.reviewList[i]["starscore"] % 0.5 === 0) {//n.5점
						for(let j=0; j<parseInt(data.reviewList[i]["starscore"]); j++) {
							aReviewHtml += '			<i class="fa-solid fa-star"></i>';
						}
						aReviewHtml += '			<i class="fa-solid fa-star-half-stroke"></i>';
						for(let j=0; j<5-parseInt(data.reviewList[i]["starscore"])-1; j++) {
							aReviewHtml += '			<i class="fa-solid fa-star-half-stroke"></i>';
						}
					} else {//n.0점
						for(let j=0; j<parseInt(data.reviewList[i]["starscore"]); j++) {
							aReviewHtml += '			<i class="fa-solid fa-star"></i>';
						}
						for(let j=0; j<5 - parseInt(data.reviewList[i]["starscore"]); j++) {
							aReviewHtml += '			<i class="fa-solid fa-star-half-stroke"></i>';
						}
					}
					aReviewHtml += '		</small>';
					aReviewHtml += '		<small>' + data.reviewList[i]["starscore"] + '</small>';
					aReviewHtml += '	</div>';
					aReviewHtml += '	<div>' + data.reviewList[i]["reviewcontent"] + '</div>';
					aReviewHtml += '	<div>';
					aReviewHtml += '		<small><img src="/images/submit.png" style="width: 10px;"></small>';
					aReviewHtml += '		<small>' + data.reviewList[i]["userid"] + '</small>';
					aReviewHtml += '		<small>날짜추가해야함!!!</small>';
					aReviewHtml += '		<small>' + data.reviewList[i]["lastvisitcount"] + '번째 방문</small>';
					aReviewHtml += '	</div>';
					aReviewHtml += '</a>';
				}
				$("#reviewContainer").html(aReviewHtml);
				// //리뷰 페이지네이션 추가.
				// let aReviewPaginationHtml = '';
				// if(&{pager.groupNo}>1) {
				// 	aReviewPaginationHtml += '<a class="btn btn-outline-primary btn-sm" onClick="getReviewList(1)">처음</a>';
				// 	aReviewPaginationHtml += '	<a class="btn btn-outline-info btn-sm" onClick="getReviewList(${pager.startPageNo-1})">이전</a>';
				// 	aReviewPaginationHtml += '		<small class="mr-1">';
				// 	for(let i=${pager.startPageNo}; i<${pager.endPageNo}; i++) {
				// 		console.log('i : ' + i);
				// 		aReviewPaginationHtml += '		<a class="btn btn-outline-success btn-sm" onClick="getReviewList_list(${i})">${i}</a>';


						
				// 		<c:if test="${pager.groupNo>1}">
				// 			<a class="btn btn-outline-info btn-sm" onClick="getReviewList(${pager.startPageNo-1})">이전</a>
				// 		</c:if>
						
				// 		<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
				// 			<c:if test="${pager.pageNo != i}">
				// 				<a class="btn btn-outline-success btn-sm" onClick="getReviewList_list(${i})">${i}</a>
				// 			</c:if>
				// 			<c:if test="${pager.pageNo == i}">
				// 				<a class="btn btn-outline-success btn-sm" onClick="get_lgetReviewListist(${i})">${i}</a>
				// 			</c:if>
				// 		</c:forEach>
						
				// 		<c:if test="${pager.groupNo<pager.totalGroupNo}">
				// 			<a class="btn btn-outline-info btn-sm" onClick="getReviewList(${pager.endPageNo+1})">다음</a>
				// 		</c:if>
				// 		<a class="btn btn-outline-primary btn-sm"  onClick="getReviewList(${pager.totalPageNo})">맨끝</a>


	
				// 	}
					
				// } else {

				// }

				// $("#reviewPaginationContainer").html(aReviewPaginationHtml);
			});
		// }
	</script>
</body>
</html>




