<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <script src="https://kit.fontawesome.com/d9e341abda.js" crossorigin="anonymous"></script>
    <style>
.keyword{
    width:15rem;
    height:2rem;
    margin-top:1rem;
    
}
#face{
   width: 20rem;
   margin-top:5rem;
}
#top{
    display:inline-block;
}

a:link { color: red; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: orange; }
    </style>
            <div style="margin-top:20px; margin-left:1rem;font-weight:bold;"><h3>진료 예약하기</h3></div>
              <div id="top" class="container">
                <form class='search'>
                    <div>
                    <input class='keyword' type='text' name="search" maxlength=255 value=""placeholder="내 치과를 검색해 보세요."style="border:0.5px solid lightgrey;">
                    <button class="img-button" type="submit" name="click" value="" style="border:0px solid black;">   
                        <i class="fas fa-search" style="border:0px solid black;"></i></button>
                    </div>
                </form>
                </div>
 
            <div style="margin-top:1rem; margin-left:1rem;">찾으시는 치과가 없나요? <a href="#">치과 등록을 요청하세요.</a></div>
   <div>
       <img src="/springframework-mini-project/resources/images/ㅠㅠ.png" style="width:100%;">
   </div>
   	</section>
   	</div>		

<%@ include file="/WEB-INF/views/common/footer.jsp" %>