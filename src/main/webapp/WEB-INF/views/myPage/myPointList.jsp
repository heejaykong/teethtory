<%@ page session="false" language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<script src="https://kit.fontawesome.com/d9e341abda.js" crossorigin="anonymous"></script>
<style>
	#myPointTab {
		color: rgb(242, 101, 34);
	}
	.fa-coins{
	color:  #ffa048;

	}
</style>
<div class="d-flex">


	<div class="col-sm-10">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" href="#">포인트 내역</a>
		</nav>
		<div style="margin-top:2rem;"><h3>내 포인트</h3></div>
		<div class="container" style="display:flex; flex-direction:row; text-decoration:none; color:#ffa048;">
		<div style="margin-right:1rem; margin-left:-1rem;">
		<i class="fa-solid fa-coins"></i>
		</div>
		<div><h2>4,600</h2></div>
		</div>
		<div>
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
			    <ul class="navbar-nav">
					<!-- <li id="list_total" class="nav-item active"> -->
					<div class="container" style="display:flex; flex-direction:row;">
					<div style="margin-right:1rem;">
					<li id="list_total" class="nav-item">
					  <!-- <a class="nav-link" href="#" onClick="DisplayList(list_items, list_element, rows, current_page), SetupPagination(list_items, pagination_element, rows)">전체<span class="sr-only">(current)</span></a> -->
					  <a class="nav-link" href="#" onClick="list_active('list_total'), DisplayList(list_items, list_element, rows, current_page), SetupPagination(list_items, pagination_element, rows)">전체<span class="sr-only">(current)</span></a>
					</li>
					</div>
					<div style="margin-right:1rem;">
					<li id="list_got" class="nav-item">
					  <a class="nav-link" href="#" onClick="list_active('list_got'), DisplayList(list_got_items, list_element, rows, current_page), SetupPagination(list_got_items, pagination_element, rows)">획득</a>
					</li>
					</div>
					<div style="margin-right:1rem;">
					<li id="list_used" class="nav-item">
					  <a class="nav-link" href="#" onClick="list_active('list_used'), DisplayList(list_used_items, list_element, rows, current_page), SetupPagination(list_used_items, pagination_element, rows)">사용</a>
					</li>
					</div>
			     </ul>
			</nav>
		</div>
		<table class="table">
		  <thead class="thead-light">
		    <tr>
		      <th scope="col">포인트</th>
		      <th scope="col" colspan="2">적립 구분</th>
		      <th scope="col">날짜</th>
		    </tr>
		  </thead>
		  <tbody id="list">
		   <!--  <tr>
		      <td>+100</td>
		      <td class="left" colspan="2">로그인 포인트</td>
		      <td>2022.04.16</td>
		    </tr>
		    <tr>
		      <td>-10,000</td>
		      <td class="left" colspan="2">스케일링 할인</td>
		      <td>2022.04.16</td>
		    </tr> -->
		  </tbody>
		</table>
		
		<nav aria-label="Page navigation example">
		  <ul class="pagination justify-content-center">
		    <li class="page-item disabled">
		      <a class="page-link">이전으로</a>
		    </li>
		    <li>
			    <div class="pagenumbers" id="pagination" style="display: flex; flex-wrap: wrap;">
			    </div>
		    </li>
<!-- 		    <li class="page-item"><a class="page-link" href="#">2</a></li>
		    <li class="page-item"><a class="page-link" href="#">5</a></li> -->
		    <li class="page-item">
		      <a class="page-link" href="#">다음으로</a>
		    </li>
		  </ul>
		</nav>
	</div>
</div>

<script>
function list_active(list_id) {
	let list = document.getElementById(list_id);
	list.setAttribute("class", "active");
	
	let list_total_element = document.getElementById("list_total");
	let list_got_element = document.getElementById("list_got");
	let list_used_element = document.getElementById("list_used");
	//사용 안 하는 탭들 active 속성 제거.
	if(list_id === "list_total") {
		list_got_element.removeAttribute("class", "active");
		list_used_element.removeAttribute("class", "active");
	} else if(list_id === "list_got") {
		list_total_element.removeAttribute("class", "active");
		list_used_element.removeAttribute("class", "active");
	} else if(list_id === "list_used") {
		list_total_element.removeAttribute("class", "active");
		list_got_element.removeAttribute("class", "active");
	}
}

const list_items = [
	{point:"+100", category:"로그인 포인트", date:"2022.04.16"},
	{point:"-10,000", category:"스케일링 할인", date:"2022.04.16"}
];
for(let i=0; i<40; i++) {
	list_items.push({point:"+100", category:"로그인 포인트", date:"2022.04.16"});
}

const list_got_items = [
	
];
for(let i=0; i<41; i++) {
	list_got_items.push({point:"+100", category:"로그인 포인트", date:"2022.04.16"});
}

const list_used_items = [
	{point:"-10,000", category:"스케일링 할인", date:"2022.04.16"}
];

const list_element = document.getElementById('list');
const pagination_element = document.getElementById('pagination');
let current_page = 1;
let rows = 10;

function DisplayList (items, pagination_wrapper, rows_per_page, page) {
	pagination_wrapper.innerHTML = "";
	page--;

	let start = rows_per_page * page;
	let end = start + rows_per_page;
	let paginatedItems = items.slice(start, end);

	for (let i = 0; i < paginatedItems.length; i++) {
		let item = paginatedItems[i];
		
		let item_element = document.createElement('tr');
		let point_element = document.createElement('td');
		point_element.innerHTML = item.point;
		let category_element = document.createElement('td');
		category_element.setAttribute("class", "left");
		category_element.setAttribute("colspan", "2");
		category_element.innerHTML = item.category;
		let date_element = document.createElement('td');
		date_element.innerHTML = item.date;
      
		item_element.appendChild(point_element);
		item_element.appendChild(category_element);
		item_element.appendChild(date_element);
		pagination_wrapper.appendChild(item_element);
	}
}

function SetupPagination (items, pagination_wrapper, rows_per_page) {
	pagination_wrapper.innerHTML = "";

	let page_count = Math.ceil(items.length / rows_per_page);
	for (let i = 1; i < page_count + 1; i++) {
		let btn = PaginationButton(i, items);
		/* btn.appendChild(btn_link); */
		pagination_wrapper.appendChild(btn);
	}
}

function PaginationButton (page, items) {
	let button = document.createElement('li');
	button.setAttribute("class", "page-item");
	let button_link = document.createElement('a');
	button_link.setAttribute("class", "page-link");
	button_link.innerText = page;
	button.appendChild(button_link);

	if (current_page == page) button.classList.add('active');

	button_link.addEventListener('click', function () {
		current_page = page;
		DisplayList(items, list_element, rows, current_page);

		let current_btn = document.querySelector('.pagenumbers li.active');
		current_btn.classList.remove('active');

		button.classList.add('active');
	});

	return button;
}

list_active("list_total");
DisplayList(list_items, list_element, rows, current_page);
SetupPagination(list_items, pagination_element, rows);
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>