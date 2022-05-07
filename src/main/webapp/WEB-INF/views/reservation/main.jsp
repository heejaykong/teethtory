<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	
	<%@ include file="/WEB-INF/views/common/loading.jsp" %>
	<%@ include file="/WEB-INF/views/common/meta.jsp" %>
	<title>치스토리-진료 예약하기</title>
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
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
    <div class="located-at-bottom-of-header">
                        <div style="margin-top:1rem; margin-left:1rem;font-weight:bold;">
                            <h3>진료 예약하기</h3>
                        </div>
                        <div id="top" class="container">
                            <div >
                            <input id="searching-keyword" class='keyword' type='text' name="search" maxlength=255 value=""placeholder="치과를 검색해 보세요."style="border:0.5rem solid lightgrey;">
	                        <span style="margin-left:-2rem;"><i id="submit" class="fas fa-search"></i></span>
                            </div>
                        </div>
            
                        <div style="margin-top:1rem; margin-left:1rem;">찾으시는 치과가 없나요?
                            <a href="${pageContext.request.contextPath}/myPage/myDentist">치과 등록을 요청하세요.</a>
                        </div>
                        <script>
                            let submitIcon = document.getElementById('submit');
                            submitIcon.onclick = function() {
                                var searchingKeyword = document.getElementById('searching-keyword').value;
                                window.localStorage.setItem('searchingKeyword_LS', searchingKeyword);
                                console.log(searchingKeyword);
                                location.href = "main?denname=" + searchingKeyword;
                            }
                        </script>

                        <div style="display: flex; flex-direction: column; align-items: center;">
                        
                            <c:if test="${searchedDentistList == null}">
                            <!-- 여기에 기본으로 자기 치과를 띄워주면 될 듯  -->
                                <c:forEach var="myDentistList" items="${myDentistList}">
                                <div id="a-dentist" style="width: 90%; position: relative; margin-top:1rem;"
                                    onclick="goReservationUsingMap(${myDentistList.denno});">
                                    <div class="history-list__item" style=" width: inherit;">
                                        <!--
                                        <div class="item__col">
                                            <img
                                                src="/springframework-mini-project/resources/images/signOut.jpg"
                                                class="round-thumbnail">
                                        </div>
                                        -->
                                        <div>
                                            <div id="denName_3" style="color: rgb(242, 101, 34); font-size: 1.8rem;">${myDentistList.denname}</div>
                                            <span class="dentist-visited">${myDentistList.denaddress}</span>
                                            <div id="denNo" style="display:none;">${myDentistList.denno}</div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            </c:if>
                            <c:forEach var="searchedDentist" items="${searchedDentistList}">
                                <div id="a-dentist" style="width: 90%; position: relative; border: solid 0.1rem; border-color: grey; border-radius: 10%"
                                    onclick="goReservationUsingMap(${searchedDentist.denno});">
                                    <div class="history-list__item" style="margin-left: 1rem; width: inherit;">
                                        <!--
                                        <div class="item__col">
                                            <img
                                                src="/springframework-mini-project/resources/images/signOut.jpg"
                                                class="round-thumbnail">
                                        </div>
                                        -->
                                        <div>
                                            <div id="denName_3" style="color: rgb(242, 101, 34); font-size: 1.8rem;">${searchedDentist.denname}</div>
                                            <span class="dentist-visited">${searchedDentist.denaddress}</span>
                                            <div id="denNo" style="display:none;">${searchedDentist.denno}</div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                            <div style="margin-top:1rem; text-align: center;">
                            <a class="btn btn-outline-primary btn-sm" onClick="get_list(1)">처음</a>
                            <c:if test="${pager.groupNo>1}">
                                <a class="btn btn-outline-info btn-sm" onClick="get_list(${pager.startPageNo-1})">이전</a>
                            </c:if>
                            
                            <c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
                                <c:if test="${pager.pageNo != i}">
                                    <a class="btn btn-outline-success btn-sm" onClick="get_list(${i})">${i}</a>
                                </c:if>
                                <c:if test="${pager.pageNo == i}">
                                    <a class="btn btn-danger btn-sm" onClick="get_list(${i})">${i}</a>
                                </c:if>
                            </c:forEach>
                            
                            <c:if test="${pager.groupNo<pager.totalGroupNo}">
                                <a class="btn btn-outline-info btn-sm" onClick="get_list(${pager.endPageNo+1})">다음</a>
                            </c:if>
                            <c:if test="${pager.totalGroupNo == null}">
                                <a class="btn btn-outline-primary btn-sm">맨끝</a>
                            </c:if>
                            <c:if test="${pager.totalGroupNo != null}">
                                <a class="btn btn-outline-primary btn-sm"  onClick="get_list(${pager.totalPageNo})">맨끝</a>
                            </c:if>
                        </div>
                        <script>
                            function get_list(pageNo) {
	                            location.href = "main?denname=" + window.localStorage.getItem('searchingKeyword_LS')  +"&pageNo=" + pageNo;
                            }   

                            function goReservationUsingMap(denno) {
                                console.log(denno);
                                localStorage.setItem("denno", denno);
                                location.href = "reservationUsingMap?denno=" + denno;
                            }
                        </script>

            <!-- 마이페이지 - 진료예약현황으로 보내기. -->
            <!--
            <div>
                <img src="/springframework-mini-project/resources/images/ㅠㅠ.png" style="width:100%;">
            </div>
            -->

        </section>
   </div>
</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
