<%@ page session="false" language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!-- <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> -->
<!-- <title>Calendar</title> -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style type="text/css">
.calendarForm{

 margin-top:3rem;
}
.cal-schedule{
background-color:orange;
}
.cal_top{
    text-align: center;
    font-size: 30px;
   
}
.cal{
    text-align: center; 
}
table.calendar{
    border: 1px solid lightgrey;
    display: inline-table;
    text-align: left;
}
table.calendar td{
    vertical-align: top;
    border: 1px solid lightgrey;
   	width:3rem;
}

.modal{ 
  position:absolute; width:100%; height:100%; background: rgba(0,0,0,0.8); top:0; left:0; display:none;
}

.modal_content{
  width:400px; height:200px;
  background:#fff; border-radius:10px;
  position:relative; top:30%; left:50%;
  margin-top:-100px; margin-left:-200px;
  text-align:center;
  box-sizing:border-box; padding:74px 0;
  line-height:23px; cursor:pointer;
}
</style>

			<div class="calendarForm">
		    <div class="cal_top">
		        <a href="#" id="movePrevMonth"><span id="prevMonth" class="cal_tit">&lt;</span></a>
		        <span id="cal_top_year"></span>
		        <span id="cal_top_month"></span>
		        <a href="#" id="moveNextMonth"><span id="nextMonth" class="cal_tit">&gt;</span></a>
		    </div>
		    <div id="cal_tab" class="cal">
		    </div>
		    </div>
		    
		    <div class="modal">
			  <div class="modal_content"><h5 id="content">text</h5>
			  </div>
			</div>
	 	</section>
	</div> 

<script type="text/javascript">
    
var today = null;
var year = null;
var month = null;
var firstDay = null;
var lastDay = null;
var $tdDay = null;
var $tdSche = null;
var jsonData = null;
$(document).ready(function() {
    drawCalendar();
    initDate();
    drawDays();
    drawSche();
    $("#movePrevMonth").on("click", function(){movePrevMonth();});
    $("#moveNextMonth").on("click", function(){moveNextMonth();});
});

//Calendar 그리기
function drawCalendar(){
    var setTableHTML = "";
    setTableHTML+='<table class="calendar">';
    setTableHTML+='<tr><th>SUN</th><th>MON</th><th>TUE</th><th>WED</th><th>THU</th><th>FRI</th><th>SAT</th></tr>';
    for(var i=0;i<6;i++){
        setTableHTML+='<tr height="100">';
        for(var j=0;j<7;j++){
            setTableHTML+='<td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap">';
            setTableHTML+='    <div class="cal-day"></div>';
            setTableHTML+='    <div class="cal-schedule"></div>';
            setTableHTML+='</td>';
        }
        setTableHTML+='</tr>';
    }
    setTableHTML+='</table>';
    $("#cal_tab").html(setTableHTML);
}

//날짜 초기화
function initDate(){
    $tdDay = $("td div.cal-day")
    $tdSche = $("td div.cal-schedule")
    dayCount = 0;
    today = new Date();
    year = today.getFullYear();
    month = today.getMonth()+1;
    if(month < 10){month = "0"+month;}
    firstDay = new Date(year,month-1,1);
    lastDay = new Date(year,month,0);
}

//calendar 날짜표시
function drawDays(){
    $("#cal_top_year").text(year);
    $("#cal_top_month").text(month);
    for(var i=firstDay.getDay();i<firstDay.getDay()+lastDay.getDate();i++){
        $tdDay.eq(i).text(++dayCount);
    }
    for(var i=0;i<42;i+=7){
        $tdDay.eq(i).css("color","red");
    }
    for(var i=6;i<42;i+=7){
        $tdDay.eq(i).css("color","blue");
    }
}

//calendar 월 이동
function movePrevMonth(){
    month--;
    if(month<=0){
        month=12;
        year--;
    }
    if(month<10){
        month=String("0"+month);
    }
    getNewInfo();
    }

function moveNextMonth(){
    month++;
    if(month>12){
        month=1;
        year++;
    }
    if(month<10){
        month=String("0"+month);
    }
    getNewInfo();
}

