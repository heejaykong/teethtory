<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/views/common/meta.jsp"%>
<title>치스토리-치료 내역 모아보기</title>
<link rel="stylesheet"
	href="/springframework-mini-project/resources/css/treatment.css" />

<style>
.dropdown {
	position: relative;
	display: inline-block;
}

.dropbtn {
	display: block;
	border: 2px solid rgb(94, 94, 94);
	border-radius: 4px;
	background-color: #fcfcfc;
	font-weight: 400;
	color: rgb(124, 124, 124);
	padding: 12px;
	width: 240px;
	text-align: center;
	cursor: pointer;
	font-size: 20px;
	z-index: 1;
	position: relative;
}

.dropdown-content {
	display: none;
	font-weight: 400;
	background-color: #fcfcfc;
	min-width: 240px;
	border-radius: 8px;
	height: 160px;
	overflow: scroll;
	box-shadow: 0px 0px 10px 3px rgba(190, 190, 190, 0.6);
}

.dropdown-content::-webkit-scrollbar {
	width: 5px;
	height: 10px;
}

.dropdown-content::-webkit-scrollbar-thumb {
	border-radius: 2px;
	background-color: rgb(194, 194, 194)
}

.dropdown-content div {
	display: block;
	text-decoration: none;
	color: rgb(37, 37, 37);
	font-size: 12px;
	padding: 12px 20px;
}

.dropdown-content div:hover {
	background-color: rgb(226, 226, 226);
}

.dropdown-content.show {
	display: block;
}

.container {
	display: flex;
	flex-direction: row;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<div class="located-at-bottom-of-header">
		<div style="margin-top: 2rem;">치료 내역 모아보기</div>

		<div class="dropdown-label" style="margin-top: 2rem;">치료 종류 선택</div>
		<div class="dropdown">
			<button class="dropbtn" style="margin-top: 1rem; width: 22rem;">
				<span id="alltext" style="text-align: center;">전체</span> <span
					class="dropbtn_click" style="float: right;" onclick="dropdown()">></span>
			</button>
		</div>

		<div id="test"></div>
	</div>
	<script type="text/javascript">
	getData();

	function windowdd() {
		const promise = new Promise((resolve, reject) => {
			let list = ["cat"];
			for(let i=0; i<${dentist}.dentist.length; i++) {
				$.ajax({
					method:"POST",
					url: "http://localhost:" + ${dentist}.dentist[i].denno + "/springframework-mini-project-dentist/treatment/gettreatmentByssn?patientssn=${patientssn}",
					data: {
						// pageNo: pageNo
					}
				}).done((data) => {
					for(let j=0; j<data.treatment.length; j++) {
						list.push(data.treatment[j]);
					}
				});
			}
			if(list != null) {
				resolve(list);
			} else {
				reject({message: "실패"});
			}
		})
		return promise;
	}
	
	async function getData() {
		try {
			console.log("aaa");
			let data = await windowdd();
			console.log(data);
			
			let aReviewHtml = '';
	
			/* $("#test").append(aReviewHtml);
			var treatdate = $(".treatdate").text();
			console.log(treatdate);
			for(let i=0; i<data.treatment.length; i++) {
				console.log(i);
				aReviewHtml += '<div class="d-flex" onclick="getDetails()">';
				aReviewHtml += '	<div class="d-flex flex-column align-items-center justify-content-center">';
				aReviewHtml += '		<div>';
				aReviewHtml += '			<span style="font-size: 2rem; margin-right: 0.5rem;">'+ data.treatment[i].treattype + '</span><span>'+ data.denname +'</span>';
				aReviewHtml += '		</div>';
				aReviewHtml += '		<div class="treatdate">'+ data.treatment[i].treatdate +'</div>';
				aReviewHtml += '	</div>';
				aReviewHtml += '	<img src="${pageContext.request.contextPath}/resources/images/ㅠㅠ.png">';
				aReviewHtml += '</div>';
			} */
		} catch (error) {
			console.log(error, "error");
		} finally {
			
		}
	}
	
	/* 		/
	/* var treatdate = document.querySelector(".treatdate").html(); */
	
	
	
	</script>
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


	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
