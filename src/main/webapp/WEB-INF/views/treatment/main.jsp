<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	
	<%@ include file="/WEB-INF/views/common/meta.jsp" %>
	<title>치료 내역 모아보기 - 치스토리</title>
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/appIcon.png">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/treatment/treatment.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/list-item.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/empty-block.css" />
</head>
<body>
	<%@ include file="/WEB-INF/views/common/loading.jsp" %>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<main class="main located-at-bottom-of-header">
		<!-- 드롭다운 선택지 영역 -->
		<section class="treattype-dropdown-section">
			<h1 class="page-title">치료 내역 모아보기</h1>

			<label for="treattype">치료 종류 선택</label>
            <div class="select-block">
                <select name="treattype" id="treattype">
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
			<!-- 백에서 넘어온 치료내역 리스트 foreach로 출력 -->
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
		function handleListItemClick(e) {
			const clickedTarget = e.target.closest(".list-item");
			const treatno = clickedTarget.dataset.treatno;

			const dendomain = clickedTarget.dataset.dendomain;

 			$.ajax({
				type: "GET",
				url: "details?treatno=" + treatno + "&dendomain=" + dendomain
			}).done(() => {
				// 해당 치료내역의 상세페이지로 넘어가기
				window.location.href = "details?treatno=" + treatno + "&dendomain=" + dendomain;
			});
		}

	 	
		function template({treatno, dendomain, treattype, denname, treatdate}, IMAGE_FILENAME) {
			if(IMAGE_FILENAME) {
				return `
					<div class="list-item hover-effect" data-treatno="` + treatno + `" data-dendomain="`+ dendomain +`">
		
						<div class="list-item__info-summary">
							<h4 class="title">
								`+ treattype +`
								<span class="subtitle">`+ denname +`</span>
							</h4>
						<p class="text-md">`+ treatdate +`</p>
					</div>
					<div class="list-item__thumbnail">
						<!--TBD: 객체가 attachment를 갖고 있다면 before 사진 중 첫번째 이미지를 썸네일로 띄우기-->
						<!--TBD: 만약 before 사진이 하나도 없다면 after 사진 중 첫번째 이미지를 썸네일로 띄우기-->
						<img class="list-item-thumbnail" src="http://localhost:` + dendomain + `/springframework-mini-project-dentist/resources/images/treatment/` + IMAGE_FILENAME + `" alt="treatment thumbnail image"/>
					</div>
				</div>
				`;
			}
			return `
				<div class="list-item hover-effect" data-treatno="` + treatno + `" data-dendomain="`+ dendomain +`">

					<div class="list-item__info-summary">
						<h4 class="title">
							`+ treattype +`
							<span class="subtitle">`+ denname +`</span>
						</h4>
					<p class="text-md">`+ treatdate +`</p>
				</div>
				<div class="list-item__thumbnail">
	            	<!--TBD: 객체가 attachment를 갖고 있다면 before 사진 중 첫번째 이미지를 썸네일로 띄우기-->
	            	<!--TBD: 만약 before 사진이 하나도 없다면 after 사진 중 첫번째 이미지를 썸네일로 띄우기-->
	            	<img class="list-item-thumbnail" src="${pageContext.request.contextPath}/resources/images/no-image.jpg" alt="treatment thumbnail image"/>
            	</div>
           	</div>
           	`;
		}
		$(function(){
			getData("ALL");
			
			document.querySelector("#treattype").addEventListener("change", handleSelectChange);

			function handleSelectChange(event) {
				var selectedTreattype = event.target.value;
				getData(selectedTreattype);
			}

			function getTreatments(selectedTreattype) {
				const promise = new Promise((resolve, reject) => {
					let list = [];
          			console.log("dentist", ${dentist}.dentist);
					for(let i=0; i<${dentist}.dentist.length; i++) {
						$.ajax({
							method:"POST",
							url: "http://localhost:" + ${dentist}.dentist[i].dendomain + 
									"/springframework-mini-project-dentist/treatment/getTreatmentByssn?patientssn=${patientssn}&treattype=" 
									+ selectedTreattype,
							data: {},
							async: false
						}).done((data) => {
							data.treatment.forEach(treatment => {
								treatment.denname = data.denname;
								treatment.dendomain = data.dendomain;
								list.push(treatment);
							});
						});
					}
					if(list != null) {
						resolve(list);
					} else {
						reject({message: "실패"});
					}
				});
				return promise;
			}
	
			async function getData(selectedTreattype) {
				try {
					data = await getTreatments(selectedTreattype);
					// 만약 해당 내역이 없을 경우 없다고 표시
					if (!data.length) {
						const emptyBlockTemplate = `
						    <div class="empty-block">
			                    <img width="100%" src="${pageContext.request.contextPath}/resources/images/toothCharacter/neutral-smile.png" alt="neutral-smile-tooth-character">
			                    <p class="text">치료 내역이 없어요.</p>
			                </div>
						`;
		                 $(".selected-treattype-results-section").html(emptyBlockTemplate);
		                 return;
					}
					
					//치료 내역을 최근 시간 순으로 정렬하기
					data.sort(function(a, b) {
						if(a.treatdate > b.treatdate) {
							return -1;
						}
						if(a.treatdate < b.treatdate) {
							return 1;
						}
						return 0;
					})
					// 그외 해당 내역이 하나라도 있을 경우 섹션 초기화후 일일이 목록 그려주기
					$(".selected-treattype-results-section").html("");
					let IMAGE_FILENAME = null;
					data.forEach(treatment => {
						$.ajax({
							method:"POST",
							url: "http://localhost:" + treatment.dendomain + "/springframework-mini-project-dentist/attachment/getAttachmentList?treatno=" + treatment.treatno,
							data: {},
							async: false
						}).done((data) => {
							console.log("hey loook!!!!!!!!!!!!!!!!!!!");
							//console.log(data.attachments.);
//							<!--TBD: 객체가 attachment를 갖고 있다면 before 사진 중 첫번째 이미지를 썸네일로 띄우기-->
//							<!--TBD: 만약 before 사진이 하나도 없다면 after 사진 중 첫번째 이미지를 썸네일로 띄우기-->
							if (data.attachments) {
								data.attachments.forEach(({isafter, savedfilename}) => {
									if(!isafter) {
										IMAGE_FILENAME = savedfilename;
										return false;
									}
								});
							}
						});
						const listItem = template(treatment, IMAGE_FILENAME);
						$(".selected-treattype-results-section").append(listItem);
		             });
				} catch (error) {
					console.log(error, "error");
				} finally {}
			}
			document.querySelector(".selected-treattype-results-section").addEventListener("click", (e) => handleListItemClick(e));
		});
	</script>
	
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
