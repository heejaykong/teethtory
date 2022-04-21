<%@ page contentType="text/html; charset=UTF-8" %>

<aside class="aside">
	    <ul>
	    	<li>
	    		<a id="myDentistRegistrationTab" href="${pageContext.request.contextPath}/myPage/myDentalClinicList">내 치과 등록하기</a>
	    	</li>
	    	<li>
	    		<a id="myPointTab" href="${pageContext.request.contextPath}/myPage/myPagePoint">내 포인트</a>
				<i class="fa-solid fa-p" style="color: rgb(242, 101, 34);">15,000</i>
	    	</li>
	    	<li>
	    		<a id="userInformationEditorTab" href="${pageContext.request.contextPath}/myPage/myInformationEditor">회원정보 수정</a>
	    	</li>
	    	<li>
	    		<a id="signOutTab" href="${pageContext.request.contextPath}/myPage/signOut">회원 탈퇴</a>
	    	</li>
	    	
	    	<li class="mt-5">
	    		<div class="custom-control custom-switch">
				  <input type="checkbox" class="custom-control-input" id="customSwitch1">
				  <label class="custom-control-label" for="customSwitch1">알림 설정</label>
				</div>
	    	</li>
	    </ul>
    </aside>