<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/common/meta.jsp" %>
	<title>치스토리-마이페이지</title>
<script type="text/javascript" src="/js/jquery-1.8.3.min.js"></script>
<style>
.stamp {
	border-radius: 80%;
	color: #555;
	font-size: 0.5rem;
	font-weight:2rem;
	border: 0.25rem solid #555;
	display: inline-block;
	padding: 0.25rem 1rem;
	text-transform: uppercase;
	border-radius: 70%;
	font-family: 'Courier';
	-webkit-mask-image: url('https://s3-us-west-2.amazonaws.com/s.cdpn.io/8399/grunge.png');
  -webkit-mask-size:2rem;
  mix-blend-mode: multiply;
}
.is-nope {
  border-radius: 80%;
	color: red;
	font-size: 0.5rem;
	font-weight:2rem;
	border: 0.25rem solid red;
	display: inline-block;
	padding: 0.25rem 1rem;
	text-transform: uppercase;
	border-radius: 70%;
	font-family: 'Courier';
	-webkit-mask-image: url('https://s3-us-west-2.amazonaws.com/s.cdpn.io/8399/grunge.png');
  -webkit-mask-size:2rem;
  mix-blend-mode: multiply;
}
.is-approved {
border-radius: 80%;
	color: green;
	font-size: 0.5rem;
	font-weight:2rem;
	border: 0.25rem solid green;
	display: inline-block;
	padding: 0.25rem 1rem;
	text-transform: uppercase;
	border-radius: 70%;
	font-family: 'Courier';
	-webkit-mask-image: url('https://s3-us-west-2.amazonaws.com/s.cdpn.io/8399/grunge.png');
  -webkit-mask-size:2rem;
  mix-blend-mode: multiply;
} 
.btn{
	color: black;
	background-color: #ffdab9;
	border-color:#ffdab9;
	width:90%;
	height:3rem;
}
#all{
overflow: hidden;
}
.container{
display:flex;
flex-direct:row;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

<div id="all">
    <%-- 로그인한 사용자의 예약 기록 보여주기. --%>
    <div style="margin-left:1rem; margin-bottom:2rem; margin-top:3rem;">
    <h4>예약 현황</h4>
    </div>
    <div style="position:relative; border:1px solid lightgrey ;border-radius:1rem; margin:0.5rem;"> 
    		<div style="position:absolute; margin-left:1rem;left:80%">
	    	<span class="stamp is-nope">예약불가</span>
	    	</div>
    	<div style="text-decoration:none; color:orange; margin-left:1rem; margin-top:1rem;"><h4>A치과 진료 예약</h4></div>
	    	
    	<div style="margin-left:1rem;"><h5>일정: 2022. 04. 29(금) 10:30</h5></div>
		<div class="container" style=" margin-bottom:1rem;">
			<input type="submit" value="예약변경"
						class="btn btn-block btn-osstem"style="margin-left:0.5rem; margin-top:2rem; width:45%; height:3rem;">
			<input type="submit" value="예약취소"
						class="btn btn-block btn-osstem"style="margin-left:0.5rem; margin-top:2rem; width:45%; height:3rem;">
		</div>
    </div>
    
   <div style="position:relative;  border:1px solid lightgrey;border-radius:1rem; margin:0.5rem;"> 
    		<div style="position:absolute; margin-left:1rem; left:80%">
	    	<span class="stamp is-approved">예약확정</span>
	    	</div>
    	<div style="text-decoration:none; color:orange; margin-left:1rem; margin-top:1rem;"><h4>A치과 진료 예약</h4></div>
	    	
    	<div style="margin-left:1rem;"><h5>일정: 2022. 04. 29(금) 10:30</h5></div>
		<div class="container" style=" margin-bottom:1rem;">
			<input type="submit" value="예약변경"
						class="btn btn-block btn-osstem"style="margin-left:0.5rem; margin-top:2rem; width:45%; height:3rem;">
			<input type="submit" value="예약취소"
						class="btn btn-block btn-osstem"style="margin-left:0.5rem; margin-top:2rem; width:45%; height:3rem;">
		</div>
    </div>
    <div style="position:relative;  border:1px solid lightgrey; border-radius:1rem; margin:0.5rem;"> 
    		<div style="position:absolute; margin-left:1rem;left:80%">
	    	 <span class="stamp">예약대기</span>
	    	</div>
    	<div style="text-decoration:none; color:orange; margin-left:1rem; margin-top:1rem;"><h4>A치과 진료 예약</h4></div>
	    	
    	<div style="margin-left:1rem;"><h5>일정: 2022. 04. 29(금) 10:30</h5></div>
		<div class="container" style=" margin-bottom:1rem;">
			<input type="submit" value="예약변경"
						class="btn btn-block btn-osstem"style="margin-left:0.5rem; margin-top:2rem; width:45%; height:3rem;">
			<input type="submit" value="예약취소"
						class="btn btn-block btn-osstem"style="margin-left:0.5rem; margin-top:2rem; width:45%; height:3rem;">
		</div>
    </div>
    	</div>		


	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
