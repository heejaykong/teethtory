function list_active(list_id) {
	let list = window.document.querySelector('#'+list_id);
	list.addAttribute("active");
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

//DisplayList(list_items, list_element, rows, current_page);
//SetupPagination(list_items, pagination_element, rows);