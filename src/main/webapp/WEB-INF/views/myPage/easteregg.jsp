<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/meta.jsp" %>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/default-form.css">
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<style>
	.hiddenMS {
		font-size: 30px;
	}
	
	h1 {
		font-size: 90px;
	}
</style>
<div style="text-align: center;" class="mt-5">
<div id="priceId" class="hiddenMS">지금까지 님이</div>
<div class="hiddenMS mb-5">치아에 총 투자한 금액은?</div>

<h1 id="price" class="mb-5"><span style="border-bottom: 2px solid; color: orange;">2,000,000,000원</span></h1>
</div>
<input type="button" id="test" value="Custom"/>




<script>
$.ajax({
	url:"http://localhost:8082/springframework-mini-project-dentist/availablehour/getHour?date=" + aformatDate
})
	.done((data) => {





Kakao.init('722eeaf26a4e1f0ba38f274b71d6e0c3'); 
console.log(Kakao.isInitialized());
Kakao.Link.createDefaultButton({
	container: '#test',
    objectType: 'feed',
	  content: {
	    title: '비용 공유',
	    description: '아메리카노, 빵, 케익',
	    imageUrl:
	      'https://mud-kage.kakao.com/dn/NTmhS/btqfEUdFAUf/FjKzkZsnoeE4o19klTOVI1/openlink_640x640s.jpg',
	    link: {
	      mobileWebUrl: 'http://192.168.1.129:8081/springframework-mini-project/easteregg',
	      androidExecutionParams: 'test',
	    },
	  },
	  itemContent: {
	    profileText: 'Kakao',
	    profileImageUrl: 'https://mud-kage.kakao.com/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png',
	    titleImageUrl: 'https://mud-kage.kakao.com/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png',
	    titleImageText: 'Cheese cake',
	    titleImageCategory: 'Cake',
	    items: [
	      {
	        item: 'Cake1',
	        itemOp: '1000원',
	      },
	      {
	        item: 'Cake2',
	        itemOp: '2000원',
	      },
	      {
	        item: 'Cake3',
	        itemOp: '3000원',
	      },
	      {
	        item: 'Cake4',
	        itemOp: '4000원',
	      },
	      {
	        item: 'Cake5',
	        itemOp: '5000원',
	      },
	    ],
	    sum: 'Total',
	    sumOp: '15000원',
	  },
	  
	  buttons: [
	    {
	      title: '웹으로 이동',
	      link: {
	        mobileWebUrl: 'http://192.168.1.129:8081/springframework-mini-project/easteregg',
	      },
	    },
	    {
	      title: '앱으로 이동',
	      link: {
	        mobileWebUrl: 'http://192.168.1.129:8081/springframework-mini-project/easteregg',
	      },
	    },
	  ]
	});

  
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%> 