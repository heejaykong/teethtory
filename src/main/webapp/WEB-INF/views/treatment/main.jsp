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

	<main class="main located-at-bottom-of-header">
		<!-- 드롭다운 선택지 영역 -->
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
                    <option value="BRACES">교정</option>
                </select>
            </div>
		</section>

		<div class="thick-divider"></div>

		<!-- 드롭다운 선택한 결과 영역 -->
		<section class="selected-treattype-results-section">
            <c:if test="${treatments.length == 0}">
                <div class="emptly-block">
                    <img width="100%" src="${pageContext.request.contextPath}/resources/images/toothCharacter/neutral-smile.png" alt="neutral-smile-tooth-character">
                    <p class="text">치료 내역이 없어요.</p>
                </div>
            </c:if>
            <c:if test="${treatments.length > 0}">
                <!-- TBD: 다음 템플릿대로 백에서 넘어온 결과 리스트 foreach로 출력 -->
            </c:if>
        </section>

        <c:if test="${treatments.length > 0}">
           <!--  페이지네이션 -->
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
	</main>
	
	<script>
		function handleListItemClick(treatno) {
 			$.ajax({
 				type: "GET",
 				url: "details?treatno=" + treatno
 			}).done(() => {
 				window.location.href = "details?treatno=" + treatno;
 			});
	 	}
	 	
		function template({treatno, treattype, denname, treatdate}) {
	       // TBD: 각 치과마다 비동기적으로 가져온 데이터들을 날짜순으로 다시 정렬해서 뿌려야 함.(동현쓰 완)
	       // TBD: dentistname(치료를 진행한 치과 이름)을 가져오는 작업 따로 해줘서 뿌려야 함.(동현쓰 완)
	       // TBD: treatdate 파싱해서 yyyy. MM. dd. (요일) 포맷으로 뿌려야 함.(동현쓰 완)
	       return `
	        <div onclick="handleListItemClick(`+ treatno +`)" class="list-item hover-effect">
	            <div class="list-item__info-summary">
	                <h4 class="title">
	                    `+ treattype +`
	                    <span class="subtitle">`+ denname +`</span>
	                </h4>
	                <p class="text-md">`+ treatdate +`</p>
	            </div>
	            <div class="list-item__thumbnail">
	                <img src="https://dummyimage.com/600x400/000/fff" alt="treatment thumbnail image"/>
	            </div>
	        </div>
	       `;
       }
		
		
		getData("ALL");
		
		function handleSelectChange(event) {
			var selectedTreattype = event.target.value;
			getData(selectedTreattype);
		}
		
		function windowdd(selectedTreattype) {
			console.log(selectedTreattype);
			const promise = new Promise((resolve, reject) => {
				let list = [];
				console.log("dentist", ${dentist}.dentist);
				for(let i=0; i<${dentist}.dentist.length; i++) {
					$.ajax({
						method:"POST",
						url: "http://localhost:8082/springframework-mini-project-dentist/treatment/getTreatmentByssn?patientssn=${patientssn}&treattype=" + selectedTreattype,
						<%--url: "http://localhost:" + ${dentist}.dentist[i].dendomain + "/springframework-mini-project-dentist/treatment/getTreatmentByssn?patientssn=${patientssn}&treattype=" + selectedTreattype,
						--%>
						data: {
						},
						async: false
					}).done((data) => {
						data.treatment.forEach(item => {
							item.denname = data.denname;
							list.push(item);
						});
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
	
		async function getData(selectedTreattype) {
			try {
				$(".selected-treattype-results-section").html("");
				data = await windowdd(selectedTreattype);
				//const smalldata = data.slice(0,5);
				data.sort(function(a, b) {
					if(a.treatdate > b.treatdate) {
						return -1;
					}
					if(a.treatdate < b.treatdate) {
						return 1;
					}
					return 0;
				})
				//console.log("orderedDate:", data);
				//console.log(data.length);
				data.forEach(treatment => {
	                 const listItem = template(treatment);
	                 $(".selected-treattype-results-section").append(listItem);
	             });
			} catch (error) {
				console.log(error, "error");
			} finally {}
		}
	</script>
	
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>