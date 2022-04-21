<%@ page session="false" language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Calendar</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style type="text/css">
.container{
flex-direction: row;
	justify-content:center;
}
#timecell{

    width:40%;
    border: 1px solid lightgrey;
    float:right;
    margin-right:80px;
	
}
#point{
    width:40%;
    border: 1px solid lightgrey;
    float:right;
    margin-right:80px;
    height:60px;
   
}
#dateSelect{
    width:40%;
    border: 1px solid lightgrey;
    float:right;
    margin-right:80px;
    margin-top:50px;
    height:60px;
    
}
#timeSelect{
    width:40%;
    border: 1px solid lightgrey;
    float:right;
    margin-right:80px;
    height:60px;
    
}
#pointForm{
    width:40%;
    border: 1px solid lightgrey;
    float:right;
    margin-right:80px;
    height:60px;
    
}
#calendarForm{
	margin-top:50px;
    border:1px solid black;
    width:40%;
    float:left;
    margin-left:80px;
}
.btn{
	justf
}

/* #can{
    border:1px solid lightgrey
}
#date{
    border:1px solid lightgrey
} */
.custom_calendar_table{
    text-align: center;
    height:399px;
}
.custom_calendar_table thead.cal_date th {
    font-size: 1.5rem;
   
}
.custom_calendar_table thead.cal_date th button {
    font-size: 1.5rem;
    background: none;
    border: none;   
}
/* 요일 */
.custom_calendar_table thead.cal_week th {
    
    
   
}
/* 각날짜틀 */
.custom_calendar_table tbody td {
    cursor: pointer;
    text-align:center;
}
.custom_calendar_table{
    border : 1px solid lightgrey;
    width:100%;
}
/* 일요일 글씨 */
.custom_calendar_table tbody td:nth-child(1) {
    color: red;  
}
/* 토요일 글씨 */
.custom_calendar_table tbody td:nth-child(7) {
    color: blue;

    
}

/* 날짜 선택시 */
.custom_calendar_table tbody td.select_day {
    background-color: #ffa048;
    color: #fff;
   
  
   
}
.custom_calendar_table tbody td.select_time {
    background-color: #ffa048;
    color: #fff;
    border-radius : 50px;
}


.cell {
    border: 1px solid #BDBDBD;
    background-color: rgb(237, 251, 220);
    cursor: pointer;
}

.cell:hover {
    border: 1px solid #ffa048;
}

.cell.select {
    background-color: #ffa048;
    color: #fff;
}
</style>
</head>
<body>
    <div id="calendarForm" ></div>
    
    <div id="timeForm">
        <div id="dateSelect">날짜 2022. 4. 14. (목)</div>
        <div id="timeSelect"> 
        <p id="timeclick">시간 시간을 선택해주세요.</p>
       
        </div>
        
        <div id="timecell">
            <div class="container row text-center mx-0">
                <div class="item col-md-3 col-5 my-1 px-2">
                    <div class="cell py-1">9:00</div>
                </div>
                <div class="item col-md-3 col-5 my-1 px-2">
                    <div class="cell py-1">9:30</div>
                </div>
                
                <div class="item col-md-3 col-5 my-1 px-2">
                    <div class="cell py-1">10:00</div>
                </div>
                <div class="item col-md-3 col-5 my-1 px-2">
                    <div class="cell py-1">10:30</div>
                </div>
            </div>
            <div class="container row text-center mx-0">
                <div class="item col-md-3 col-5 my-1 px-2">
                    <div class="cell py-1">11:00</div>
                </div>
                <div class="item col-md-3 col-5 my-1 px-2">
                    <div class="cell py-1">11:30</div>
                </div>
                
                <div class="item col-md-3 col-5 my-1 px-2">
                    <div class="cell py-1">12:00</div>
                </div>
                <div class="item col-md-3 col-5 my-1 px-2">
                    <div class="cell py-1">12:30</div>
                </div>
            </div>
            <div class="container row text-center mx-0">
                <div class="item col-md-3 col-5 my-1 px-2">
                    <div class="cell py-1">1:00</div>
                </div>
                <div class="item col-md-3 col-5 my-1 px-2">
                    <div class="cell py-1">1:30</div>
                </div>
                
               <div class="item col-md-3 col-5 my-1 px-2">
                    <div class="cell py-1">2:00</div>
                </div>
                <div class="item col-md-3 col-5 my-1 px-2">
                    <div class="cell py-1">2:30</div>
                </div>
            </div>
            <div class="container row text-center mx-0">
               <div class="item col-md-3 col-5 my-1 px-2">
                    <div class="cell py-1">3:00</div>
                </div>
                <div class="item col-md-3 col-5 my-1 px-2">
                    <div class="cell py-1">3:30</div>
                </div>
                <div class="item col-md-3 col-5 my-1 px-2">
                    <div class="cell py-1">4:00</div>
                </div>
                <div class="item col-md-3 col-5 my-1 px-2">
                    <div class="cell py-1">4:30</div>
                </div>
            </div>
        </div>
        <div id="pointForm">
            <input type="checkbox" id="usepoint">
            <label for="usepoint">포인트로 스케일링 할인 (-10,000point)</label>
            <p>잔여 포인트 (5,000point)</p>
             <div class="btn btn-success">예약</div>
        </div>
        
       
        
    </div>



