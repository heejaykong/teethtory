<%@ page session="false" language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="/WEB-INF/views/common/header.jsp" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://kit.fontawesome.com/d9e341abda.js" crossorigin="anonymous"></script>
    <title>Document</title>
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
   
    width: 22.5rem;
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
                        
                             <div id="timecell">
                            <div id="cellbutton" class="container row text-center mx-0">
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
                                    <!-- <div class="cell py-1" type="button" onclick="input_time(t)" value="gd">4:30</div> -->
                                    <div id="cc"class="cell py-1">4:30</div>
                                </div>
                            </div>
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
                 <button id="check" class="reservate" type="button" style="visibility:hidden" onclick="location.href='${pageContext.request.contextPath}/reservation/AfterReservationUsingCalendar'">다음 단계</button>
                 
            </div>
    </div>
</div>

    <script>
             document.getElementById('start').value = new Date().toISOString().substring(0, 10);
            
            function handler(e){
               
                document.getElementById('dateSelect').value=e.target.value;
                document.getElementById('timecell').style.visibility="visible";
            }

            $('.cell').click(function(){
         	    var cell_time_check = $(this).attr("id");
         	});
			
            $('.cell').click(function(){
           		document.getElementById('reservationtime').value = $(this).text();
           	
            $('.cell').removeClass('select');
            $(this).addClass('select');
            document.getElementById('pointForm').style.visibility="visible";
           	
            document.getElementById('check').style.visibility="visible";
            });
           /* $('#test').click(function(){
            
            document.getElementById('reservationtime').value=document.getElementById('test').value
           });
               */
          	$('.reservate').click(function(){
          		alert(document.getElementById('start').value+" "+document.getElementById('reservationtime').value+" 예약 완료");
          	});
     </script>
</body>
</html>





<%@ include file="/WEB-INF/views/common/footer.jsp" %>
