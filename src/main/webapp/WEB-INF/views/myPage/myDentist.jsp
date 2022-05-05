<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/common/meta.jsp" %>
	<title>치스토리-내 치과</title>

<style>
#myDentistRegistrationTab {
	color: rgb(242, 101, 34);
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

<!-- 추가 눌렀을때 확인하는 Modal창 -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
	  <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        내 치과 목록에 추가하시겠습니까?
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">아니오</button>
	        <button type="button" class="btn btn-primary" style="width: 10rem;">예</button>
	      </div>
	    </div>
	</div>
</div>
<script>
	$('#exampleModal').on('show.bs.modal', function (event) {
	  	var button = $(event.relatedTarget) // Button that triggered the modal
	  	var recipient = button.data('whatever') // Extract info from data-* attributes
	  	var body = button.data('body')
	  	// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	  	// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	  	console.log("aaa");
	  	var modal = $(this)
	  	modal.find('.modal-title').text(recipient)
	  	modal.find('.modal-body').text(body)
		
	})
	
	function handleHidden(e, task, denno) {
		const targetEl = e.target;
		const theElement = targetEl.parentNode.parentNode.querySelector(".history-list-hidden__item");
		$(targetEl.parentNode.parentNode.querySelector(".history-list-hidden__item")).toggle();
		
		const denName = targetEl.parentNode.parentNode.querySelector(".denName");
		const denidvalue = $(targetEl.parentNode.parentNode.querySelector(".denName")).text();
		theElement.dataset.whatever = denidvalue;

		// const hiddenDenNo = denno;
		// if(task === 'add') {
		// 	location.href = "myDentist?denno=" + denno + "&task=" + task;
		// } else if(task === 'delete') {
		// 	location.href = "myDentist?denno=" + denno + "&task=" + task;
		// }
	}
	
	function toggleOff(e) {
		const targetEl = e.target;
		$(targetEl).toggle();
	}
</script>

<h4 style="padding-top: 2rem; padding-left: 1.5rem; padding-bottom: 0.5rem;">내 치과 목록</h4>
	<!-- core와 EL을 이용해서 목록 보여주기. -->
	<c:if test="${myDentists == null}">
		<p>등록한 치과가 없습니다. 이미지로 대체해야 함!</p>
	</c:if>
	<c:forEach var="myDentist" items="${myDentists}">
		<div style="width: 90%; position: relative;">
			<div class="history-list__item" style="margin-left: 1rem; width: inherit;">
				<div class="item__col">
					<img
						src="/springframework-mini-project/resources/images/signOut.jpg"
						class="round-thumbnail">
				</div>
				<div>
					<div id="denName_3" style="color: rgb(242, 101, 34); font-size: 1.8rem;">${myDentist.denname}</div>
					<span class="dentist-visited">${myDentist.denaddress}</span>
					<div id="denNoForDelete" style="display:none;">${myDentist.denno}</div>
				</div>
				<i class="fa-solid fa-caret-down" style="cursor: pointer;" onclick="handleHidden(event, 'delete', ${myDentist.denno});"></i>
			</div>
			<div class="history-list-hidden__item" id="hidden_3"
				style="margin: 0px 1rem 0px 1rem; position: absolute; width: inherit; bottom: -3; z-index: 10; display: none;"
				data-toggle="modal" data-target="#exampleModal" data-whatever="C치과" data-body="내 치과 목록에서 삭제하시겠습니까?">내 치과 목록에 삭제</div>
		</div>
	</c:forEach>

<hr>
<h6 style="padding-top: 2rem; padding-left: 1.5rem;">치과 검색하기</h6>
<div style="padding-left: 2rem; padding-bottom: 0.5rem; width: 92%;">
	<input id="searching-keyword" type="text" placeholder="치과를 등록해보세요." style="width: inherit; margin-right: 0.5rem;">
	<span><i id="submit" class="fas fa-search"></i></span>
</div>

<script>
	let submitIcon = document.getElementById('submit');
	submitIcon.onclick = function() {
		var searchingKeyword = document.getElementById('searching-keyword').value;
		const dennameKey = searchingKeyword;
		location.href = "myDentist?denname=" + searchingKeyword;
		console.log(searchingKeyword);
	}
</script>

<div style="display: flex; flex-direction: column; align-items: center;">
	<c:if test="${searchedDentistList == null}">
		<p>검색된 치과가 없습니다.</p>
	</c:if>
	<c:forEach var="searchedDentist" items="${searchedDentistList}">
		<div style="width: 90%; position: relative;">
			<div class="history-list__item" style="margin-left: 1rem; width: inherit;">
				<div class="item__col">
					<img
						src="/springframework-mini-project/resources/images/signOut.jpg"
						class="round-thumbnail">
				</div>
				<div>
					<div id="denName_3" style="color: rgb(242, 101, 34); font-size: 1.8rem;">${searchedDentist.denname}</div>
					<span class="dentist-visited">${searchedDentist.denaddress}</span>
					<div id="denNoForRegi" style="display:none;">${searchedDentist.denno}</div>
				</div>
				<i class="fa-solid fa-caret-down" style="cursor: pointer;" onclick="handleHidden(event, 'add', ${searchedDentist.denno});"></i>
			</div>
			<div class="history-list-hidden__item" id="hidden_3"
				style="margin: 0px 1rem 0px 1rem; position: absolute; width: inherit; bottom: -3; z-index: 10; display: none;"
				data-toggle="modal" data-target="#exampleModal" data-whatever="C치과" data-body="내 치과 목록에 추가하시겠습니까?">내 치과 목록에 추가</div>
		</div>
	</c:forEach>
	<div>
		<a class="btn btn-outline-primary btn-sm" href="myDentist?denname=${denname}&pageNo=1">처음</a>
		<c:if test="${pager.groupNo>1}">
			<a class="btn btn-outline-info btn-sm" href="myDentist?denname=${denname}&pageNo=${pager.startPageNo-1}">이전</a>
		</c:if>
		
		<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
			<c:if test="${pager.pageNo != i}">
				<a class="btn btn-outline-success btn-sm" href="myDentist?denname=${denname}&pageNo=${i}">${i}</a>
			</c:if>
			<c:if test="${pager.pageNo == i}">
				<a class="btn btn-danger btn-sm" href="myDentist?denname=${denname}&pageNo=${i}">${i}</a>
			</c:if>
		</c:forEach>
		
		<c:if test="${pager.groupNo<pager.totalGroupNo}">
			<a class="btn btn-outline-info btn-sm" href="myDentist?denname=${denname}&pageNo=${pager.endPageNo+1}">다음</a>
		</c:if>
		<a class="btn btn-outline-primary btn-sm" href="myDentist?denname=${denname}&pageNo=${pager.totalPageNo}">맨끝</a>
	</div>
</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