<script type="text/javascript">
    
(function () {
    calendarMaker($("#calendarForm"), new Date());
})();

var nowDate = new Date();
function calendarMaker(target, date) {
    if (date == null || date == undefined) {
        date = new Date();
    }
    nowDate = date;
    if ($(target).length > 0) {
        var year = nowDate.getFullYear();
        var month = nowDate.getMonth() + 1;
        $(target).empty().append(assembly(year, month));
    } else {
        console.error("");
        return;
    }

    var thisMonth = new Date(nowDate.getFullYear(), nowDate.getMonth(), 1);
    var thisLastDay = new Date(nowDate.getFullYear(), nowDate.getMonth() + 1, 0);


    var tag = "<tr>";
    var cnt = 0;
    //빈 공백 만들어주기
    for (i = 0; i < thisMonth.getDay(); i++) {
        tag += "<td></td>";
        cnt++;
    }
	/* document.getElementById('timeclick').innerHTML="09:00"; */
    //날짜 채우기
    for (i = 1; i <= thisLastDay.getDate(); i++) {
        if (cnt % 7 == 0) { tag += "<tr>"; }

        tag += "<td>" + i + "</td>";
        cnt++;
        if (cnt % 7 == 0) {
            tag += "</tr>";
        }
    }
    $(target).find("#custom_set_date").append(tag);
    calMoveEvtFn();
    function calMoveEvtFn() {
        //전달 클릭
        $(".custom_calendar_table").on("click", ".prev", function () {
            nowDate = new Date(nowDate.getFullYear(), nowDate.getMonth() - 1, nowDate.getDate());
            calendarMaker($(target), nowDate);
        });
        //다음날 클릭
        $(".custom_calendar_table").on("click", ".next", function () {
            nowDate = new Date(nowDate.getFullYear(), nowDate.getMonth() + 1, nowDate.getDate());
            calendarMaker($(target), nowDate);
        });
        //일자 선택 클릭
        $(".custom_calendar_table").on("click", "td", function () {
            $(".custom_calendar_table .select_day").removeClass("select_day");
            $(this).removeClass("select_day").addClass("select_day");
        });
        $('.cell').click(function(){
            $('.cell').removeClass('select');
            $(this).addClass('select');
            });
        $('.cell').click(function(){
               time = $('.cell').text();
               
                });   
        
    }   
}
	
    function assembly(year, month) {
        var calendar_html_code =
            "<table class='custom_calendar_table'>" +
            "<colgroup>" +
            "<col style='width:81px'/>" +
            "<col style='width:81px'/>" +
            "<col style='width:81px'/>" +
            "<col style='width:81px'/>" +
            "<col style='width:81px'/>" +
            "<col style='width:81px'/>" +
            "<col style='width:81px'/>" +
            "</colgroup>" +
            "<thead class='cal_date'>" +
            "<th><button type='button' class='prev'><</button></th>" + 
            "<th colspan='5'><p><span>" + year + "</span>년 <span>" + month + "</span>월</p></th>" +
            "<th><button type='button' class='next'>></button></th>" +
            "</thead>" +
            "<thead  class='cal_week'>" +
            "<th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>" +
            "</thead>" +
            "<tbody id='custom_set_date'>" +
            "</tbody>" +
            "</table>" 
            ;
        return calendar_html_code;
    }
</script>
</body>
</html>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>