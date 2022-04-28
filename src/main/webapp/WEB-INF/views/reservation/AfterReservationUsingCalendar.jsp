<%@ page session="false" language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <script src="https://kit.fontawesome.com/d9e341abda.js" crossorigin="anonymous"></script>
    <style>
#submit{
     color: white;
        background-color: #f47d36;
        border-color: #f47d36;
        width:90%;
		height:3rem;
		border-radius:1rem;
		margin-left:1rem;
}
#reservation{
    margin-left:13px;
    width:22rem;
    height:5rem;
    margin-top: 10px;
}
.container{
    display: flex;
    flex-direction: row;
    margin-top:20px;
}
    </style>

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
        <div style="margin-top:80px; text-decoration: none; color:grey; margin-left:1rem;">예약자 정보</div>
        <div>
            <div>
                <div style="margin-top:20px; margin-left:1rem;">이름  <input style="margin-top:20px; margin-left: 30px; border:0px solid black;" type="text" placeholder="이름을 입력하세요."></div>
               
                
                
            </div>
            <div>
                <div style="margin-top:20px; margin-left:1rem;">연락처  <input style="margin-top:20px; margin-left: 15px;border:0px solid black;" type="text" placeholder="연락처를 입력하세요."></div>
            
                
            </div>
        </div>
   </div>

    <div>
        <div style="margin-top:40px; margin-left:1rem;">예약 사유</div>
        <input id="reservation" type="text" placeholder="진료를 예약하는 이유를 적어주세요(증상, 희망 진료 등)" style="border:0.5px solid lightgrey;">
    </div>
    <div>
        <button id="submit" type="button" style="border: 0px solid black; margin-top:1rem;">예약 신청하기</button>
    </div>
</section>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>