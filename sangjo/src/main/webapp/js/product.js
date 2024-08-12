/**
 * product.js
 */

const svc = {
	productList(cdName, loadCallback) {
		const xhtp = new XMLHttpRequest();
		xhtp.open('get', 'productList.do?cdName=' + cdName);
		xhtp.send();
		xhtp.onload = loadCallback;
	}
}


const card = document.querySelectorAll('.card');

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

document.querySelectorAll('.card').forEach((d) => {
	d.addEventListener('click', function() {
		let cdName = d.innerHTML;
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

});

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