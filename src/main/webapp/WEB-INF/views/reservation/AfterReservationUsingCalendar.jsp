<%@ page session="false" language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="/WEB-INF/views/common/header.jsp" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/d9e341abda.js" crossorigin="anonymous"></script>
    <title>Document</title>
    <style>
#submit{
    background-color:  #ffa048;
    width:340px;
    height:70px;
    border-radius:20px;
    text-decoration: none;
    color:white;
    margin-top:20px;
}
#reservation{
    margin-left:13px;
    width:310px;
    height:100px;
    margin-top: 10px;
}
.container{
    display: flex;
    flex-direction: row;
    margin-top:20px;
}


    </style>
</head>

<body>
   <div class="container" id="top">
        <div>
            <div style="margin-top:20px; font-weight:bold;">Ant 치과 진료예약</div>
            <div style="margin-top:20px; text-decoration: none; color: rgb(222, 149, 13); font-weight:bold;">05.01(금)09:00</div>
        </div>
        <div>
            <div style="border:1px solid black; margin-top:20px; margin-left:150px; width:80px;height:50px;">이미지</div>
        </div>   
   </div>


   <div>
        <div style="margin-top:80px; text-decoration: none; color:grey;">예약자 정보</div>
        <div>
            <div>
                <div style="margin-top:20px;">이름  <input style="margin-top:20px; margin-left: 30px; border:0px solid black;" type="text" placeholder="이름을 입력하세요."></div>
               
                
                
            </div>
            <div>
                <div style="margin-top:20px;">연락처  <input style="margin-top:20px; margin-left: 15px;border:0px solid black;" type="text" placeholder="연락처를 입력하세요."></div>
            
                
            </div>
        </div>
   </div>






    <div>
        <div style="margin-top:40px;">예약 사유</div>
        <input id="reservation" type="text" placeholder="진료를 예약하는 이유를 적어주세요(증상, 희망 진료 등)" style="border:0.5px solid lightgrey;">
    </div>
    <div>
        <button id="submit" type="button" style="border: 0px solid black;">예약 신청하기</button>
    </div>


</body>
</html>




<%@ include file="/WEB-INF/views/common/footer.jsp" %>