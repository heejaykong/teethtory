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
    <title>Document</title>
    <style>
    
.container{
            display: flex;

}
        

#timecell{

justify-content: center;

height:180px;
border-radius:20px;
	border:1px solid green;



}
#point{

/* border: 1px solid lightgrey; */



}
#dateSelect{

/* border: 1px solid lightgrey; */
justify-content: center;

}
#timeSelect{

border-radius:20px;
	border:1px solid green;
text-align: center;
}
#pointForm{

/* border: 1px solid lightgrey; */

}

.cell {
    border: 1px solid #BDBDBD;
    background-color: rgb(237, 251, 220);
    cursor: pointer;
    
    width:104px;
    height:30px;
    text-align: center;
    margin-left: 10px;
   	margin-top:5px;
    text-align: center;
    border-radius:30px;
}

.cell:hover {
    border: 1px solid #ffa048;
}

.cell.select {
    background-color: #ffa048;
    color: #fff;
}

label {
    display: block;
    font: 1rem 'Fira Sans', sans-serif;
    
}
#timeForm{
    text-align: center;
}


/* input,
label {
    margin: .4rem 0;
} */
#usepoint{
    zoom:2.0;
}
#dateSelect{
    width:150px;
    text-align: center;
    border-radius:20px;
	border:1px solid green;
   
}
#reservationtime{
width:100%;
border: 1px solid green;
text-align:center;
   
}
#check{
    margin-top:240px;
    width:100%;
    height:100px;
    border-radius:20px;
	border:1px solid green;
    }
#start{
	width:100%;
	border-radius:20px;
	border:1px solid green;
	text-align:center;
	
}

#check:enabled{
    background-color: green;
}
#timeclick{
	font-size:15px;
	
}


    </style>
</head>
<body>
<div id="all">
    <div class="container">
            <div style="flex-grow:2; border:1px solid green; border-radius:20px">
                <div>
                   
                <input type="date" id="start" onchange="handler(event);"/>
                </div>
            </div>
            


            <div style="flex-grow:1; border:1px solid green;border-radius:20px">
                <div>
                    
                </div>

                <div>
                    <div id="timeForm">
                        <input id="dateSelect" value="날짜"></input>
                        <div id="timeSelect"> 
                        <p id="timeclick">예약 시간을 선택해주세요.</p>
                       
                        </div>
                        
                        <div id="timecell" style="visibility:hidden">
                            <div class="container row text-center mx-0">
                                <div class="item col-md-3 col-5 my-1 px-2">
                                    <div id="cc"class="cell py-1">9:00</div>
                                </div>
                                <div class="item col-md-3 col-5 my-1 px-2">
                                    <div id="cc"class="cell py-1">9:30</div>
                                </div>
                                
                                <div class="item col-md-3 col-5 my-1 px-2">
                                    <div id="cc"class="cell py-1">10:00</div>
                                </div>
                                <div class="item col-md-3 col-5 my-1 px-2">
                                    <div id="cc"class="cell py-1">10:30</div>
                                </div>
                            </div>
                            <div class="container row text-center mx-0">
                                <div class="item col-md-3 col-5 my-1 px-2">
                                    <div id="cc"class="cell py-1">11:00</div>
                                </div>
                                <div class="item col-md-3 col-5 my-1 px-2">
                                    <div id="cc"class="cell py-1">11:30</div>
                                </div>
                                
                                <div class="item col-md-3 col-5 my-1 px-2">
                                    <div id="cc"class="cell py-1">12:00</div>
                                </div>
                                <div class="item col-md-3 col-5 my-1 px-2">
                                    <div id="cc"class="cell py-1">12:30</div>
                                </div>
                            </div>
                            <div class="container row text-center mx-0">
                                <div class="item col-md-3 col-5 my-1 px-2">
                                    <div id="cc"class="cell py-1">1:00</div>
                                </div>
                                <div class="item col-md-3 col-5 my-1 px-2">
                                    <div id="cc"class="cell py-1">1:30</div>
                                </div>
                                
                               <div class="item col-md-3 col-5 my-1 px-2">
                                    <div id="cc"class="cell py-1">2:00</div>
                                </div>
                                <div class="item col-md-3 col-5 my-1 px-2">
                                    <div id="cc"class="cell py-1">2:30</div>
                                </div>
                            </div>
                            <div class="container row text-center mx-0">
                               <div class="item col-md-3 col-5 my-1 px-2">
                                    <div id="cc"class="cell py-1">3:00</div>
                                </div>
                                <div class="item col-md-3 col-5 my-1 px-2">
                                    <div id="cc"class="cell py-1" id="celltime">3:30</div>
                                </div>
                                <div class="item col-md-3 col-5 my-1 px-2">
                                    <div id="cc"class="cell py-1" type="text">4:00</div>
                                </div>
                                <div class="item col-md-3 col-5 my-1 px-2">
                                    <!-- <div class="cell py-1" type="button" onclick="input_time(t)" value="gd">4:30</div> -->
                                    <div id="cc"class="cell py-1" type="text">4:30</div>
                                </div>
                            </div>
                        </div>
                        <div id="pointForm" style="visibility:hidden; margin-top:15px;">
                            <input type="checkbox" id="usepoint">
                            <label for="usepoint">포인트로 스케일링 할인 (-10,000point)</label>
                            <p>잔여 포인트 (5,000point)</p>
        
                        </div>
                    </div>

                </div>
            </div>
            <div style="flex-grow:1; border:1px solid green; border-radius:20px">
                 <input type="text" id="reservationtime" value="예약 시간(시간값 들어가야함)"style="border-radius:20px"/>
                
                 <button id="check" class="reservate" type="button" disabled>예약하기</button>
                 
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
           	document.getElementById('reservationtime').value=$('#cc').text();
           	
            $('.cell').removeClass('select');
            $(this).addClass('select');
            document.getElementById('pointForm').style.visibility="visible";
           	
            document.getElementById('check').disabled=false;
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