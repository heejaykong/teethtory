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
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

<div id="all">
    <%-- 로그인한 사용자의 예약 기록 보여주기. --%>
    <div style="margin-left:1rem; margin-bottom:2rem; margin-top:3rem;">
    <h4>예약 현황</h4>
    </div>
    <div style="position:relative; border:1px solid lightgrey ;border-radius:1rem; margin:0.5rem;"> 
    		<div style="position:absolute; margin-left:1rem;left:80%">
	    	<span class="stamp is-nope">예약취소</span>
	    	</div>
    	<div style="text-decoration:none; color:orange; margin-left:1rem; margin-top:1rem;"><h4>A치과</h4></div>
	    	
    	<div style="margin-left:1rem;"><h5>일정: 2022. 04. 29(금) 10:30</h5></div>
		<div class="container" style=" margin-bottom:1rem;">
			<input type="submit" value="예약변경"
						class="btn btn-block btn-osstem"style="margin-left:0.5rem; margin-top:2rem; width:45%; height:3rem;">
			<input type="submit" value="예약취소"
						class="btn btn-block btn-osstem"style="margin-left:0.5rem; margin-top:2rem; width:45%; height:3rem;">
		</div>
    </div>
    
   <div style="position:relative;  border:1px solid lightgrey;border-radius:1rem; margin:0.5rem;"> 
    		<div style="position:absolute; margin-left:1rem; left:80%">
	    	<span class="stamp is-approved">예약확정</span>
	    	</div>
    	<div style="text-decoration:none; color:orange; margin-left:1rem; margin-top:1rem;"><h4>A치과</h4></div>
	    	
    	<div style="margin-left:1rem;"><h5>일정: 2022. 04. 29(금) 10:30</h5></div>
		<div class="container" style=" margin-bottom:1rem;">
			<input type="submit" value="예약변경"
						class="btn btn-block btn-osstem"style="margin-left:0.5rem; margin-top:2rem; width:45%; height:3rem;">
			<input type="submit" value="예약취소"
						class="btn btn-block btn-osstem"style="margin-left:0.5rem; margin-top:2rem; width:45%; height:3rem;">
		</div>
    </div>
    <div style="position:relative;  border:1px solid lightgrey; border-radius:1rem; margin:0.5rem;"> 
    		<div style="position:absolute; margin-left:1rem;left:80%">
	    	 <span class="stamp">예약대기</span>
	    	</div>
    	<div style="text-decoration:none; color:orange; margin-left:1rem; margin-top:1rem;"><h4>A치과</h4></div>
	    	
    	<div style="margin-left:1rem;"><h5>예약일정: 2022. 04. 29(금) 10:30</h5></div>
    	<div style="margin-left:1rem;"><h5>신청일자: 2022. 04. 29(금) 10:30</h5></div>
		<div class="container" style=" margin-bottom:1rem;">
			<input type="submit" value="예약변경"
						class="btn btn-block btn-osstem"style="margin-left:0.5rem; margin-top:2rem; width:45%; height:3rem;">
			<input type="submit" value="예약취소"
						class="btn btn-block btn-osstem"style="margin-left:0.5rem; margin-top:2rem; width:45%; height:3rem;">
		</div>
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

		// data.sort(function(a, b) {
		// 	if(a.treatdate > b.treatdate) {
		// 		return -1;
		// 	}
		// 	if(a.treatdate < b.treatdate) {
		// 		return 1;
		// 	}
		// 	return 0;
		// })
		console.log('------------------------------------');
		for(let i=0; i<totalArray.length; i++) {
			console.log('totalArray[' + i + ']["submitdate"]' + totalArray[i]["submitdate"]);
		}
	</script>


	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
