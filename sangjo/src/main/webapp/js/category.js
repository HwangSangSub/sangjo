/**
 * category.js
 */

const csvc = {
	categorySelectList(categoryName, loadCallback) {
		const xhtp = new XMLHttpRequest();
		xhtp.open('get', 'categoryList.do?categoryName=' + categoryName);
		xhtp.send();
		xhtp.onload = loadCallback;
	}
}


const fas = document.querySelectorAll('.fas');

/*for (let i = 0; i < card.length; i++) {
	card[i].addEventListener('click', function(e) {
		let cdName = e.target.innerHTML;
		console.log(e.target);
		console.log(cdName);
		//console.log(this);
		svc.productList(cdName, function() {
			// 카테고리 선택 완료 => 화면에 선택된 카테고리의 상품 목록 출력.
			//productList.innerHTML = "";
			productList.querySelectorAll('.col-md-6').forEach((c, idx) => {
				if (idx != 0) {
					c.remove();
				}
			});
			console.log(this.response);
			let result = JSON.parse(this.response);
			result.forEach(product => {
				productList.appendChild(makeRow(product));
			});
		});
	});
}*/

document.querySelectorAll('.fas').forEach((d) => {
	d.addEventListener('click', function() {
		let categoryName = d.innerHTML;
		csvc.categorySelectList(categoryName, function() {
			// 상위카테고리 선택 완료 => 화면에 선택된 상위카테고리의 세부카테고리 출력.
			//categoryList.innerHTML = "";
			categorySelectList.querySelectorAll('.collapse').forEach((c, idx) => {
				if (idx != 0) {
					c.remove();
				}
			});
			console.log(this.response);
			let result = JSON.parse(this.response);
			result.forEach(category => {
				categorySelectList.appendChild(makeRow(category));
			});
		});
	});

});

function makeRow(category = {}) {
	let cloned = document.querySelector('#collapse>c>div').cloneNode(true);
	cloned.setAttribute('data-category-no', category.categoryNo);
	cloned.style.display = 'block';
	cloned.querySelector('#collapse>c>div').innerText = category.categoryName;
	return cloned;
}