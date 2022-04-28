<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>Document</title>
    <style>


.dropdown{
  position : relative;
  display : inline-block;
}


.dropbtn{
  display : block;
  border : 2px solid rgb(94, 94, 94);
  border-radius : 4px;
  background-color: #fcfcfc;
  font-weight: 400;
  color : rgb(124, 124, 124);
  padding : 12px;
  width :240px;
  text-align: center;
  cursor : pointer;
  font-size : 20px;
  z-index :1;
  position : relative;
}
.dropdown-content{
  display : none;
  font-weight: 400;
  background-color: #fcfcfc;
  min-width : 240px;
  border-radius: 8px;
  height : 160px;
  overflow : scroll;
  box-shadow: 0px 0px 10px 3px rgba(190, 190, 190, 0.6);
}
.dropdown-content::-webkit-scrollbar{
  width : 5px;
  height : 10px;
}
.dropdown-content::-webkit-scrollbar-thumb{
  border-radius : 2px;
  background-color :rgb(194, 194, 194)
}

.dropdown-content div{
  display : block;
  text-decoration : none;
  color : rgb(37, 37, 37);
  font-size: 12px;
  padding : 12px 20px;
}
.dropdown-content div:hover{
  background-color: rgb(226, 226, 226);
}

.dropdown-content.show{
  display : block;
}






    </style>
</head>
<body>
    <div style="margin-top:2rem;">치료 내역 모아보기</div>
    
    <div class="dropdown-label" style="margin-top:2rem;">
       치료 종류 선택
      </div>
      <div class="dropdown">
        <button class="dropbtn"style="margin-top:1rem; width:22rem;">
          <span id="alltext" style="text-align:center;">전체</span>
          <span class="dropbtn_click" style="float:right;"
            onclick="dropdown()">></span>
        </button>
      <img src="./image/notreatment.png" style="width:22rem; margin-top:2rem;">
      </div>
<script>
    window.onload=()=>{
        document.querySelector('.dropbtn_click').onclick = ()=>{
          dropdown();
        }
        document.getElementsByClassName('treatment').onclick = ()=>{
          showMenu(value);
        };
        dropdown = () => {
          var v = document.querySelector('.dropdown-content');
          var dropbtn = document.querySelector('.dropbtn')
          v.classList.toggle('show');
          dropbtn.style.borderColor = 'rgb(94, 94, 94)';
        }
  
        showMenu=(value)=>{
          var dropbtn_icon = document.querySelector('.dropbtn_icon');
          var dropbtn_content = document.querySelector('.dropbtn_content');
          var dropbtn_click = document.querySelector('.dropbtn_click');
          var dropbtn = document.querySelector('.dropbtn');
  
          dropbtn_icon.innerText = '';
          dropbtn_content.innerText = value;
          dropbtn_content.style.color = '#252525';
          dropbtn.style.borderColor = '#3992a8';
        }
      }
      window.onclick= (e)=>{
        if(!e.target.matches('.dropbtn_click')){
          var dropdowns = document.getElementsByClassName("dropdown-content");
  
          var dropbtn_icon = document.querySelector('.dropbtn_icon');
          var dropbtn_content = document.querySelector('.dropbtn_content');
          var dropbtn_click = document.querySelector('.dropbtn_click');
          var dropbtn = document.querySelector('.dropbtn');
  
          var i;
          for (i = 0; i < dropdowns.length; i++) {
            var openDropdown = dropdowns[i];
            if (openDropdown.classList.contains('show')) {
              openDropdown.classList.remove('show');
            }
          }
        }
      }
</script>
</body>
</html>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>