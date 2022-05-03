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
	    margin-top:5rem;
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
                      <input type="date" id="start" onchange="handler(event);"/>

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
                                 <!-- <div id="cellbutton" class="container row text-center mx-0">
                                  <div class="item">
                                          <div id="cc"class="cell py-1">9:00</div>
                                      </div>
                                      <div class="item">
                                          <div id="cc"class="cell py-1">9:30</div>
                                      </div>

                                      <div class="item">
                                          <div id="cc"class="cell py-1">10:00</div>
                                      </div>
                                      <div class="item">
                                          <div id="cc"class="cell py-1">10:30</div>
                                      </div>
                                  </div>
                                  <div id="cellbutton" class="container row text-center mx-0">
                                      <div class="item">
                                          <div id="cc"class="cell py-1">11:00</div>
                                      </div>
                                      <div class="item">
                                          <div id="cc"class="cell py-1">11:30</div>
                                      </div>

                                      <div class="item">
                                          <div id="cc"class="cell py-1">12:00</div>
                                      </div>
                                      <div class="item">
                                          <div id="cc"class="cell py-1">12:30</div>
                                      </div>
                                  </div>
                                  <div id="cellbutton" class="container row text-center mx-0">
                                      <div class="item">
                                          <div id="cc"class="cell py-1">1:00</div>
                                      </div>
                                      <div class="item">
                                          <div id="cc"class="cell py-1">1:30</div>
                                      </div>

                                     <div class="item">
                                          <div id="cc"class="cell py-1">2:00</div>
                                      </div>
                                      <div class="item">
                                          <div id="cc"class="cell py-1">2:30</div>
                                      </div>
                                  </div>
                                  <div id="cellbutton" class="container row text-center mx-0">
                                     <div class="item">
                                          <div id="cc"class="cell py-1">3:00</div>
                                      </div>
                                      <div class="item">
                                          <div id="cc"class="cell py-1">3:30</div>
                                      </div>
                                      <div class="item">
                                          <div id="cc"class="cell py-1">4:00</div>
                                      </div>
                                      <div class="item">
                                         
                                          <div id="cc"class="cell py-1">4:30</div>
                                      </div> 
                                  </div> -->
                              </div>

                          </div>

                      </div>
                  </div>
                  <div style="flex-grow:1; margin-top:4.5rem;"> 
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
	 	</section>
	</div> 

    <script>
    		
    		
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
             					var creatediv = document.createElement("div");
             					$("#timecell").append(creatediv);
             					/* 
             					creatediv.setAttribute("class",""); */
             					
             					var createdivStyle= "width:4rem; height:1.5rem; text-align:center; background-color: rgb(237, 251, 220); display:flex; flex-direction:row; margin-top:1rem; margin-left:0.5rem; border:1px solid lightgrey; border-radius:0.5rem;";
             					creatediv.setAttribute("onclick","btnVisible()")
             					creatediv.setAttribute("id","enabletime")
             					creatediv.setAttribute("style",createdivStyle);
             					creatediv.innerHTML=atime[i];
             					
             				}else if(dtime[i]==1 && time[i]==0){
             					var creatediv = document.createElement("div");
             					$("#timecell").append(creatediv);
             					/* 
             					creatediv.setAttribute("class",""); */
             					
             					var createdivStyle= "width:4rem; height:1.5rem; text-align:center; background-color: grey; display:flex; flex-direction:row; margin-top:1rem; margin-left:0.5rem; border:1px solid lightgrey; border-radius:0.5rem;";
             					
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
            
           /* $('#test').click(function(){
            
            document.getElementById('reservationtime').value=document.getElementById('test').value
           });
               */
            
          	$('.reservate').click(function(){
          		
          		reservationtime = document.getElementById('start').value+document.getElementById('reservationtime').value;
          		
          		location.href="${pageContext.request.contextPath}/reservation/afterReservationUsingCalendar?date="+reservationtime;
          	});
     </script>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>