//정보갱신
function getNewInfo(){
    for(var i=0;i<42;i++){
        $tdDay.eq(i).text("");
        $tdSche.eq(i).text("");
    }
    dayCount=0;
    firstDay = new Date(year,month-1,1);
    lastDay = new Date(year,month,0);
    drawDays();
    drawSche();
}
    
   function setData(){
        jsonData = 
       {
            "2022":{
            	"03":{
       				"1":"테스트",
       				"2":"테스트",
       				"3":"테스트",
       				"4":"테스트",
       				"5":"테스트",
       				"6":"테스트",
       				"7":"테스트",
       				"8":"테스트",
       				"9":"테스트",
       				"10":"테스트",
       				"11":"테스트",
       				"12":"테스트",
       				"13":"테스트",
       				"14":"테스트",
       				"15":"테스트",
       				"16":"테스트",
       				"17":"테스트",
       				"18":"테스트",
       				"19":"테스트",
       				"20":"테스트",
       				"21":"테스트",
       				"22":"테스트",
       				"23":"테스트",
       				"24":"테스트",
       				"25":"테스트",
       				"26":"테스트",
       				"27":"테스트",
       				"28":"테스트",
       				"29":"테스트",
       				"30":"테스트",
       				"31":"테스트",
       				
       			},
                "04":{
                	"1":"임플란트",
       				"2":"테스트",
       				"3":"테스트",
       				"4":"테스트",
       				"5":"임플란트",
       				"6":"테스트",
       				"7":"테스트",
       				"8":"테스트",
       				"9":"테스트",
       				"10":"테스트",
       				"11":"테스트",
       				"12":"테스트",
       				"13":"테스트",
       				"14":"테스트",
       				"15":"테스트",
       				"16":"테스트",
       				"17":"테스트",
       				"18":"테스트",
       				"19":"테스트",
       				"20":"테스트",
       				"21":"테스트",
       				"22":"테스트",
       				"23":"테스트",
       				"24":"테스트",
       				"25":"테스트",
       				"26":"테스트",
       				"27":"테스트",
       				"28":"테스트",
       				"29":"테스트",
       				"30":"테스트",
       				"31":"테스트",
       				"32":"테스트",
       				"33":"테스트",
       				"34":"테스트",
       				"35":"테스트",
       				"36":"테스트"
                    
                },
       			"05":{
       				"1":"테스트",
       				"2":"테스트",
       				"3":"테스트",
       				"4":"테스트",
       				"5":"테스트",
       				"6":"테스트",
       				"7":"테스트",
       				"8":"테스트",
       				"9":"테스트",
       				"10":"테스트",
       				"11":"테스트",
       				"12":"테스트",
       				"13":"테스트",
       				"14":"테스트",
       				"15":"테스트",
       				"16":"테스트",
       				"17":"테스트",
       				"18":"테스트",
       				"19":"테스트",
       				"20":"테스트",
       				"21":"테스트",
       				"22":"테스트",
       				"23":"테스트",
       				"24":"테스트",
       				"25":"테스트",
       				"26":"테스트",
       				"27":"테스트",
       				"28":"테스트",
       				"29":"테스트",
       				"30":"테스트",
       				"31":"테스트",
       				"32":"테스트",
       				"33":"테스트",
       				"34":"테스트",
       				"35":"테스트",
       				"36":"테스트"
       				},
       				"06":{
           				"1":"테스트",
           				"2":"테스트",
           				"3":"테스트",
           				"4":"테스트",
           				"5":"테스트",
           				"6":"테스트",
           				"7":"테스트",
           				"8":"테스트",
           				"9":"테스트",
           				"10":"테스트",
           				"11":"테스트",
           				"12":"테스트",
           				"13":"테스트",
           				"14":"테스트",
           				"15":"테스트",
           				"16":"테스트",
           				"17":"테스트",
           				"18":"테스트",
           				"19":"테스트",
           				"20":"테스트",
           				"21":"테스트",
           				"22":"테스트",
           				"23":"테스트",
           				"24":"테스트",
           				"25":"테스트",
           				"26":"테스트",
           				"27":"테스트",
           				"28":"테스트",
           				"29":"테스트",
           				"30":"테스트",
           				"31":"테스트",
           				"32":"테스트",
           				"33":"테스트",
           				"34":"테스트",
           				"35":"테스트",
           				"36":"테스트"
           				},
           				"07":{
               				"1":"테스트",
               				"2":"테스트",
               				"3":"테스트",
               				"4":"테스트",
               				"5":"테스트",
               				"6":"테스트",
               				"7":"테스트",
               				"8":"테스트",
               				"9":"테스트",
               				"10":"테스트",
               				"11":"테스트",
               				"12":"테스트",
               				"13":"테스트",
               				"14":"테스트",
               				"15":"테스트",
               				"16":"테스트",
               				"17":"테스트",
               				"18":"테스트",
               				"19":"테스트",
               				"20":"테스트",
               				"21":"테스트",
               				"22":"테스트",
               				"23":"테스트",
               				"24":"테스트",
               				"25":"테스트",
               				"26":"테스트",
               				"27":"테스트",
               				"28":"테스트",
               				"29":"테스트",
               				"30":"테스트",
               				"31":"테스트",
               				"32":"테스트",
               				"33":"테스트",
               				"34":"테스트",
               				"35":"테스트",
               				"36":"테스트"
               				},
               				"08":{
                   				"1":"테스트",
                   				"2":"테스트",
                   				"3":"테스트",
                   				"4":"테스트",
                   				"5":"테스트",
                   				"6":"테스트",
                   				"7":"테스트",
                   				"8":"테스트",
                   				"9":"테스트",
                   				"10":"테스트",
                   				"11":"테스트",
                   				"12":"테스트",
                   				"13":"테스트",
                   				"14":"테스트",
                   				"15":"테스트",
                   				"16":"테스트",
                   				"17":"테스트",
                   				"18":"테스트",
                   				"19":"테스트",
                   				"20":"테스트",
                   				"21":"테스트",
                   				"22":"테스트",
                   				"23":"테스트",
                   				"24":"테스트",
                   				"25":"테스트",
                   				"26":"테스트",
                   				"27":"테스트",
                   				"28":"테스트",
                   				"29":"테스트",
                   				"30":"테스트",
                   				"31":"테스트",
                   				"32":"테스트",
                   				"33":"테스트",
                   				"34":"테스트",
                   				"35":"테스트",
                   				"36":"테스트"
                   				},
                   				"09":{
                       				"1":"테스트",
                       				"2":"테스트",
                       				"3":"테스트",
                       				"4":"테스트",
                       				"5":"테스트",
                       				"6":"테스트",
                       				"7":"테스트",
                       				"8":"테스트",
                       				"9":"테스트",
                       				"10":"테스트",
                       				"11":"테스트",
                       				"12":"테스트",
                       				"13":"테스트",
                       				"14":"테스트",
                       				"15":"테스트",
                       				"16":"테스트",
                       				"17":"테스트",
                       				"18":"테스트",
                       				"19":"테스트",
                       				"20":"테스트",
                       				"21":"테스트",
                       				"22":"테스트",
                       				"23":"테스트",
                       				"24":"테스트",
                       				"25":"테스트",
                       				"26":"테스트",
                       				"27":"테스트",
                       				"28":"테스트",
                       				"29":"테스트",
                       				"30":"테스트",
                       				"31":"테스트",
                       				"32":"테스트",
                       				"33":"테스트",
                       				"34":"테스트",
                       				"35":"테스트",
                       				"36":"테스트"
                       				},
                       				"10":{
                           				"1":"테스트",
                           				"2":"테스트",
                           				"3":"테스트",
                           				"4":"테스트",
                           				"5":"테스트",
                           				"6":"테스트",
                           				"7":"테스트",
                           				"8":"테스트",
                           				"9":"테스트",
                           				"10":"테스트",
                           				"11":"테스트",
                           				"12":"테스트",
                           				"13":"테스트",
                           				"14":"테스트",
                           				"15":"테스트",
                           				"16":"테스트",
                           				"17":"테스트",
                           				"18":"테스트",
                           				"19":"테스트",
                           				"20":"테스트",
                           				"21":"테스트",
                           				"22":"테스트",
                           				"23":"테스트",
                           				"24":"테스트",
                           				"25":"테스트",
                           				"26":"테스트",
                           				"27":"테스트",
                           				"28":"테스트",
                           				"29":"테스트",
                           				"30":"테스트",
                           				"31":"테스트",
                           				"32":"테스트",
                           				"33":"테스트",
                           				"34":"테스트",
                           				"35":"테스트",
                           				"36":"테스트"
                           				},
                           				"11":{
                               				"1":"테스트",
                               				"2":"테스트",
                               				"3":"테스트",
                               				"4":"테스트",
                               				"5":"테스트",
                               				"6":"테스트",
                               				"7":"테스트",
                               				"8":"테스트",
                               				"9":"테스트",
                               				"10":"테스트",
                               				"11":"테스트",
                               				"12":"테스트",
                               				"13":"테스트",
                               				"14":"테스트",
                               				"15":"테스트",
                               				"16":"테스트",
                               				"17":"테스트",
                               				"18":"테스트",
                               				"19":"테스트",
                               				"20":"테스트",
                               				"21":"테스트",
                               				"22":"테스트",
                               				"23":"테스트",
                               				"24":"테스트",
                               				"25":"테스트",
                               				"26":"테스트",
                               				"27":"테스트",
                               				"28":"테스트",
                               				"29":"테스트",
                               				"30":"테스트",
                               				"31":"테스트",
                               				"32":"테스트",
                               				"33":"테스트",
                               				"34":"테스트",
                               				"35":"테스트",
                               				"36":"테스트"
                               				}
                
            }
        } 
   }
   function drawSche(){
       setData();
       var dateMatch = null;
       for(var i=firstDay.getDay();i<firstDay.getDay()+lastDay.getDate();i++){
           var txt = "";
           txt =jsonData[year];
           if(txt){
               txt = jsonData[year][month];
               if(txt){
                   txt = jsonData[year][month][i];
                   dateMatch = firstDay.getDay() + i -1; 
                   $tdSche.eq(dateMatch).text(txt);
               }
           }
       }
   }
	
    
    
    $(this).on("click", function() {
    	 setData();
    	 var txt="";
    		 txt =jsonData[year];
         if(txt){
             txt = jsonData[year][month];
             if(txt){
    	 for(var i=firstDay.getDay();i<firstDay.getDay()+lastDay.getDate();i++){
    	 txt=jsonData[year][month][i];
    	 
    	 console.log(JSON.stringify(txt));
    	 $(".modal").fadeIn();
		 	
		 $("#content").text(JSON.stringify(txt));
    	
    	 }}}});
  		//모달 클릭시 사라짐
  		$(".modal_content").click(function(){
   		    $(".modal").fadeOut();
  		});
  		
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
