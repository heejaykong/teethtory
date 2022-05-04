<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/common/meta.jsp" %>
	
	<title>치스토리-진료 예약하기</title>
	
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<style>
	#cellbutton{
	    display: flex;
	}
	#top{
	    font: 1.2rem 'Fira Sans', sans-serif;   
	}  
	#bottom{
	      flex-direction : column;
	      margin-top:5rem;
	}        
	#timecell{
	justify-content: center;
	height:10rem;
	text-align:center;
	}
	.cell {
	    border: 1px solid #BDBDBD;
	    background-color: rgb(237, 251, 220);
	    cursor: pointer;
	    
	    width:4rem;
	    height:2rem;
	    text-align: center;
	    margin-left: 0.5rem;
	    border-radius: 1rem;
	    text-align: center;
	    margin-top:1rem;
	}
	.cell:hover {
	    border: 1px solid #ffa048;
	}
	.cell.select {
	    background-color: #ffa048;
	    color: #fff;
	}
	label {
	    font: 1rem 'Fira Sans', sans-serif;   
	}
	#pointForm{
	   display:flex;
	   flex-direction: row;
	}
	#usepoint{
	    zoom:2.0;
	}
	#dateSelect{
	    width:8rem;
	}
	#check{
	    width:95%;
	    height:3rem;
	    border-radius: 1rem;
	}
	#check:enabled{
	   background-color:  #ffa048;
	}
	#timeclick{
		font-size:15px;
	}
	#timeForm{
	    margin-top:3rem;
	}
	.fa-calendar-day{
	   color:  #ffa048;
	}
	.fa-clock{
	    color:#ffa048;
	}
	#top{
	    align-items: start;
	}
	#enabletime{
	
	justify-content:center;
	text-align:center;
	 align-items : center;
	}
	.modal{ 
  position:absolute; width:100%; height:100%; background: rgba(0,0,0,0.8); top:0; left:0; display:none;
}
.modal_content{
  border:2px solid orange;
  width:400px; height:200px;
  background:#fff; border-radius:10px;
  position:relative; top:30%; left:50%;
  margin-top:-100px; margin-left:-200px;
  text-align:center;
  box-sizing:border-box; padding:74px 0;
  line-height:23px; cursor:pointer;
}
#enabletime:active {
  color: green;
  border: 3px solid green;
}

	
	</style>	
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>


      <div id="all">
        <div class="container" id="top" style="margin-bottom:2rem;">진료 예약하기</div>
        <div id="top-a" style="display:inline; margin-left:1rem;">
              <i class="fa-solid fa-calendar-day"></i>
          <input id="dateSelect" value="날짜" style="margin-top:10px; border:0px solid black" ></input>

              <i class="fa-solid fa-clock"></i>
          <input type="text" id="reservationtime" value="-- : --" style="margin-top:1rem; border:0px solid black; "/>
        </div>

          <div class="container" id="bottom">
                  <div style="flex-grow:1; margin-top:2rem;">
                      <div style="margin-top:10px;">
                          <div style="margin-bottom:1rem;">날짜 선택</div>
                      <input type="date" id="start" min="2022-05-03" onchange="handler(event);"/>

                      </div>
                  </div>

                  <div style="flex-grow:1;">
                      <div>

                      </div>

                      <div>
                          <div id="timeForm">

                              <div id="timeSelect"> 
                              <p id="timeclick">시간 선택</p>

                              </div>

                                   <div id="timecell" class="container row">
                              </div>

                          </div>

                      </div>
                  </div>
                 
                  <div style="flex-grow:1; margin-top:6rem;"> 
                   <hr>
                     <div>스케일링 진료인가요?</div>
                      <div id="pointForm" style="visibility:hidden; margin-top:2rem;" class="container">
                       
                          <div>
                          <input type="checkbox" id="usepoint"/>
                          </div>
                         <div>
                          <label for="usepoint">네. 그리고 포인트로 미리 결제할게요!</label>
                          <p>(-10,000point)</p>
                          <p>잔여 포인트 (5,000point)</p>
                          </div>

                      </div>
                       <button id="check" class="reservate" type="button" style="visibility:hidden; margin-top:1rem;">다음 단계</button>

                  </div>
          </div>
      </div>
      <div class="modal">
	  <div class="modal_content" type="text"></div>
	  </div>
	 	</section>
	</div> 

    <script>
    //2022-02-02 받아와서 -> db 형식 2022/02/02     시간 비트-> 0 0 0 0 0 0 1 -> 다음페이지 넘어갈때 00000-> 시간 11:00 예약신청버튼 -> 000000111
    		
    		document.getElementById('start').min=new Date().toISOString().substring(0, 10);
    		
            document.getElementById('start').value = new Date().toISOString().substring(0, 10);
            
            function handler(e){
            	$("#timecell").html("");
            	
                var date = document.getElementById('dateSelect').value=e.target.value;
               	const date2 = new Date(date);
               	dayIndex=date2.getDay();
               	const week =['SUNDAY','MONDAY','TUESDAY','WEDNESDAY','THURSDAY','FRIDAY','SATURDAY'];
               	console.log(week[dayIndex]);
               	
                document.getElementById('timecell').style.visibility="visible";
               	
                var aformatDate = date.substr(0,4) + "/" +  date.substr(5,2) + "/" + date.substr(8,2);
                /* console.log(aformatDate); */
                console.log(aformatDate);
                $.ajax({
                	url:"http://localhost:8082/springframework-mini-project-dentist/availablehour/getHour?date=" + aformatDate
                })
             	.done((data) => {
             		 time=data.date.split("");
             		/*  console.log(time); */
             		 
             		 $.ajax({
                     	url:"http://localhost:8082/springframework-mini-project-dentist/businesshour/getHour?businessday=" + week[dayIndex]
                     })
                     .done((data) => {
             			businesstime=data;
             			
             			/* console.log(businesstime); */
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
           					/* 
           					creatediv.setAttribute("class",""); */
           					
           					var createdivStyle= "width:4.25rem; height:2rem; background-color: rgb(237, 251, 220); display:flex; flex-direction:row; margin-top:1rem; margin-left:0.5rem; border:1px solid lightgrey; border-radius:0.5rem;";
           					creatediv.setAttribute("onclick","btnVisible()")
           					creatediv.setAttribute("id","enabletime")
           					creatediv.setAttribute("style",createdivStyle);
           					creatediv.innerHTML=atime[i];
           					
           				}else if(dtime[i]==1 && time[i]==0){
           					var creatediv = document.createElement("button");
           					creatediv.setAttribute("onclick","btnWarn()")
           					creatediv.setAttribute("id","disabletime")
           					$("#timecell").append(creatediv);
           					/* 
           					creatediv.setAttribute("class",""); */
           					
           					var createdivStyle= "width:4.25rem; text-decoration:none; color:white; align-items:center;justify-content:center;height:2rem; background-color: grey; display:flex; flex-direction:row; margin-top:1rem; margin-left:0.5rem; border:1px solid lightgrey; border-radius:0.5rem;";
           					
           					creatediv.setAttribute("style",createdivStyle);
           					creatediv.innerHTML=atime[i];
           				}
             			}	
                     })})
            }
           /*  $('.cell').click(function(){
         	    var cell_time_check = $(this).attr("id");
         	});
            $('.cell').click(function(){
           		document.getElementById('reservationtime').value = $(this).text();
           	
            $('.cell').removeClass('select');
            $(this).addClass('select');
            */
            function btnVisible(){
            document.getElementById('check').style.visibility="visible";
            document.getElementById('pointForm').style.visibility="visible";
           	document.getElementById('reservationtime').value= $(event.target).text();
           	
            };
            
          	function btnWarn(){
          		
          		$(".modal").fadeIn();
          		$(".modal_content").text("해당 시간은 예약할 수 없습니다.");
          		$(".modal_content").click(function(){
        		$(".modal").fadeOut();
        		}); 
          	}
          	$('.reservate').click(function(){
          		
          		reservationtime = document.getElementById('start').value+document.getElementById('reservationtime').value;
          		location.href="${pageContext.request.contextPath}/reservation/afterReservationUsingCalendar?date="+reservationtime;
          	});
     </script>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>