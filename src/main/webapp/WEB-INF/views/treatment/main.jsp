<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/common/meta.jsp" %>
	<title>치료 내역 모아보기 - 치스토리</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/treatment/treatment.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/list-item.css" />
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
			let list = [];
			for(let i=0; i<${dentist}.dentist.length; i++) {
				$.ajax({
					method:"POST",
					url: "http://localhost:8082/springframework-mini-project-dentist/treatment/gettreatmentByssn?patientssn=${patientssn}",
					// url: "http://localhost:" + ${dentist}.dentist[i].denno + "/springframework-mini-project-dentist/treatment/gettreatmentByssn?patientssn=${patientssn}",
					data: {
						// pageNo: pageNo
					},
					async: false
				}).done((data) => {
					console.log(data);
					for(let j=0; j<data.treatment.length; j++) {
						data.treatment[j].denname = (data.denname);
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

<%-- 여기부터 희재의 흔적
<<<<<<< HEAD
	<main class="main located-at-bottom-of-header">
		드롭다운 선택지 영역
		<section class="treattype-dropdown-section">
			<h1 class="page-title">치료 내역 모아보기</h1>

			<label for="treattype">치료 종류 선택</label>
            <div class="select-block">
                <select onchange="handleSelectChange(event)" name="treattype" id="treattype">
                    <option value="ALL" selected>전체</option>
                    <option value="CAVITY">충치 치료</option>
                    <option value="IMPLANT">임플란트</option>
                    <option value="NEUROTHERAPY">신경 치료</option>
                    <option value="EXTRACTION">발치</option>
                </select>
            </div>
		</section>

		<div class="thick-divider"></div>

		드롭다운 선택한 결과 영역
		<section class="selected-treattype-results-section">
            <c:if test="${treatments.length == 0}">
                <div class="emptly-block">
                    <img width="100%" src="${pageContext.request.contextPath}/resources/images/toothCharacter/neutral-smile.png" alt="neutral-smile-tooth-character">
                    <p class="text">치료 내역이 없어요.</p>
                </div>
            </c:if>
            <c:if test="${treatments.length > 0}">
                TBD: 다음 템플릿대로 백에서 넘어온 결과 리스트 foreach로 출력
            </c:if>
        </section>

        <c:if test="${treatments.length > 0}">
            페이지네이션
            <nav class="pagination-block" aria-label="Page navigation example">
                <ul class="pagination">
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="First">
                            <span aria-hidden="true">첫 장</span>
                        </a>
                    </li>
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Last">
                            <span aria-hidden="true">끝 장</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </c:if>

		<script>
            const TREATTYPE_CAVITY = "CAVITY";
            const TREATTYPE_IMPLANT = "IMPLANT";
            const TREATTYPE_NEUROTHERAPY = "NEUROTHERAPY";
            const TREATTYPE_EXTRACTION = "EXTRACTION";

            function parseTreattype(treattype) {
                if (treattype === TREATTYPE_CAVITY){
                    return "충치 치료"; 
                }
                if (treattype === TREATTYPE_IMPLANT){
                    return "임플란트"; 
                }
                if (treattype === TREATTYPE_NEUROTHERAPY){
                    return "신경 치료"; 
                }
                if (treattype === TREATTYPE_EXTRACTION){
                    return "발치"; 
                }
                return; 
            }
            function template({treattype, dentistname, treatdate}) {
                const parsedTreattype = parseTreattype(treattype);
                // TBD: 각 치과마다 비동기적으로 가져온 데이터들을 날짜순으로 다시 정렬해서 뿌려야 함.
                // TBD: dentistname(치료를 진행한 치과 이름)을 가져오는 작업 따로 해줘서 뿌려야 함.
                // TBD: treatdate 파싱해서 yyyy. MM. dd. (요일) 포맷으로 뿌려야 함.
                return `
                    <a href="#">
                        <div class="list-item hover-effect">
                            <div class="list-item__info-summary">
                                <h4 class="title">
                                    `+ parsedTreattype +`
                                    <span class="subtitle">`+ dentistname +`</span>
                                </h4>
                                <p class="text-md">`+ treatdate +`</p>
                            </div>
                            <div class="list-item__thumbnail">
                                <img src="https://dummyimage.com/600x400/000/fff" alt="treatment thumbnail image"/>
                            </div>
                        </div>
                    </a>
                `;
            }
			const DUMMY_TREATMENT_OBJ1 = {
				treatno: 1,
				isreviewed: false,
				treattype: "EXTRACTION",
				doctorname: "나의사",
				treatcost: 60000,
				treatdate: "2020-11-10",
				doctorcomment: "나는 의사일세... 이 환자는 건강하다네.",
				materialcompany: "네오",
				patientssn: "960205-2222222",
			};
			const DUMMY_TREATMENT_OBJ2 = {
				treatno: 2,
				isreviewed: true,
				treattype: "CAVITY",
				doctorname: "김긍정",
				treatcost: 90000,
				treatdate: "2022-12-25",
				doctorcomment: "나는 긍정적인 의사... 세상은 아름다워~!",
				materialcompany: "오스템 임플란트",
				patientssn: "960205-2222222",
			};
			const DUMMY_TREATMENTS_LIST = [
			    DUMMY_TREATMENT_OBJ1,
			    DUMMY_TREATMENT_OBJ2
			];
			function handleSelectChange(event) {
				const selectedTreattype = event.target.value;
				console.log(selectedTreattype);
			}
            $(function() {
                DUMMY_TREATMENTS_LIST.forEach(treatment => {
                    const listItem = template(treatment);
                    $(".selected-treattype-results-section").append(
                        listItem
                    )
                });
            });
		</script>
	</main>
=======
--%>
	async function getData() {
		try {
			console.log("aaa");
			let data = await windowdd();
			console.log(data);
			
			data.sort(function(a, b) {
				if(a.treatdate > b.treatdate) {
					return -1;
				}
				if(a.treatdate < b.treatdate) {
					return 1;
				}
				return 0;
			})
			let aReviewHtml = '';
			console.log("orderedDate:", data)
			console.log(data.length);
			for(let i=0; i<data.length; i++) {
				console.log(i);
				aReviewHtml += '<div class="d-flex" onclick="getDetails()">';
				aReviewHtml += '	<div class="d-flex flex-column align-items-center justify-content-center">';
				aReviewHtml += '		<div>';
				aReviewHtml += '			<span style="font-size: 2rem; margin-right: 0.5rem;">'+ data[i].treattype + '</span><span>'+ data[i].denname +'</span>';
				aReviewHtml += '		</div>';
				aReviewHtml += '		<div class="treatdate">'+ data[i].treatdate +'</div>';
				aReviewHtml += '	</div>';
				aReviewHtml += '	<img src="${pageContext.request.contextPath}/resources/images/ㅠㅠ.png">';
				aReviewHtml += '</div>';
			}
			$("#test").append(aReviewHtml);
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
