<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/views/common/meta.jsp"%>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/default-form.css" />
<title>치스토리-(이스터에그)</title>
</head>
<style>
	h2 {
		font-size: 1.4rem;
	    font-weight: 600;
	    color: var(--almost-black-gray);
	}
	
	#price{
		margin: 3.5rem 0 2rem 0;
	}
	
	.ranking {
		margin: 2rem 0 0 0;
	}
</style>
<body style="text-align: center;">
	<main class="located-at-bottom-of-header">
		<div class="logo">
			<a href="${pageContext.request.contextPath}/">
				<h1 class="logo-text-orange-lg">치스토리</h1>
			</a>
		</div>
	</main>
	<div>
		<h2 class="page-title">지금까지 ${name}님이</h2>
		<h2>치아에 총 투자한 금액은?</h2>
	</div>

	<!-- 밑줄 넣기 -->
	<h1 class="logo-text-orange-lg" id="price"></h1>
	
	<button class="btn-large-solid" id="test">카톡으로 공유하기</button>
	<hr>
	<div>
		<h2 class="page-title">지금까지 ${name}님이</h2>
		<h2>가장 정성을 쏟은 치아는?</h2>
	</div>
	<h1 class="logo-text-orange-lg ranking" id="first">🥇{1등치아}</h1>
	<h1 class="logo-text-orange-lg ranking" id="second">🥈{2등치아}</h1>
	<h1 class="logo-text-orange-lg ranking" id="third">🥉{3등치아}</h1>
</body>



