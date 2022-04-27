<%@ page language="java" contentType="text/html; charset=UTF-8"
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
.keyword{
    width:20rem;
    height:1rem;
    margin-top:1rem;
    
}
#face{
   width: 20rem;
   margin-top:5rem;
}
#top{
    display:flex;
    flex-direction: column;
}


    </style>
</head>

<body>
   <div class="container" id="top">
        <div>
            <div style="margin-top:20px; font-weight:bold;">진료 예약하기</div>
              <div id="top" class="container">
                <form class='search'>
                    <div>
                    <input class='keyword' type='text' name="search" maxlength=255 value=""placeholder="내 치과를 검색해 보세요."style="border:0.5px solid lightgrey;"><button class="img-button" type="submit" name="click" value="" style="border:0px solid black;">
                        <i class="fas fa-search" style="border:0px solid black;"></i>
                    </button>
                    </div>
                    <div>
                    
                    </div>
                </form>
            </div>
            <div style="margin-top:1rem;">찾으시는 치과가 없나요? <a href="#">치과 등록을 요청하세요.</a></div>
        </div>
        
   </div>

   <div>
       <img src="./image/ㅠㅠ.png" id="face">
   </div>






   


</body>
</html>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>