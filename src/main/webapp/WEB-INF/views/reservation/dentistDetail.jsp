<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/views/common/meta.jsp"%>
<title>치스토리-치과 상세</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/appIcon.png">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/pagination.css" />
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

.reviewWriter__img {
	width: 3rem;
	height: 3rem;
	border-radius: 50%;
}

#fa-seedling {
	font-size: 2rem;
	color:  rgb(164, 211, 147);
}
	
#fa-pagelines {
	font-size: 2rem;
	color: rgb(13, 173, 27);
}
	
#fa-tree {
	font-size: 2rem;
	color: rgb(10, 109, 18);
}	
</style>
<script>
	localStorage.setItem('dendomain', "${dendomain}");

	// const formtag = document.getElementById("pagination-form");
	// // 데이터 전송, 페이지 전환 방지
	// function handleSubmit(event) {
	// 	event.preventDefault();
	// }
	// // 등록
	// function init() {
	// 	formtag.addEventListener('submit', handleSubmit);
	// }
	// $('#pagination-form').submit(
	// 	getReviewsWithPagination( parseInt($('#pagination-input').val()) );
	// );
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
	        예약을 위해 '내 치과'로 등록하시겠습니까?
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">아니오</button>
	        <button id="btn-yes" type="button" class="btn btn-primary" style="width: 10rem;">예</button>
	      </div>
	    </div>
	</div>
</div>

<script>
	// $('#exampleModal').on('show.bs.modal', function (event) {
	//   	var button = $(event.relatedTarget) // Button that triggered the modal
	//   	var recipient = button.data('whatever') // Extract info from data-* attributes
	//   	var body = button.data('body')
	//   	// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	//   	// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	//   	console.log("aaa");
	//   	var modal = $(this)
	//   	modal.find('.modal-title').text(recipient)
	//   	modal.find('.modal-body').text(body)

    //     //모달에서 사용자가 '예'선택시에, 예약화면으로 넘어감.(dendomain 필요.)
    //     let yesBtn = document.getElementById('btn-yes');
    //     // yesBtn.onclick = function() {
    //     //     let dendomainForReservation = document.getElementById('dendomain').value;
    //     //     //내 치과에 등록된 치과인지 점검.
    //     //     location.href = "";
    //     //     //내 치과에 등록된
    //     // }
	// })
	
	function handleHidden(e, task, dendomain) {
		const targetEl = e.target;
		const theElement = targetEl.parentNode.parentNode.parentNode.querySelector(".history-list-hidden__item");
		$(targetEl.parentNode.parentNode.parentNode.querySelector(".history-list-hidden__item")).toggle();
		
		const denName = targetEl.parentNode.parentNode.querySelector(".denName");
		const denidvalue = $(targetEl.parentNode.parentNode.querySelector(".denName")).text();
		theElement.dataset.whatever = denidvalue;

		const hiddendendomain = dendomain;
		if(task === 'add') {
			location.href = "myDentist?dendomain=" + dendomain + "&task=" + task;
		} else if(task === 'delete') {
			location.href = "myDentist?dendomain=" + dendomain + "&task=" + task;
		}
	}
	
	function toggleOff(e) {
		const targetEl = e.target;
		$(targetEl).toggle();
	}
</script>
<div class="located-at-bottom-of-header">
	<div>
		<img id="dentistImg" style="background-size: cover; width: 100%;">
	</div>
	<div class="mx-3" style="text-align: center;">
		<div id="denname" class="pt-4 mb-2" style="font-size: 1.8rem;"></div>
		<div class="mb-3">
			<i class="fa-solid fa-star" style="color: #ffa048;"></i>
			<span id="averageStars" style="color: #ffa048;"></span>
			<span class="ml-2">리뷰</span>
			<span id="totalReviewNum" style="color: #ffa048;"></span>
		</div>
		<a class="btn-large-solid mb-4" onclick="checkRegistered()" style="display: block;">진료 예약하기</a>
	</div>
		<%-- dendomain 파라메터로 전달해야 함. --%>
	

	<div class="mx-5">
		<div class="d-flex mb-3">
			<i class="fa-solid fa-phone mr-4" onclick="contact()"></i>
			<a id="dencontact" onclick="contact()"></a>
		</div>
		
		<div class="d-flex mb-3">
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
		<c:if test="${backgroundColor != null && backgroundColor eq 'fa-seedling'}"><i class="fa-solid fa-seedling mr-2" id="fa-seedling"></i></c:if>
		<c:if test="${backgroundColor != null && backgroundColor eq 'fa-pagelines'}"><i class="fa-brands fa-pagelines mr-2" id="fa-pagelines"></i></c:if>
		<c:if test="${backgroundColor != null && backgroundColor eq 'fa-tree'}"><i class="fa-solid fa-tree mr-2" id="fa-tree"></i></c:if>
	</div>
	<div id="reviewPaginationContainer">
		<%-- 여기에 페이지네이션 처리. --%>
	</div>
