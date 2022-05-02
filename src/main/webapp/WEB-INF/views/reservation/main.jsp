<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
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
                                var searchingKeyword = document.getElementById('searching-keyword').value;
                                console.log(searchingKeyword);
                                location.href = "main?denname=" + searchingKeyword;
                            }
                        </script>

                        <div style="display: flex; flex-direction: column; align-items: center;">
                            <c:if test="${searchedDentistList == null}">
                                <p>검색된 치과가 없습니다.</p>
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
                            <div>
                            <a class="btn btn-outline-primary btn-sm" href="myPointList?pageNo=1">처음</a>
                            <c:if test="${pager.groupNo>1}">
                                <a class="btn btn-outline-info btn-sm" href="myPointList?pageNo=${pager.startPageNo-1}">이전</a>
                            </c:if>
                            
                            <c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
                                <c:if test="${pager.pageNo != i}">
                                    <a class="btn btn-outline-success btn-sm" href="myPointList?pageNo=${i}">${i}</a>
                                </c:if>
                                <c:if test="${pager.pageNo == i}">
                                    <a class="btn btn-danger btn-sm" href="myPointList?pageNo=${i}">${i}</a>
                                </c:if>
                            </c:forEach>
                            
                            <c:if test="${pager.groupNo<pager.totalGroupNo}">
                                <a class="btn btn-outline-info btn-sm" onClick="get_list(${pager.endPageNo+1})">다음</a>
                            </c:if>
                            <a class="btn btn-outline-primary btn-sm"  onClick="get_list(${pager.totalPageNo})">맨끝</a>
                        </div>
                        <script>
                            function get_list(pageNo) {
	                            location.href = "main?denname=" + searchingKeyword  +"&pageNo=" + pageNo;
                            }   

                            function goReservationUsingMap(denno) {
                                console.log(denno);
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

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
