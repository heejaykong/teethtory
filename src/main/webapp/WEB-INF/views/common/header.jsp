<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>치스토리</title>
    
    <link rel="stylesheet" href="/springframework-mini-project/resources/css/reset.css" />
	<link
		rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
    />
    <link rel="stylesheet" href="/springframework-mini-project/resources/css/medical-history-page.css" />
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <style>
     
.header{
	
	border-bottom:1px solid rgb(222, 226, 230);
}

/* 헤더 아이콘 스타일 */
header .bi-heart-fill{
  font-size: 25px;
  line-height: 25px;
  transition-duration: 0.5s;
}

.bi-person-fill{
  font-size: 30px;
  line-height: 30px;
  transition-duration: 0.5s;
}




.ham-con .bi-caret-up-fill, .ham-con .bi-caret-down-fill{
	color:#444;
}

/* 햄버거 버튼  스타일*/
.menu-trigger {
 
}

.menu-trigger:hover span:nth-of-type(1) {
  background-color: #444;
}

.menu-trigger:hover span:nth-of-type(2) {
  background-color: #444;
}

.menu-trigger:hover span:nth-of-type(3) {
  background-color: #444;
}

.menu-trigger,
.menu-trigger span {
  display: inline-block;
  transition: all .4s;
  box-sizing: border-box;
}

.menu-trigger {
  position: relative;
  width: 30px;
  height: 25px;
}

.menu-trigger span {
  position: absolute;
  left: 0;
  width: 100%;
  height: 4px;
  background-color: rgb(124,124,125);
  border-radius: 4px;
}

.menu-trigger span:nth-of-type(1) {
  top: 0;
}

.menu-trigger span:nth-of-type(2) {
  top: 11px;
}

.menu-trigger span:nth-of-type(3) {
  bottom: 0;
}

/* 햄버거 버튼 이벤트 */
.menu-trigger.active-1 span:nth-of-type(1) {
  -webkit-transform: translateY (10px) rotate (-45deg);
  transform: translateY(10px) rotate(-45deg);
}

.menu-trigger.active-1 span:nth-of-type(2) {
  opacity: 0;
}

.menu-trigger.active-1 span:nth-of-type(3) {
  -webkit-transform: translateY(-10px) rotate(45deg);
  transform: translateY(-10px) rotate(45deg);
}

  /* 햄버거 메뉴 디자인 */
.ham-con{
	
  width: 100%;
  height: 100%;
  background-color: white;
  position: fixed;
  /* margin-top:20%; */
  right:-100%;
  color:#505050;
  z-index: 99;
  opacity: 0;
}



.ham-menu ul {
  width: 100%;
  margin: 0;
  padding: 0;
}

.ham-menu ul.ham-top-menu li {
  position: relative;
  
  width: 100%;
  list-style-type: none;
  font-size: 18px;
}

.ham-menu ul.ham-top-menu li a {
  display: block;
  width: 100%;
  height: 100%;
  line-height: 50px;
  text-indent: 20px;
  color: #000;
  background-color: #fff;
  text-decoration: none;
}

.ham-menu ul.ham-top-menu li a:hover {
  background: #eee;
}

.ham-menu ul.ham-top-menu li .ham-sub-menu a {
  position: relative;
 
  display: block;
  width: 100%;
  z-index: 99;
  background: #F7F7F7;
}

.ham-menu ul.ham-top-menu li .ham-sub-menu a:hover {
  background: #444;
  color: #fff;
}
#athamLogin
{	
	margin-left:1.5rem;
	width:20rem;
	height:3rem;
		color: white;
	background-color: #f47d36;
	border-color: #f47d36;
	margin-top:1rem;
	border-radius:1rem;
}
#athamJoin
{	
	margin-left:1.5rem;
	width:20rem;
	height:3rem;
	color: #f47d36;
	background-color: white;
	border-color: #f47d36;
	margin-top:1rem;
	border-radius:1rem;
	
}
#headertop{
margin-top:-3rem;
display:flex;
flex-direction:row;
}
    </style>
  </head>
  <body>
 
  	<div class="wrapper" style="position:relative; min-height:100%; height:auto; padding-bottom:15.5rem;">
    	
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
			             <div id="headertop" class="container" style="margin-left:1rem;">
			                <div style="margin-right:3rem;  margin:0 auto;"><h1>치스토리</h1></div>
			                <div style="right:0%;">
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
			                <!-- <h1 style="margin-left:1.5rem;">치스토리</h1> -->
			                <h4 style="margin-left:1.5rem;">치스토리에 오신 것을</h4>
			                <h4 style="margin-left:1.5rem;">환영합니다!</h4>
			                
			                <input type="submit" value="로그인" id="athamLogin"
									class="btn btn-block btn-osstem">
						    <input type="submit" value="회원가입" id="athamJoin"
									class="btn">
			            </div>
			
			            <div id="ham-menu-wrap">
			                <div class="ham-menu mt-5">
			                    <ul class="ham-top-menu">
			                        <li><a href="#"><i class="fa-solid fa-tooth"></i> 치료 내역 모아보기<i class="bi bi-caret-down-fill"></i></a>
			        
			                        </li>
			                    </ul>
			                    <ul class="ham-top-menu">
			                        <li><a href="#"><i class="fa-solid fa-clock"></i> 진료 예약하기<i class="bi bi-caret-down-fill"></i></a>
			                            
			                        </li>
			                    </ul>
			                    <ul class="ham-top-menu">
			                        <li><a href="#"><i class="fa-solid fa-comments"></i> 커뮤니티<i class="bi bi-caret-down-fill"></i></a>
			                          
			                        </li>
			                    </ul>
			                </div>
			            </div>
			        </div>
			</header>
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
  })
  </script>
<!-- </body> -->