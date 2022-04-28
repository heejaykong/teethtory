<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style>
#myDentistRegistrationTab {
	color: rgb(242, 101, 34);
}
</style>
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
	
	function handleHidden(e) {
		const targetEl = e.target;
		const theElement = targetEl.parentNode.parentNode.parentNode.querySelector(".history-list-hidden__item");
		$(targetEl.parentNode.parentNode.parentNode.querySelector(".history-list-hidden__item")).toggle();
		
		const denName = targetEl.parentNode.parentNode.querySelector(".denName");
		const denidvalue = $(targetEl.parentNode.parentNode.querySelector(".denName")).text();
		theElement.dataset.whatever = denidvalue;
	}
	
	function toggleOff(e) {
		const targetEl = e.target;
		$(targetEl).toggle();
	}

</script>

<h4 style="padding-top: 2rem; padding-left: 1.5rem; padding-bottom: 0.5rem;">내 치과 목록</h4>
<div style="display: flex; flex-direction: column; align-items: center;">
	<!-- 1번째 시작  -->
	<div style="width: 90%; position: relative;">
		<div class="history-list__item" style="margin-left: 1rem; width: inherit;">
			<div class="item__col">
				<img
					src="/springframework-mini-project/resources/images/signOut.jpg"
					class="round-thumbnail">
			</div>
			<div>
				<div class="denName" style="color: rgb(242, 101, 34); font-size: 1.8rem;">A치과</div>
				<span class="dentist-visited">서울시 송파구 송이로...</span>
			</div>
			<div style="flex-grow: 1; text-align: right;">
				<img src="/springframework-mini-project/resources/images/dropdownbutton.svg" 
				width="15rem;" style="cursor: pointer;" onclick="handleHidden(event);">
			</div>
		</div>
		<div class="history-list-hidden__item" id="hidden_1"
			style="margin: 0px 1rem 0px 1rem; position: absolute; width: inherit; bottom: -3; z-index: 10; display: none;"
			data-toggle="modal" data-target="#exampleModal" data-body="내 치과 목록에서 삭제하시겠습니까?" onclick="toggleOff(event);">내 치과 목록에서 삭제</div>
	</div>
	<!-- 2번째 시작  -->
	<div style="width: 90%; position: relative;">
		<div class="history-list__item" style="margin-left: 1rem; width: inherit;">
			<div class="item__col">
				<img
					src="/springframework-mini-project/resources/images/signOut.jpg"
					class="round-thumbnail">
			</div>
			<div>
				<div class="denName" style="color: rgb(242, 101, 34); font-size: 1.8rem;">B치과</div>
				<span class="dentist-visited">성남시 수정구 송이로...</span>
			</div>
			<div style="flex-grow: 1; text-align: right;">
				<img src="/springframework-mini-project/resources/images/dropdownbutton.svg" 
				width="15rem;" style="cursor: pointer;" onclick="handleHidden(event);">
			</div>
		</div>
		<div class="history-list-hidden__item"
			style="margin: 0px 1rem 0px 1rem; position: absolute; width: inherit; bottom: -3; z-index: 10; display: none;"
			data-toggle="modal" data-target="#exampleModal" data-body="내 치과 목록에서 삭제하시겠습니까?" onclick="toggleOff(event);">내 치과 목록에서 삭제</div>
	</div>
</div>
<hr>
<h6 style="padding-top: 2rem; padding-left: 1.5rem;">치과 추가하기</h6>
<div style="padding-left: 2rem; padding-bottom: 0.5rem; width: 92%;">
	<input id="" type="text" placeholder="내 치과를 검색해보세요" style="width: inherit; margin-right: 0.5rem;"><span><i class="fas fa-search"></i></span>
</div>
<div style="display: flex; flex-direction: column; align-items: center;">
	<!-- 1번째 시작  -->
	<div style="width: 90%; position: relative;">
		<div class="history-list__item" style="margin-left: 1rem; width: inherit;">
			<div class="item__col">
				<img
					src="/springframework-mini-project/resources/images/signOut.jpg"
					class="round-thumbnail">
			</div>
			<div>
				<div id="denName_3" style="color: rgb(242, 101, 34); font-size: 1.8rem;">C치과</div>
				<span class="dentist-visited">서울시 송파구 파송로...</span>
			</div>
			<div style="flex-grow: 1; text-align: right;">
				<img src="/springframework-mini-project/resources/images/dropdownbutton.svg"
				width="15rem;" style="cursor: pointer;" onclick="$('#hidden_3').toggle();">
			</div>
		</div>
		<div class="history-list-hidden__item" id="hidden_3"
			style="margin: 0px 1rem 0px 1rem; position: absolute; width: inherit; bottom: -3; z-index: 10; display: none;"
			data-toggle="modal" data-target="#exampleModal" data-whatever="C치과" data-body="내 치과 목록에 추가하시겠습니까?">내 치과 목록에 추가</div>
	</div>
	<!-- 2번째 시작  -->
	<div style="width: 90%; position: relative;">
		<div class="history-list__item" style="margin-left: 1rem; width: inherit;">
			<div class="item__col">
				<img
					src="/springframework-mini-project/resources/images/signOut.jpg"
					class="round-thumbnail">
			</div>
			<div>
				<div style="color: rgb(242, 101, 34); font-size: 1.8rem;">D치과</div>
				<span class="dentist-visited">성남시 수정구 수정로...</span>
			</div>
			<div style="flex-grow: 1; text-align: right;">
				<img src="/springframework-mini-project/resources/images/dropdownbutton.svg" 
				width="15rem;" style="cursor: pointer;" onclick="$('#hidden_4').toggle();">
			</div>
		</div>
		<div class="history-list-hidden__item" id="hidden_4"
			style="margin: 0px 1rem 0px 1rem; position: absolute; width: inherit; bottom: -3; z-index: 10; display: none;"
			data-toggle="modal" data-target="#exampleModal" data-whatever="D치과" data-body="내 치과 목록에 추가하시겠습니까?">내 치과 목록에 추가</div>
	</div>
</div>

    	</section>
   	</div>


<%@ include file="/WEB-INF/views/common/footer.jsp"%>