</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	<script>
		function checkRegistered() {
			console.log('localStorage.getItem("dendomain") : ' + localStorage.getItem("dendomain"));
			$.ajax({
				method:"POST",
				url: "${pageContext.request.contextPath}/reservation/dentistDetail",
				data: {
					dendomain: localStorage.getItem("dendomain")
				}
			})
			.done((data) => {
				console.log('data : ' + data);
				console.log('typeof data : ' + typeof data);

				if(data.alreadyRegistered === 1) {//1: 내 치과로 등록되어 있음.
					console.log(localStorage.getItem("dendomain"));
					location.href = "reservationUsingCalendar?dendomain=" + localStorage.getItem("dendomain");
				} else {//0: 내 치과로 등록 필요.
					$('#exampleModal').modal('show');
					//모달에서 사용자가 '예'선택시에, 예약화면으로 넘어감.(dendomain 필요.)
					let yesBtn = document.getElementById('btn-yes');
					yesBtn.onclick = function() {
						$.ajax({
							method:"GET",
							// url: "${pageContext.request.contextPath}/reservation/dentistDetail",
							url: "${pageContext.request.contextPath}/myPage/myDentist",
							data: {
								dendomain: localStorage.getItem("dendomain"),
								task: "add"
							},
							async: false
						})
						.done((data) => {
							// if(data.registrationResult === 1) {
								location.href = "reservationUsingCalendar?dendomain=" + localStorage.getItem("dendomain") ;
							// } else {
								// alert('예약을 진행할 수 없는 사유가 발생했습니다. *관리자에게 문의 요망*');	
							// }
						});
					}
					// });
					//
					// on('show.bs.modal', function (event) {
					// 	var button = $(event.relatedTarget) // Button that triggered the modal
					// 	var recipient = button.data('whatever') // Extract info from data-* attributes
					// 	var body = button.data('body')
					// 	// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
					// 	// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
					// 	console.log("aaa");
					// 	var modal = $(this)
					// 	modal.find('.modal-title').text(recipient)
					// 	modal.find('.modal-body').text(body)
					// //모달에서 사용자가 '예'선택시에, 예약화면으로 넘어감.(dendomain 필요.)
					// let yesBtn = document.getElementById('btn-yes');
					// yesBtn.onclick = function() {
					// 	$.ajax({
					// 		method:"GET",
					// 		url: "${pageContext.request.contextPath}/reservation/dentistDetail",
					// 		data: {
					// 			dendomain: localStorage.getItem("dendomain")
					// 		},
					// 		async: false
					// 	})
					// 	.done((data) => {
					// 		console.log('data.registrationResult : ' + data.registrationResult);
					// 		console.log('typeof data.registrationResult : ' + typeof data.registrationResult);
					// 		if(data.registrationResult === 1) {
					// 			location.href = "reservationUsingCalendar?dendomain=" + localStorage.getItem("dendomain");
					// 		} else {
					// 			alert('예약을 진행할 수 없는 사유가 발생했습니다. *관리자에게 문의 요망*');	
					// 		}
					// 	});
					// }
					// })
				}
			});
		}
	</script>
	<script>
		// 치과의 대표이미지를 가져오는 통신.(deninfo)
		console.log('~~~~~~~~~~~~~~~`');
		console.log('dendomain : ' + ${dendomain});
		let dentistImg = new Image();
		dentistImg.src = "http://localhost:"+ ${dendomain} +"/springframework-mini-project-dentist/deninfo/getDentistImage";
		dentistImg.onload = function getImage() {
			$('#dentistImg').attr("src", dentistImg.src);
		}
		dentistImg.onerror = function setDisplayNone() {
			$('#dentistImg').attr("style", "display: none");
		}

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
			/* console.log('data',data); */
			for(let i=0; i<Object.keys(data).length; i++) {
				let businessDay = data[i][0];
				let businessHour = data[i][1];
				let startTime = -1;
				let endTime = -1;
				let startLunchTime = -1;
				let endLunchTime = -1;
				
				let bitArray = businessHour.split('');
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
				var totalReviewNum = data.totalReviewNum;
				console.log('data.totalReviewNum : ' + data.totalReviewNum)

				document.getElementById('averageStars').innerHTML = data.averageStars;
				document.getElementById('totalReviewNum').innerHTML = data.totalReviewNum;

				console.log('data',data);
				//리뷰 내용 추가.
				let aReviewHtml = '';
				let lee;
				for(let i=0; i<data.reviewList.length; i++) {
					//user마다 포인트 체크해서 색 가져오기
					$.ajax({
						method:"POST",
						async: false,
						url: "${pageContext.request.contextPath}/reservation/getReviewRank",
						data: {
							userid: data.reviewList[i].userid
						}
					}).done((leedh) => {
						lee = leedh.backgroundColor;
						console.log(lee);
					});
					console.log(lee);
					aReviewHtml += '<div class="list-group-item list-group-item-action d-flex align-items-center" style="font-size: 0.9rem;">';
					if(lee == "fa-seedling") {
						aReviewHtml += '	<i class="fa-solid fa-seedling mr-2" id="fa-seedling"></i>';
					} else if(lee == "fa-pagelines") {
						aReviewHtml += '	<i class="fa-brands fa-pagelines mr-2" id="fa-pagelines"></i>';
					} else if(lee == "fa-tree") {
						aReviewHtml += '	<i class="fa-solid fa-tree mr-2" id="fa-tree"></i>';
					}
					aReviewHtml += '	<div>';
					aReviewHtml += '	<div class="d-flex mb-1" style="color: #ffa048;">';
					aReviewHtml += '		<small class="mr-2">';
					if(data.reviewList[i]["starscore"] % 1 !== 0) {//n.5점
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
					aReviewHtml += '	</div>';
					aReviewHtml += '</div>';
				}
				
				$("#reviewContainer").html(aReviewHtml);
				//리뷰 페이지네이션 추가.
				console.log('pager[0].startPageNo : ' + pager[0].startPageNo);
				console.log('pager[0].endPageNo : ' + pager[0].endPageNo);
				// let aReviewPaginationHtml = '';
				// // aReviewPaginationHtml = '<nav aria-label="Page navigation example" style="margin-top: 1rem;">';
				// // aReviewPaginationHtml = '<ul class="pagination justify-content-center">';
				// aReviewPaginationHtml += '<div class="pagination-component">';
				// if(pager[0].pageNo > pager[0].startPageNo) {
				// 	aReviewPaginationHtml += '	<a onClick="getReviewsWithPagination(' + parseInt(1) + ')">';
				// 	aReviewPaginationHtml += '		<div class="pagination-btn">';
				// 	aReviewPaginationHtml += '			<i class="fa-solid fa-angles-left"></i>';
				// 	aReviewPaginationHtml += '		</div>';
				// 	aReviewPaginationHtml += '	</a>';

				// 	aReviewPaginationHtml += '	<a onClick="getReviewsWithPagination(' + parseInt(pager[0].pageNo-1) + ')">';
				// 	aReviewPaginationHtml += '		<div class="pagination-btn">';
				// 	aReviewPaginationHtml += '			<i class="fa-solid fa-angle-left"></i>';
				// 	aReviewPaginationHtml += '		</div>';
				// 	aReviewPaginationHtml += '	</a>';
				// }

				// if(pager[0].pageNo < pager[0].endPageNo) {
				// 	aReviewPaginationHtml += '		<a onClick="getReviewsWithPagination(' + parseInt(pager[0].pageNo+1) + ')"';
				// 	aReviewPaginationHtml += '			<div class="pagination-btn">';
				// 	aReviewPaginationHtml += '				<i class="fa-solid fa-angle-right"></i>';
				// 	aReviewPaginationHtml += '			</div>';
				// 	aReviewPaginationHtml += '		</a>';

				// 	aReviewPaginationHtml += '		<a onClick="getReviewsWithPagination(' + parseInt(pager[0].endPageNo) + ')"';
				// 	aReviewPaginationHtml += '			<div class="pagination-btn">';
				// 	aReviewPaginationHtml += '				<i class="fa-solid fa-angles-right"></i>';
				// 	aReviewPaginationHtml += '			</div>';
				// 	aReviewPaginationHtml += '		</a>';
				// }
				// aReviewPaginationHtml += '</div>';
				// aReviewPaginationHtml = '</ul>';
				// aReviewPaginationHtml = '</nav>';
				let aReviewPaginationHtml = '';
				aReviewPaginationHtml += '<div class="pagination-component" style="margin-right:1rem;">';
				aReviewPaginationHtml += '	<a onClick="getReviewsWithPagination(' + parseInt(1) + ')">';
				// aReviewPaginationHtml += '	<a onClick="getReviewsWithPagination(' + parseInt(1) + ')" style="margin-left:3rem;">';
				aReviewPaginationHtml += '		<div class="pagination-btn">';
				aReviewPaginationHtml += '			<i class="fa-solid fa-angles-left"></i>';
				aReviewPaginationHtml += '		</div>';
				aReviewPaginationHtml += '	</a>';

				if(pager[0].groupNo>1) {
					aReviewPaginationHtml += '	<a onClick="getReviewsWithPagination(' + parseInt(pager[0].startPageNo-1) + ')">';
					aReviewPaginationHtml += '		<div class="pagination-btn">';
					aReviewPaginationHtml += '			<i class="fa-solid fa-angle-left"></i>';
					aReviewPaginationHtml += '		</div>';
					aReviewPaginationHtml += '	</a>';
				}

				for(let i=pager[0].startPageNo; i<=pager[0].endPageNo; i++) {
					if(pager[0].pageNo != i) {
						aReviewPaginationHtml += '		<a onClick="getReviewsWithPagination(' + i + ')">';
						aReviewPaginationHtml += '			<div class="pagination-btn">';
						aReviewPaginationHtml += '' + i;
						aReviewPaginationHtml += '			</div>';
						aReviewPaginationHtml += '		</a>';
					} else {
						aReviewPaginationHtml += '		<a onClick="getReviewsWithPagination(' + i + ')">';
						aReviewPaginationHtml += '			<div class="pagination-btn pagination-btn-current">';
						aReviewPaginationHtml += '' + i;;
						aReviewPaginationHtml += '			</div>';
						aReviewPaginationHtml += '		</a>';
					}
				}
				if(pager[0].groupNo<pager[0].totalGroupNo) {
					let nextPageNo = pager[0].endPageNo+1;
					aReviewPaginationHtml += '		<a onClick="getReviewsWithPagination(' + parseInt(pager[0].endPageNo+1) + ')"';
					aReviewPaginationHtml += '			<div class="pagination-btn">';
					aReviewPaginationHtml += '				<i class="fa-solid fa-angle-right"></i>';
					aReviewPaginationHtml += '			</div>';
					aReviewPaginationHtml += '		</a>';
				}
				aReviewPaginationHtml += '		<a onClick="getReviewsWithPagination(' + parseInt(pager[0].totalPageNo) + ')"';
				aReviewPaginationHtml += '			<div class="pagination-btn">';
				aReviewPaginationHtml += '				<i class="fa-solid fa-angles-right"></i>';
				aReviewPaginationHtml += '			</div>';
				aReviewPaginationHtml += '		</a>';
				aReviewPaginationHtml += '</div>';

				$("#reviewPaginationContainer").html(aReviewPaginationHtml);
			});

		}
		getReviewsWithPagination(-1);

		// function setPageNo(pageNoParam) {
		// 	pageNo = pageNoParam;
		// }
		
		function contact(){
			document.location.href='tel:'+$(dencontact);
		}
	</script>
	<script>
		// $(function() {
		// 	// 희재 코멘트:
		// 	// 만약 사용자가 후기를 작성해서 이 화면으로 redirect 된 경우라면
		// 	// local.href 끝에 "#(엘리먼트id값)"이 붙게 됨. "#(엘리먼트id값)"이 붙은 경우
		// 	// 해당 엘리먼트로 스크롤 anchor 처리하려는 코드임(동작은 하지만 수정 필요).
		// 	const id = location.hash.substring(1);
		// 	if (tag !== "") {
		// 		const targetEl = document.querySelector("#"+id);
		// 		$('html,body').animate({scrollTop: $("#"+id).offset().top},'slow');
		// 	}
		// });
	</script>
</body>
</html>