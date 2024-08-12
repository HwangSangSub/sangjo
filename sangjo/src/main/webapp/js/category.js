/**
 * category.js
 */

const csvc = {
	categorySelectList(categoryName, loadCallback) {
		const xhtp = new XMLHttpRequest();
		xhtp.open('get', 'category.do?categoryName=' + categoryName);
		xhtp.send();
		xhtp.onload = loadCallback;
	},
	productList(cdName, loadCallback) {
		const xhtp = new XMLHttpRequest();
		xhtp.open('get', 'productList.do?cdName=' + cdName);
		xhtp.send();
		xhtp.onload = loadCallback;
	}
}

const categorySelectList = document.querySelectorAll('#categorySelectList');

categorySelectList.forEach((d) => {
	d.addEventListener('click', function() {
		let target = d.getAttribute('data-bs-target');
		let cateLocation = d.parentElement.parentElement.querySelector(target);
		
		let categoryName = d.querySelector('span').innerText;
		csvc.categorySelectList(categoryName, function() {
			// 상위카테고리 선택 완료 => 화면에 선택된 상위카테고리의 세부카테고리 출력.
			//categoryList.innerHTML = "";
			cateLocation.querySelectorAll('div').forEach((c, idx) => {
				if (idx != 0) {
					c.remove();
				}
			});
			console.log(this.response);
			let result = JSON.parse(this.response);
			result.forEach(category => {
				cateLocation.appendChild(cmakeRow(category));
			});
		});
	});

});

function cmakeRow(category = {}) {
	let cloned = document.querySelector('.cloneapse>div').cloneNode(true);
	cloned.setAttribute('data-category-no', category.categoryNo);
	cloned.style.display = 'block';
	cloned.innerText = category.cdName;
	cloned.addEventListener('click', function() {
		csvc.productList(category.cdName, function() {
			// 카테고리 선택 완료 => 화면에 선택된 카테고리의 상품 목록 출력.
			//productList.innerHTML = "";
			productList.querySelectorAll('.col-md-6').forEach((c, idx) => {
				if (idx != 0) {
					c.remove();
				}
			});
			//console.log(this.response);
			let result = JSON.parse(this.response);
			result.forEach(product => {
				productList.appendChild(makeRow(product));
			});
		});
	});
	return cloned;
}


function makeRow(product = {}) {
	let cloned = document.querySelector('#productList>div').cloneNode(true);
	cloned.setAttribute('data-product-no', product.productNo);
	cloned.style.display = 'block';
	cloned.querySelector('.col-md-6>div>div:nth-of-type(2)').innerText = product.cdName;
	cloned.querySelector('.col-md-6>div>div:nth-of-type(3)>h4').innerText = product.productName;
	cloned.querySelector('.col-md-6>div>div:nth-of-type(3)>p').innerText = product.productContent;
	cloned.querySelector('.col-md-6>div>div:nth-of-type(3)>div>p').innerText = product.productPrice+"원";
	return cloned;
}