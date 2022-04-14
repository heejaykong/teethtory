<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>미니 프로젝트 메인화면</title>
    
    <link rel="stylesheet" href="/springframework-mini-project/resources/css/reset.css" />
	<link
		rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
    />
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <style>
      .header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 2rem;
        border-bottom: 1px solid lightgray;
        background-color: rgb(250, 250, 250);
      }
      .header__logo {
        cursor: pointer;
      }

      .nav__list {
        display: flex;
        align-items: center;
      }

      .nav__btn {
        display: flex;
        align-items: center;
        color: rgb(85, 85, 80);
        margin-right: 1.5rem;
        cursor: pointer;
      }
      .nav__btn > i {
        font-size: 0.9rem;
        margin-right: 0.3rem;
      }

      .round-btn {
        color: rgb(242, 101, 34);
        border: 3.5px solid rgb(242, 101, 34);
        border-radius: 30rem;
        padding: 0.8rem 1rem;
        background-color: white;
      }
      
      .aside {
      	padding-top: 8rem;
      	padding-left: 5rem;
      }

      body {
        height: 100vh;
      }

      #wrapper {
        position: relative;
        min-height: 100%;
        padding-bottom: 100px;
      }
      
      footer {
      	/* height: 100px; */
      	position: absolute;
      	/* transform: translateY(100%); */
        bottom: 0;
        width: 100%;
        background-color: lightgrey;
      }
      
      
      .footer__column {
      	padding: 3rem;
      }
      
    </style>
  </head>
  <body>
    <!-- header -->
    <header class="header">
      <div class="header__logo">logo</div>
      <nav class="nav">
        <ul class="nav__list">
          <a href="#" class="nav__btn">
            <i class="fa-solid fa-tooth"></i>
            <li>진료 내역</li>
          </a>
          <a href="#" class="nav__btn">
            <i class="fa-solid fa-clipboard"></i>
            <li>진료 예약</li>
          </a>
          <a href="#" class="nav__btn">
            <i class="fa-solid fa-calendar-day"></i>
            <li>일정 보기</li>
          </a>
          <a href="#" class="nav__btn">
            <li class="round-btn">마이페이지</li>
          </a>
          <a href="#" class="nav__btn">
            <li>로그아웃</li>
          </a>
        </ul>
      </nav>
    </header>
    
    <aside class="aside">
	    <ul>
	    	<li>
	    		내 치과 등록하기
	    	</li>
	    	<li>
	    		내 포인트
	    	</li>
	    	<li>
	    		회원정보 수정
	    	</li>
	    	<li>
	    		회원 탈퇴
	    	</li>
	    	
	    	<li class="mt-5">
	    		<div class="custom-control custom-switch">
				  <input type="checkbox" class="custom-control-input" id="customSwitch1">
				  <label class="custom-control-label" for="customSwitch1">알림 설정</label>
				</div>
	    	</li>
	    </ul>
    </aside>
    
    <div id="wrapper">
      <footer class="d-flex justify-content-around">
        <div class="footer__column">
          logo
        </div>
        <div class="footer__column">
          <span>서울시 강서구 마곡중앙12로3 오스템임플란트(주)|사업자등록번호:112-11-445567</span><br/>
          <span>대표이사:신용권|통신판매업 신고번호:제3022-서울강서-1004호|광고심의필:심의번호2005-03-22</span><br/>
          <span>TEL: 02-1122-3344|FAX:02-9988-7765|고객센터:1588-0000</span>
        </div>
        
        <div class="footer__column">
          <i class="fa-brands fa-github"></i>
          <i class="fa-brands fa-facebook"></i>
          <i class="fa-brands fa-instagram-square"></i>
          <i class="fa-brands fa-youtube"></i>
        </div>
      </footer>
    </div>
    
    
    <script
      src="https://kit.fontawesome.com/f58f043c2e.js"
      crossorigin="anonymous"
    ></script>
  </body>
</html>