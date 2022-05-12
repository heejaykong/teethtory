<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/common/meta.jsp" %>
	<title>치스토리 - 진료 예약하기</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reservation/reservationUsingCalendar.css" />
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/loading.jsp" %>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	
	<main class="main located-at-bottom-of-header">

		<%-- 선택결과 보여주는 영역 --%>
		<section class="selected-result-block">
			<h1 class="page-title" style="margin-top: 1rem;">진료 예약하기</h1>

			<div class="selected-result-display-box">
				<span class="selected-date-display">
					<i class="fa-solid fa-calendar-day"></i>
					<input readonly id="dateSelect" value="날짜" />
				</span>
				<span class="selected-time-display">
					<i class="fa-solid fa-clock"></i>
					<input readonly type="text" id="reservationtime" value="-- : --" />
				</span>
			</div>
		</section>
		
		<%-- 옅은 회색 분리 막대 --%>
		<div class="thick-divider"></div>
		
		<%-- 날짜/시간 선택 영역 --%>
		<section class="date-and-time-selecting-block">
			<div class="date-selector-box">
				<label for="start">날짜 선택</label>
				<input type="date" id="start" onchange="handler(event);"/>
			</div>
			<div class="time-selector-box">
				<p>시간 선택</p>
				<div id="timecell">
					<%-- 가능한 예약시간 cell들 동적으로 출력 --%>
				</div>
			</div>

			<%-- 스케일링 포인트 체크 영역 --%>
			<div>
				<div id="pointForm" style="visibility:hidden;">
					<p class="quesetion">스케일링 진료인가요?</p>
					<div style="display:flex; align-items:flex-start;">
						<input type="checkbox" id="usepoint" disabled/>
						<label class="check-label" for="usepoint">네. 그리고 포인트로 미리 결제할게요!<span style="font-size:0.7rem;">(-10,000 포인트)</span></label>
					</div>
					<p id="mypoint">
						잔여 포인트: 
						<fmt:formatNumber type="number" maxFractionDigits="3" value="${point}" />
					</p>
				</div>
			</div>
			<button id="check" class="reservate btn-large-solid btn-disabled" type="button">다음 단계</button>
		</section>
	</main>
	<div class="modal">
		<div class="modal_content" type="text"></div>
	</div>

	<script>
		var gotDiscount = 0; // 0: 할인 X. 1: 스케일링 할인O.
	</script>
    <script>
    //2022-02-02 받아와서 -> db 형식 2022/02/02     시간 비트-> 0 0 0 0 0 0 1 -> 다음페이지 넘어갈때 00000-> 시간 11:00 예약신청버튼 -> 000000111
    		let today = new Date();
    		let today1 = new Date();
    	    document.getElementById('start').min = today.toISOString().substring(0, 10);
    	   	todayFormatHipen= new Date().toISOString().substring(0, 10)
            todayFormat=todayFormatHipen.substr(0,4)+"/"+todayFormatHipen.substr(5,2)+"/"+todayFormatHipen.substr(8,2);
    	   	
    	    //예약 달력 max 한달 후까지만 
    	   	let oneMonthLater = new Date(today.setMonth(today.getMonth()+1));
    	   	
    	   	document.getElementById('start').max = oneMonthLater.toISOString().substring(0, 10);
    	    document.getElementById('start').value = new Date().toISOString().substring(0, 10);
    	   	$("#timecell").html("");
    	   
    	   	var date = document.getElementById('dateSelect').value=todayFormatHipen;
        	const week =['SUNDAY','MONDAY','TUESDAY','WEDNESDAY','THURSDAY','FRIDAY','SATURDAY'];

            document.getElementById('timecell').style.visibility="visible";

            $.ajax({
            	url:'http://localhost:' + ${dendomain} + '/springframework-mini-project-dentist/availablehour/getHour?date=' + todayFormat
            })
         	.done((data) => {
         		time=data.date.split("");
         		console.log(time);
         		 
         		 $.ajax({
                 	url:'http://localhost:' + ${dendomain} + '/springframework-mini-project-dentist/businesshour/getHour?businessday=' + week[today1.getDay()]
                 })
                 .done((data) => {
         			businesstime=data;
         			
					let btime=[];
					for(let k in businesstime){
						if(businesstime.hasOwnProperty(k)){
							btime.push(businesstime[k]);
						}
					}
			    ctime=btime.toString();
			    dtime=ctime.split("");
       			console.log(dtime); //dtime businesshour   --> time, dtime 사용해야함
       			for(var i=0; i<48;i++){
       				var atime =[];
       				var butime=[];
       				if((i*30)%60==0){
           			atime[i]=Math.floor((i*30)/60)+":"+(i*30)%60+"0";
           			butime[i]=Math.floor((i*30)/60)+":"+(i*30)%60+"0";
       				}
       				else if((i*30)%60!=0){
       				atime[i]=Math.floor((i*30)/60)+":"+(i*30)%60;
               		butime[i]=Math.floor((i*30)/60)+":"+(i*30)%60;	
       				}
       				
       				if(time[i]==1 && dtime[i]==1){
       					console.log(butime);
       					var creatediv = document.createElement("button");
       					$("#timecell").append(creatediv);
       					
       					var createdivStyle= `
						   display: flex;
						   justify-content: center;
						   align-items: center;
						   border: var(--card-border);
						   border-radius: 5px;
						   width: 4.5rem;
						   height: 2.5rem;
						   background-color: var(--pale-peach);
						   color: var(--osstem-orange);
						   font-size: 1.1rem;
						   font-weight: 500;
						   margin: 0.3rem;`;
       					creatediv.setAttribute("onclick","btnVisible()")
       					creatediv.setAttribute("class","enabletime")
       					creatediv.setAttribute("style",createdivStyle);
       					creatediv.innerHTML=atime[i];
       					
       				} else if(dtime[i]==1 && time[i]==0){
       					var creatediv = document.createElement("button");
       					creatediv.setAttribute("onclick","btnWarn()")
       					creatediv.setAttribute("id","disabletime")
       					$("#timecell").append(creatediv);
       
       					var createdivStyle= `
							cursor: not-allowed;
							display: flex;
							justify-content: center;
							align-items: center;
							border: 1px solid var(--lighter-gray);
							border-radius: 5px;
							width: 4.5rem;
							height: 2.5rem;
							background-color: var(--lighter-gray);
							color: white;
							font-size: 1.1rem;
							font-weight: 500;
							margin: 0.3rem;
						`;
       					creatediv.setAttribute("style",createdivStyle);
       					creatediv.innerHTML=atime[i];
       				}
         			}	
                 })});
            //클릭시 시간표 변경
            function handler(e){
            	$("#timecell").html("");
            	
                var date = document.getElementById('dateSelect').value=e.target.value;
               	const date2 = new Date(date);
               	dayIndex=date2.getDay();
               	const week =['SUNDAY','MONDAY','TUESDAY','WEDNESDAY','THURSDAY','FRIDAY','SATURDAY'];
               	console.log(week[dayIndex]);
               	
                document.getElementById('timecell').style.visibility="visible";
				console.log('date : ' + date);
				console.log('typeof date : ' + typeof date);
                var aformatDate = date.substr(0,4) + "/" +  date.substr(5,2) + "/" + date.substr(8,2);
                console.log('asformatDate : ' + aformatDate);
                console.log('typeof asformatDate : ' + typeof aformatDate);

                $.ajax({
                	url:'http://localhost:' + ${dendomain} + '/springframework-mini-project-dentist/availablehour/getHour?date=' + aformatDate
                })
             	.done((data) => {
             		time=data.date.split("");
             		console.log(time);
             		 
             		 $.ajax({
                     	url:'http://localhost:' + ${dendomain} + '/springframework-mini-project-dentist/businesshour/getHour?businessday=' + week[dayIndex]
                     })
                     .done((data) => {
             			businesstime=data;
             			
						let btime=[];
						for(let k in businesstime){
							if(businesstime.hasOwnProperty(k)){
								btime.push(businesstime[k]);
							}
						}
				    ctime=btime.toString();
				    dtime=ctime.split("");
           			console.log(dtime); //dtime businesshour   --> time, dtime 사용해야함
           			for(var i=0; i<48;i++){
           				var atime =[];
           				var butime=[];
           				if((i*30)%60==0){
               			atime[i]=Math.floor((i*30)/60)+":"+(i*30)%60+"0";
               			butime[i]=Math.floor((i*30)/60)+":"+(i*30)%60+"0";
           				}
           				else if((i*30)%60!=0){
           				atime[i]=Math.floor((i*30)/60)+":"+(i*30)%60;
                   		butime[i]=Math.floor((i*30)/60)+":"+(i*30)%60;	
           				}
           				
           				if(time[i]==1 && dtime[i]==1){
           					console.log(butime);
           					var creatediv = document.createElement("button");
           					$("#timecell").append(creatediv);
           					
           					var createdivStyle= `
							   display: flex;
							   justify-content: center;
							   align-items: center;
							   border: var(--card-border);
							   border-radius: 5px;
							   width: 4.5rem;
							   height: 2.5rem;
							   background-color: var(--pale-peach);
							   color: var(--osstem-orange);
							   font-size: 1.1rem;
							   font-weight: 500;
							   margin: 0.3rem;`;
           					creatediv.setAttribute("onclick","btnVisible()")
           					creatediv.setAttribute("class","enabletime")
           					creatediv.setAttribute("style",createdivStyle);
           					creatediv.innerHTML=atime[i];
           					
           				} else if(dtime[i]==1 && time[i]==0){
           					var creatediv = document.createElement("button");
           					creatediv.setAttribute("onclick","btnWarn()")
           					creatediv.setAttribute("id","disabletime")
           					$("#timecell").append(creatediv);
           
           					var createdivStyle = `
							   cursor: not-allowed;
							   display: flex;
							   justify-content: center;
							   align-items: center;
							   border: 1px solid var(--lighter-gray);
							   border-radius: 5px;
							   width: 4.5rem;
							   height: 2.5rem;
							   background-color: var(--lighter-gray);
							   color: white;
							   font-size: 1.1rem;
							   font-weight: 500;
							   margin: 0.3rem;`;
           					
           					creatediv.setAttribute("style",createdivStyle);
           					creatediv.innerHTML=atime[i];
           				}
             			}	
                     })})
            }
            function btnVisible(){
            document.getElementById('check').classList.remove("btn-disabled");
            document.getElementById('pointForm').style.visibility="visible";
           	document.getElementById('reservationtime').value= $(event.target).text();
           	
            };
            if(${point}>=10000){
            	 $('#usepoint').removeAttr("disabled");
            	 $(document).ready(function(){
          	    	$("#usepoint").change(function(){
					// let gotDiscount = 0; // 0: 할인 X. 1: 스케일링 할인O.
          	        if($("#usepoint").is(":checked")){       
          	        	document.getElementById("mypoint").innerHTML="잔여 포인트: " + ${point-10000};
						gotDiscount = 1;
          	        }else{
						document.getElementById("mypoint").innerHTML="잔여 포인트: " + ${point};
						gotDiscount = 0;
          	        }
          	    })
          	})};
          	function btnWarn(){
          		$(".modal").fadeIn();
          		$(".modal_content").text("해당 시간은 예약할 수 없습니다.");
          		$(".modal_content").click(function(){
        		$(".modal").fadeOut();
        		}); 
          	}
          	
          	$('.reservate').click(function(event){
				if($(event.target)[0].classList.contains("btn-disabled")) {
					return;
				}
          		reservationtime = document.getElementById('start').value + document.getElementById('reservationtime').value;
          		location.href="${pageContext.request.contextPath}/reservation/afterReservationUsingCalendar?date="+reservationtime + "&dendomain=" + ${dendomain} + "&gotDiscount=" + gotDiscount;
          		
          	});
     </script>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>