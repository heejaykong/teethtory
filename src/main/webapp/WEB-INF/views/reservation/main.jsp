<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <script src="https://kit.fontawesome.com/d9e341abda.js" crossorigin="anonymous"></script>
    <style>
.keyword{
    width:15rem;
    height:2rem;
    margin-top:1rem;
}
#face{
   width: 20rem;
   margin-top:5rem;
}
#top{
    display:inline-block;
}

a:link { color: red; text-decoration: none;}
a:visited { color: black; text-decoration: none;}
a:hover { color: orange; }
</style>

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
		const theElement = targetEl.parentNode.parentNode.parentNode.querySelector(".history-list-hidden__item");
		$(targetEl.parentNode.parentNode.parentNode.querySelector(".history-list-hidden__item")).toggle();
		
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

                        <div style="margin-top:20px; margin-left:1rem;font-weight:bold;">
                            <h3>진료 예약하기</h3>
                        </div>
                        <div id="top" class="container">
                            <div>
                            <input id="searching-keyword" class='keyword' type='text' name="search" maxlength=255 value=""placeholder="치과를 검색해 보세요."style="border:0.5px solid lightgrey;">
	                        <span><i id="submit" class="fas fa-search"></i></span>
                            </div>
                        </div>
            
                        <div style="margin-top:1rem; margin-left:1rem;">찾으시는 치과가 없나요?
                            <a href="#">치과 등록을 요청하세요.</a>
                        </div>
                        <script>
                            let submitIcon = document.getElementById('submit');
                            submitIcon.onclick = function() {
                                let searchingKeyword = document.getElementById('searching-keyword').value;
                                location.href = "main?denname=" + searchingKeyword;
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
                                        data-toggle="modal" data-target="#exampleModal" data-whatever="C치과" data-body="예약하시겠습니까?">예약하기</div>
                                </div>
                            </c:forEach>
                        </div>


            <!-- 마이페이지 - 진료예약현황으로 보내기. -->
            <div>
                <img src="/springframework-mini-project/resources/images/ㅠㅠ.png" style="width:100%;">
            </div>

        </section>
   </div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>