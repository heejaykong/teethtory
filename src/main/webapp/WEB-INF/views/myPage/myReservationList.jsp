<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/common/meta.jsp" %>
	<title>치스토리-마이페이지</title>
<script type="text/javascript" src="/js/jquery-1.8.3.min.js"></script>
<style>
.stamp {
	border-radius: 80%;
	color: #555;
	font-size: 0.5rem;
	font-weight:2rem;
	border: 0.25rem solid #555;
	display: inline-block;
	padding: 0.25rem 1rem;
	text-transform: uppercase;
	border-radius: 70%;
	font-family: 'Courier';
	-webkit-mask-image: url('https://s3-us-west-2.amazonaws.com/s.cdpn.io/8399/grunge.png');
  -webkit-mask-size:2rem;
  mix-blend-mode: multiply;
}
.is-nope {
  border-radius: 80%;
	color: red;
	font-size: 0.5rem;
	font-weight:2rem;
	border: 0.25rem solid red;
	display: inline-block;
	padding: 0.25rem 1rem;
	text-transform: uppercase;
	border-radius: 70%;
	font-family: 'Courier';
	-webkit-mask-image: url('https://s3-us-west-2.amazonaws.com/s.cdpn.io/8399/grunge.png');
  -webkit-mask-size:2rem;
  mix-blend-mode: multiply;
}
.is-approved {
border-radius: 80%;
	color: green;
	font-size: 0.5rem;
	font-weight:2rem;
	border: 0.25rem solid green;
	display: inline-block;
	padding: 0.25rem 1rem;
	text-transform: uppercase;
	border-radius: 70%;
	font-family: 'Courier';
	-webkit-mask-image: url('https://s3-us-west-2.amazonaws.com/s.cdpn.io/8399/grunge.png');
  -webkit-mask-size:2rem;
  mix-blend-mode: multiply;
} 
.btn{
	color: black;
	background-color: #ffdab9;
	border-color:#ffdab9;
	width:90%;
	height:3rem;
}
#all{
overflow: hidden;
}
.container{
display:flex;
flex-direct:row;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/loading.jsp" %>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

<div id="all">
    <%-- 로그인한 사용자의 예약 기록 보여주기. --%>
    <div style="margin-left:1rem; margin-bottom:2rem; margin-top:3rem;">
    	<h4>예약 현황</h4>
    </div>
	<div id="reservationListContainer">
	</div>
	<div id="paginationContainer">
	</div>
</div>

	<script>
		//웹 서버로부터 사용자의 내치과 객체들을 리스트로 받아오는 통신.
		var totalArray = [];
		$.ajax({
			// url: "myPage/myReservationList",
			url: "${pageContext.request.contextPath}/myPage/myReservationList",
			method:"POST",
			async: false,
			// url: ${dendomain} + "/springframework-mini-project/myPage/myReservationList",
			data: {
			}
		})
		.done((data) => {
			 console.log('data : ' + data);
			console.log('typeof data : ' + typeof data);
			console.log('data["myDentistList"] : ' + data["myDentistList"]);
			console.log('data["myDentistList"][0]["dendomain"] : ' + data["myDentistList"][0]["dendomain"]);
			console.log('data["myDentistList"][1]["dendomain"] : ' + data["myDentistList"][1]["dendomain"]);
			console.log('data["patientssn"] : ' + data["patientssn"]);
			console.log('typeof data["myDentistList"] : ' + typeof data["myDentistList"]);
			console.log('data["myDentistList"].length : ' + data["myDentistList"].length); 
			for(let i=0; i<data["myDentistList"].length; i++) {
				// 사용자의 모든 '내 치과'에 예약정보를 확인해서 받아오는 통신.
				$.ajax({
					url: "http://localhost:" + data["myDentistList"][i]["dendomain"] + "/springframework-mini-project-dentist/reservation/reservationList",
					method:"POST",
					async: false,
					data: {
						//주민번호 받아와야 함.
						patientssn: data["patientssn"]
						// ,dendomain(reservation 객체에 denIpAddress를 받아와야함...)
						// dendomain(denIpAddress)를 PK로 사용하고, denno는 삭제하거나 인덱스처럼 활용...?
					}
				})
				.done((data) => {
					//data : reservationList(reservation 객체들을 담은 attay)
					console.log('data["reservationList"] : ' + data["reservationList"]);
					console.log('typeof data["reservationList"] : ' + typeof data["reservationList"]);
					console.log('data["reservationList"][0] : ' + data["reservationList"][0]);
					console.log('typeof data["reservationList"][0] : ' + typeof data["reservationList"][0]);
					console.log('data["reservationList"][0]["submitdate"] : ' + data["reservationList"][0]["submitdate"]);
					console.log('typeof data["reservationList"][0]["submitdate"] : ' + typeof data["reservationList"][0]["submitdate"]);
					console.log('data["reservationList"][0]["dendomain"] : ' + data["reservationList"][0]["dendomain"]);
					console.log('typeof data["reservationList"][0]["dendomain"] : ' + typeof data["reservationList"][0]["dendomain"]);
					console.log('data["reservationList"][0]["isfixed"] : ' + data["reservationList"][0]["isfixed"]);
					console.log('typeof data["reservationList"][0]["isfixed"] : ' + typeof data["reservationList"][0]["isfixed"]); 
					//치과 1개로부터 받아온 reservation 객체를 전역변수인 totalList에 모으기.
					for(let j=0; j<data["reservationList"].length; j++) {
						totalArray.push(data["reservationList"][j]);
					}
				});
			}
		});
		//사용자의 모든 '내 치과'에 요청을 보내서 받아온 reservation 객체들을 담은 array를 정렬.
		console.log('totalArray : ' + totalArray);
		totalArray.sort(function(a, b) {
			if(a["submitdate"] > b["submitdate"]) {
				console.log('a["submitdate"] : ' + a["submitdate"] + ', b["submitdate"] : ' + b["submitdate"]);
				return -1;
			}
			if(a["submitdate"] < b["submitdate"]) {
				return 1;
			}
			return 0;
		})

		console.log('------------------------------------');
		for(let i=0; i<totalArray.length; i++) {
			// console.log('totalArray[' + i + ']["submitdate"]' + totalArray[i]["submitdate"]);
			console.log('totalArray[' + i + ']["selecteddate"]' + totalArray[i]["selecteddate"]);
			console.log( new Date(totalArray[i]["selecteddate"]) > new Date() );
		}

		//한 그룹당 예약목록 출력.
		function printReservationList(pager) {
			let aReservationHtml = '';
			for(let i=pager.startRowIndex; i<=pager.endRowIndex; i++) {
				console.log('i : ' + i);
				console.log('pager.endRowIndex : ' + pager.endRowIndex);
				aReservationHtml += '<div id="aReservationContainer" style="position:relative;  border:1px solid lightgrey; border-radius:1rem; margin:0.5rem;"> ';
				aReservationHtml += '	<div style="position:absolute; margin-left:1rem;left:80%">';
				if(totalArray[i]["isfixed"] === false && totalArray[i]["ispending"] === false) {
					aReservationHtml += '		<span class="stamp is-nope">취소</span>';
				} else if(totalArray[i]["isfixed"] === false && totalArray[i]["ispending"] === true) {
					aReservationHtml += '		<span class="stamp">대기중</span>';
				} else if(totalArray[i]["isfixed"] === true && totalArray[i]["ispending"] === false) {
					aReservationHtml += '		<span class="stamp is-approved">확정</span>';
				} else {//불가능한 경우
					//시간이 된다면 오류로그 쌓는 DB를 만들어서 쌓으면 좋을듯.
				}
				aReservationHtml += '		</div>';
				aReservationHtml += '	<div style="text-decoration:none; color:orange; margin-left:1rem; margin-top:1rem;"><h4>' + totalArray[i]["denname"] + '</h4></div>';
				aReservationHtml += '	<div style="margin-left:1rem;"><h5>예약일정: ' + totalArray[i]["selecteddate"] + ' ' + totalArray[i]["selectedtime"] + '</h5></div>';
				aReservationHtml += '	<div style="margin-left:1rem;"><h5>신청일자: ' + totalArray[i]["submitdate"] + '</h5></div>';
				//취소사유가 있는 경우는 무조건 취소된 경우이므로, 취소사유가 있는 경우에만 취소사유를 표시.
				if(totalArray[i]["canceldesc"] !== undefined) {
					aReservationHtml += '	<div style="margin-left:1rem;"><h5>취소사유: ' + totalArray[i]["canceldesc"] + '</h5></div>';
				}
				if( ( (totalArray[i]["isfixed"] === false && totalArray[i]["ispending"] === true)
					|| (totalArray[i]["isfixed"] === true && totalArray[i]["ispending"] === false) )
					&& (new Date(totalArray[i]["selecteddate"]) > new Date()) ) {
						aReservationHtml += '	<div onclick="cancelReservation(' + totalArray[i]["dendomain"] + ', ' + parseInt(totalArray[i]["resno"]) + ')" class="container" style=" margin-bottom:1rem;">';	
						// aReservationHtml += '	<div class="container cancelBtn" style=" margin-bottom:1rem;">';
						aReservationHtml += '		<div id="dendomain" style="display: none;" value="' + totalArray[i]["dendomain"] + '"></div>';
						aReservationHtml += '		<div id="resno" style="display: none;" value="' + totalArray[i]["resno"] + '"></div>';
						aReservationHtml += '		<input type="text" value="예약취소" readonly';	
						aReservationHtml += '					class="btn btn-block btn-osstem"style="margin-left:0.5rem; margin-top:2rem; width:45%; height:3rem;">';	
						aReservationHtml += '		</div>';
				}
				aReservationHtml += '</div>';
				$("#reservationListContainer").html(aReservationHtml);
			}
		}

		// printPaginationBtn(pager); //페이지 로드되고 1회만 실행. 이후부터는 페이지네이션용 버튼 클릭시마다 setPager -> printPaginationBtn 새로 실행.
		function printPaginationBtn(pager) {
			//페이지네이션 버튼 출력.
			let paginationHtml = '';
			paginationHtml += '<a class="btn btn-outline-primary btn-sm" onClick="setPager(1)">처음</a>';
			if(pager.groupNo>1) {
				paginationHtml += '	<a class="btn btn-outline-info btn-sm" onClick="setPager(' + parseInt(pager.startPageNo-1) + ')">이전</a>';
			}
			for(let i=pager.startPageNo; i<=pager.endPageNo; i++) {
				if(pager.pageNo != i) {
					paginationHtml += '		<a class="btn btn-outline-success btn-sm" onClick="setPager(' + i + ')">' + i + '</a>';
				} else {
					paginationHtml += '		<a class="btn btn-outline-success btn-sm" onClick="setPager(' + i + ')">' + i + '</a>';
				}
			}
			if(pager.groupNo<pager.totalGroupNo) {
				paginationHtml += '		<a class="btn btn-outline-info btn-sm" onClick="setPager(' + parseInt(pager.endPageNo+1) + ')">다음</a>';
			}
			paginationHtml += '		<a class="btn btn-outline-primary btn-sm"  onClick="setPager(' + parseInt(pager.totalPageNo) + ')">맨끝</a>';
	
			$("#paginationContainer").html(paginationHtml);
		}
		
		//페이지네이션과 예약현황리스트 출력.
		const pager = {};
		function setPager(pageNoParam) {
			pager.rowsPerPage = 10;	//페이지당 행 수 
			pager.pagesPerGroup = 5; //그룹당 페이지 수
			pager.totalRows = totalArray.length;	//전체 행수
			pager.pageNo = pageNoParam;	//현재 페이지 번호
			
			//전체 페이지 수
			pager.totalPageNo = parseInt( pager.totalRows / pager.rowsPerPage );
			if( parseInt( pager.totalRows % pager.rowsPerPage ) !== 0) {
				pager.totalPageNo++;
			}
			console.log('pager.totalPageNo : ' + pager.totalPageNo);

			//전체 그룹 수
			pager.totalGroupNo = parseInt( pager.totalPageNo / pager.pagesPerGroup );
			if( parseInt( pager.totalPageNo % pager.pagesPerGroup ) !== 0) {
				pager.totalGroupNo++;
			}
			//현재 그룹 번호
			pager.groupNo = parseInt( (pager.pageNo - 1) / pager.pagesPerGroup ) + 1 ;
			//그룹의 시작 페이지 번호
			pager.startPageNo = parseInt( (pager.groupNo-1) * pager.pagesPerGroup ) + 1;
			//그룹의 끝 페이지 번호
			pager.endPageNo =parseInt(  pager.startPageNo + pager.pagesPerGroup ) - 1;
			if(pager.groupNo === pager.totalGroupNo) {
				pager.endPageNo = pager.totalPageNo;
			}
			//페이지의 시작 행 번호(1, ..., n)
			pager.startRowNo = parseInt( (pager.pageNo - 1) * pager.rowsPerPage ) + 1;
			//페이지의 시작 행 인덱스(0, ..., n-1) for mysql
			pager.startRowIndex = pager.startRowNo - 1;
			if(parseInt( pager.pageNo * pager.rowsPerPage ) > pager.totalRows) {
				//페이지의 마지막 행 번호
				pager.endRowNo = pager.totalRows;
				//페이지의 마지막 행 인덱스
				pager.endRowIndex = pager.totalRows - 1;
			} else {
				//페이지의 마지막 행 번호
				pager.endRowNo = parseInt( pager.pageNo * pager.rowsPerPage );
				//페이지의 마지막 행 인덱스
				pager.endRowIndex = pager.endRowNo - 1;
			}

			//페이지 로드되고 1회만 실행. 이후부터는 페이지네이션용 버튼 클릭시마다 setPager -> printPaginationBtn 새로 실행.
			printReservationList(pager)
			printPaginationBtn(pager);
		}

		function cancelReservation(dendomain, resno) {
			console.log('cancelReservation~~~');
			$.ajax({
				// url: dendomain + "/springframework-mini-project-dentist/reservation/cancelReservation",
				url: "http://localhost:" + dendomain + "/springframework-mini-project-dentist/reservation/cancelReservation",
				method:"POST",
				async: false,
				data: {
					resno: resno
				}
			})
			.done((data) => {
				console.log('data : ' + data);
				console.log('typeof data : ' + typeof data);
				// if(data) {

				// }
				location.reload();
			});
		}

		$('.cancelBtn').click(function() {
			console.log('~~~~~`');
			// let dendomainForAjax = $(this).parent('#dendomain').val();
			let dendomainForAjax = $(this).children('#dendomain').val();
			console.log('dendomainForAjax : ' + dendomainForAjax);
		});

		//rowsPerPage, pagesPerGroup, totalRows, pageNo
		setPager(1); //페이지 로드되고, ajax통신이 끝나면 최초 1회 실행.
	</script>


	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