<script>
	console.log(${myDentistList});
	getData();
	let allCost = 0;
	function windowdd() {
		let myDentistList = ${myDentistList}.myDentistList;
		
		const promise = new Promise((resolve, reject) => {
			let list = [];
			let allCost = 0;
			var toothRankMap = new Map();
			// var sortedToothRankMap = new Map();
			// var toothRankObj = {};
			// var innerTop3ToothnoList = [];
			// 사용자의 모든 '내 치과'에 예약정보를 확인해서 받아오는 통신.
			for(let i=0; i < myDentistList.length; i++) {
				$.ajax({
					url: "http://localhost:" + myDentistList[i].dendomain + "/springframework-mini-project-dentist/treatment/easteregg",
					method:"POST",
					async: false,
					data: {
						patientssn: "${patientssn}"
					}
				})
				.done((data) => {
					console.log(data);
					//전체 가격 더하는 반복문
					data.list.forEach((element) => {
						allCost += element.treatcost;
					})
					//전체 치아 순위 구하는 반복문
					data.toothno.forEach((element) => {
						console.log('data.toothno : ' + element["toothno"]);
						list.push(element);
					})
					console.log('list : ' + list);
					console.log('list[0]["toothno"] : ' + list[0]["toothno"]);
					//list를 치아 갯수만큼 반복문 돌면서 카운팅.
					// const toothRankObj = {}; //더 상단에 전역변수로 선언해야 함.
					console.log('for(let i=0; i<list.length; i++) 시작~~');
					for(let i=0; i<list.length; i++) {
						console.log('list[' + i + ']["toothno"] : ' + list[i]["toothno"]);
						console.log('toothRankMap.has(list[i]["toothno"] : ' + toothRankMap.has(list[i]["toothno"]));
						// console.log('toothRankObj.hasOwnProperty(list[i]["toothno"] : ' + toothRankObj.hasOwnProperty(list[i]["toothno"]));
						if(toothRankMap.has(list[i]["toothno"])) {
							console.log('Map contains key1');
							//이미 해당 toothno를 key로 하는 원소가 있으므로, key에 대한 value를 찾아서 +1.
							toothRankMap.set(list[i]["toothno"], toothRankMap.get(list[i]["toothno"]) + 1);
							// toothRankObj[list[i]["toothno"]] = toothRankObj[list[i]["toothno"]] + 1;
							// console.log('toothRankObj[list[' + i + ']["toothno"]] : ' + toothRankObj[list[i]["toothno"]]);
						} else {
							//toothno를 key로 하고, value가 1인 원소를 생성.
							toothRankMap.set(list[i]["toothno"], 1);
							// toothRankObj[list[i]["toothno"]] = 1;
						}
					}
				});
			}			
			// toothRankMap.forEach((value, key, mapObject) => {
			// 	console.log('toothRankMap.forEach');
			// 	console.log(key + ' : ' + value);
			// 	// console.log('value : ' + value);
			// 	// console.log('typeof value : ' + typeof value);
			// 	// console.log('Math.max(...toothRankMap.values()) : ' + Math.max(...toothRankMap.values()));
			// 	// console.log('typeof Math.max(...toothRankMap.values()) : ' + typeof Math.max(...toothRankMap.values()));
			// 	// console.log('value === Math.max(...toothRankMap.values()) : ' + value === Math.max(...toothRankMap.values()));
			// 	//toothRankMap를 value기준으로 내림차순 정렬.

			// });
			const sortedToothRankMap = new Map( [...toothRankMap.entries()].sort((a, b) => b[1] - a[1]) );
			console.log('sortedToothRankMap : ' + sortedToothRankMap);
			console.log('typeof sortedToothRankMap : ' + typeof sortedToothRankMap);
			console.log('sortedToothRankMap.size : ' + sortedToothRankMap.size);
			let keys = Array.from(sortedToothRankMap.keys());
			if(sortedToothRankMap.size >= 3) {//toothno의 종류가 3가지 이상인 경우.
				for(let i=0; i<3; i++) {
					console.log('keys[' + i + '] : ' + keys[i]);
				}
			} else {//toothno의 종류가 2가지 미만인 경우.
				for(let i=0; i<keys.length; i++) {
					console.log('keys[' + i + '] : ' + keys[i]);
					if(i === 0) {
						$('#first').html("🥇 " + keys[i] + "번");
					} else if(i === 1) {
						$('#second').html("🥈 " + keys[i] + "번");
					} else {
						$('#third').html("🥉 " + keys[i] + "번");
					}
				}
			}


			list.push(allCost);
			if(list != null) {
				console.log(allCost);
				resolve(list);
			} else {
				reject({message: "실패"});
			}
			
		});
		return promise;
	}
	
	async function getData() {
		try {
			let data = await windowdd();
			console.log(data);
			$("#price").html(data[data.length - 1].toLocaleString() + "원");
			
			console.log("after", data);
			
 			for(let i=0; i < data.length - 1; i++) {
				console.log('data[' + i + '] : ' + data[i]);
			}

			// $("#first").html(🥇);
			// $("#second").html(🥈 + "data.toothno[1].treatno");
			// $("#third").html(🥉 + "data.toothno[2].treatno");
		} catch (error) {
			console.log(error, "error");
		} finally {
			
		}
	}

	Kakao.init('722eeaf26a4e1f0ba38f274b71d6e0c3');
	console.log(Kakao.isInitialized());
	Kakao.Link.createDefaultButton({
				container : '#test',
				objectType : 'feed',
				content : {
					title : '비용 공유',
					description : '아메리카노, 빵, 케익',
					imageUrl : "${pageContext.request.contextPath}/resources/images/easteregg/kt.png",
					link : {
						mobileWebUrl : 'http://192.168.1.129:8081/springframework-mini-project/easteregg',
						androidExecutionParams : 'test',
					},
				},
				itemContent : {
					profileText : 'Kakao',
					profileImageUrl : 'https://mud-kage.kakao.com/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png',
					titleImageUrl : 'https://mud-kage.kakao.com/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png',
					titleImageText : 'Cheese cake',
					titleImageCategory : 'Cake',
					items : [ {
						item : 'Cake1',
						itemOp : '1000원',
					}, {
						item : 'Cake2',
						itemOp : '2000원',
					}, {
						item : 'Cake3',
						itemOp : '3000원',
					}, {
						item : 'Cake4',
						itemOp : '4000원',
					}, {
						item : 'Cake5',
						itemOp : '5000원',
					}, ],
					sum : 'Total',
					sumOp : '15000원',
				},

				buttons : [
						{
							title : '웹으로 이동',
							link : {
								mobileWebUrl : 'http://192.168.1.129:8081/springframework-mini-project/easteregg',
							},
						},
						{
							title : '앱으로 이동',
							link : {
								mobileWebUrl : 'http://192.168.1.129:8081/springframework-mini-project/easteregg',
							},
						}, ]
			});

</script>

</html>
