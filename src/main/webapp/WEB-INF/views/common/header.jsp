<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> --%>

<!DOCTYPE html>
<div class="wrapper" style="position:relative; min-height:100%; height:auto; padding-bottom:15.5rem;">
   		<section>
	 	<header>
		    <!-- 네브바 시작 -->
		    <nav class="header navbar">
		        <!-- 오른쪽 메뉴 -->
		        <div class="right-nav" style=" width:80rem; margin-left:1rem;">
		            <ul class="navbar-nav">
		                <li class="nav-item mr-3">
		                <c:choose>
					        <c:when test="${empty sessionScope.principal}">
								<a class="nav-link" href="/loginForm">
			                        <i class="bi bi-heart-fill"></i>
			                    </a>	                    
		                    </c:when>
		                    <c:otherwise>
			                    <a class="nav-link" href="/api/user/${sessionScope.principal.id}/mypage?key=wishlist&page=0">
			                        <i class="bi bi-heart-fill"></i>
			                    </a>
		                     </c:otherwise>
			            </c:choose>
		                </li>
		                <li class="nav-item">
		                    <c:choose>
						        <c:when test="${empty sessionScope.principal}">
				                    <a class="nav-link" href="/loginForm">
				                        <i class="bi bi-person-fill"></i>
				                    </a>
			                    </c:when>
			                    <c:otherwise>
				                    <a class="nav-link" href="/api/user/${sessionScope.principal.id}/mypage?key=userinfo&page=0">
				                        <i class="bi bi-person-fill"></i>
				                    </a>
			                    </c:otherwise>
			            	</c:choose>
		                </li>
		
		                <!-- 햄버거 버튼 -->

		             <div id="headertop" class="container">
		                <div style="margin:auto;">
		                <a href="${pageContext.request.contextPath}/" style="text-decoration: none; color: black;">
		                	<h1>치스토리</h1>
	                	</a>
	                	</div>
	                 <div>

		                <li class="ham-btn">
		                    <a class="menu-trigger" href="#">
		                        <span></span>
		                        <span></span>
		                        <span></span>
		                    </a>
		                </li>
		                </div>
		             </div>
		            </ul>
		        </div>
		
		    </nav>
		    <!-- 네브바 끝 -->
		
		    <!-- 햄버거 메뉴 시작 -->
		        <div class="ham-con">
		            <div class="navbar-nav" style="margin-top:1rem;">
		                <h4 style="margin-left:1.5rem;">치스토리에 오신 것을</h4>
		                <h4 style="margin-left:1.5rem;">환영합니다!</h4>
		                
		                <c:if test="${sessionUserid == null}">
			                <form action="${pageContext.request.contextPath}/login" method="get">
				                <input type="submit" value="로그인" id="athamLogin"
										class="btn btn-block btn-osstem">
			                </form>
			                <form action="${pageContext.request.contextPath}/signup" method="get">
							    <input type="submit" value="회원가입" id="athamJoin"
										class="btn">
			                </form>
		                </c:if>
		                <c:if test="${sessionUserid != null}">
			                <form action="${pageContext.request.contextPath}/logout" method="get">
							    <input type="submit" value="로그아웃" id="athamJoin"
										class="btn">
			                </form>
		                </c:if>
		            </div>
		
		            <div id="ham-menu-wrap">
		                <div class="ham-menu mt-5">
		                    <ul class="ham-top-menu">
		                        <li><a href="${pageContext.request.contextPath}/treatment/main"><i class="fa-solid fa-tooth"></i> 치료 내역 모아보기<i class="bi bi-caret-down-fill"></i></a>

		                        </li>
		                    </ul>
		                    <ul class="ham-top-menu">
		                        <li><a href="${pageContext.request.contextPath}/reservation/main"><i class="fa-solid fa-clock"></i> 진료 예약하기<i class="bi bi-caret-down-fill"></i></a>
		                            
		                        </li>
		                    </ul>
		                    <ul class="ham-top-menu">
		                    	<!-- 게시판 메인 페이지가 생기면 경로를 추가해주세요 -->
		                        <li><a href="${pageContext.request.contextPath}/board/boardList"><i class="fa-solid fa-comments"></i> 커뮤니티<i class="bi bi-caret-down-fill"></i></a>
		                          
		                        </li>
		                    </ul>
		                    <ul class="ham-top-menu">
		                    	<!-- 게시판 메인 페이지가 생기면 경로를 추가해주세요 -->
		                        <li><a href="${pageContext.request.contextPath}/myPage/main"><i class="fa-solid fa-person-shelter"></i> 마이페이지<i class="bi bi-caret-down-fill"></i></a>
		                          
		                        </li>
		                    </ul>
		                </div>
		            </div>
		        </div>
		</header>
		</section>
</div>
  <script>
  var burger = $('.menu-trigger');

  burger.each(function (index) {
    var $this = $(this);

    $this.on('click', function (e) {
      e.preventDefault();
      $(this).toggleClass('active-' + (index + 1));
    })
  });

  var h = 0;
 
  
  $(burger).on("click", function () {
    if (h == 0) {
		  $('.ham-con').animate({
			  right: '0',
			  opacity: 1
		  }, 500);
		  $(this).addClass('active-1');
		  h++;
	  } else if (h == 1) {
		  $('.ham-con').animate({
			  right: '-100%',
			  opacity: 0
		  }, 500);
		  $(this).removeClass('active-1');
		  h--;
	  }
	  $(window).scroll(function() {
		  sct = $(window).scrollTop();
      if(sct>30){
        $('.ham-con').css({
          opacity: 0,
          right :'-20%'
        }, 500);
        $(burger).removeClass('active-1');
        h=0;
      }
    });
  });
 
  </script>
