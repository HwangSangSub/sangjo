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

// Add to cart 버튼을 누르면 실행되는 이벤트
// onclick 이벤트를 활용하여 실행하면된다 (매개변수로 제품 번호와, 제품 이름을 입력받는다.)
function addCartEvent(productNo, productName){
	let cartListVO = {
		productNo : productNo,
		productName : productName,
		memberId : memberId,
	}
	addCart(cartListVO);
}

// http 요청을 보내는 함수 실질적으로 정보를 입력한다.
function addCart(cartListVO){
	let url = "cartAdd.do";
	let optionObj = {
		method: 'post',
		headers: {
			'Content-Type': 'application/json'
		},
		body: JSON.stringify(
			cartListVO
		)
	}
	fetch(url,optionObj)
	.then(result => {
		return result.json();
	})
	.then(function(result){
		if(result.addCart == "Faild"){
			alert("장바구니에 "+cartListVO.productName+"추가가 실패하였습니다.");
		}else{
			alert("장바구니에 "+cartListVO.productName+"추가가 완료되었습니다.")
		}
	});
}