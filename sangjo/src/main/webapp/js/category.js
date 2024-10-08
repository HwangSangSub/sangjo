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
	},
	searchProductList(keyword, cdName, loadCallback) {
		const xhtp = new XMLHttpRequest()
		let url = "productList.do";

		if (keyword != null) {
			url += '?keyword=' + keyword;
		}

		// 값이 가변형태 (있을때도 있고 없을때도 있는 값)
		if (cdName != null) {
			url += '&cdName=' + cdName;
		}

		if (orderValue != null) {
			url += '&order=' + encodeURIComponent(orderValue); // 정렬 값 추가
		}

		xhtp.open('get', url);
		xhtp.send();
		xhtp.onload = loadCallback;
	},
	sortingDate(keyword, cdName, orderValue, loadCallback) {
		const xhtp = new XMLHttpRequest()
		let url = "productList.do";

		if (keyword != null) {
			url += '?keyword=' + keyword;
		}

		// 값이 가변형태 (있을때도 있고 없을때도 있는 값)
		if (cdName != null) {
			url += '&cdName=' + cdName;
		}

		if (orderValue != null) {
			url += '&order=' + encodeURIComponent(orderValue); // 정렬 값 추가
		}

		xhtp.open('get', url);
		xhtp.send();
		xhtp.onload = loadCallback;
	}
}

document.querySelector('#fruits').addEventListener('change', function() {
	let selectedOrder = this.value; // 선택된 정렬 옵션 값 가져오기
	let keyword = document.querySelector('#keyword').value;
	let cdName = document.querySelector('#nowCdName').value
	
	let orderValue;
	if (selectedOrder === 'latest') {
		orderValue = '1';
	} else if (selectedOrder === 'lowPrice') {
		orderValue = '2';
	} else if (selectedOrder === 'highPrice') {
		orderValue = '3';
	}
	document.querySelector('#fruits').value = selectedOrder;
	// 검색 요청에 정렬 값을 추가
	csvc.sortingDate(keyword, cdName, orderValue, function() {
		productList.querySelectorAll('.col-md-6').forEach((c, idx) => {
			if (idx != 0) {
				c.remove();
			}
		});
		let rs = JSON.parse(this.response);
		let list = rs.list;
		list.forEach(product => {
			productList.appendChild(makeRow(product));
		});
	});
});


document.querySelector('#search-icon-1').addEventListener('click', function() {
	let keyword = document.querySelector('#keyword').value;
	let cdName = document.querySelector('#nowCdName').value;
	let selectedOrder = document.querySelector('#fruits').value
	let orderValue;
	if (selectedOrder === 'latest') {
		orderValue = '1';
	} else if (selectedOrder === 'lowPrice') {
		orderValue = '2';
	} else if (selectedOrder === 'highPrice') {
		orderValue = '3';
	}

	csvc.sortingDate(keyword, cdName, orderValue, function() {
		// 검색기
		productList.querySelectorAll('.col-md-6').forEach((c, idx) => {
			if (idx != 0) {
				c.remove();
			}
		});
		let rs = JSON.parse(this.response);
		let list = rs.list;
		list.forEach(product => {
			productList.appendChild(makeRow(product));
		});
	});
});


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
		// 세부카테고리를 클릭할때 현재 어떤 상품카테고리를 보고 있는지 넣기 위한 코드 
		document.querySelector('#nowCdName').value = category.cdName;
		csvc.productList(category.cdName, function() {
			// 카테고리 선택 완료 => 화면에 선택된 카테고리의 상품 목록 출력.
			//productList.innerHTML = "";
			productList.querySelectorAll('.col-md-6').forEach((c, idx) => {
				if (idx != 0) {
					c.remove();
				}
			});
			let rs = JSON.parse(this.response);
			let list = rs.list;
			list.forEach(product => {
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
	//작업 > 이미지 복사해서 경로 추가하기.
	cloned.querySelector('.col-md-6>div>div:nth-of-type(1)>img').src = "img/product/" + product.productImg;
	cloned.querySelector('.col-md-6>div>div:nth-of-type(2)').innerText = product.cdName;
	let productName;
	if (product.productName.length > 26) {
		productName = product.productName.substr(0, 25) + '...';
	} else {
		productName = product.productName;
	}
	cloned.querySelector('.col-md-6>div>div:nth-of-type(3)>h4').innerText = productName;
	//cloned.querySelector('.col-md-6>div>div:nth-of-type(3)>p').innerText = product.productContent;
	let productPrice;
	if (product.productPrice.length > 3) {
		productPrice = product.productPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	} else {
		productPrice = product.productPrice;
	}
	cloned.querySelector('.col-md-6>div>div:nth-of-type(3)>div>p').innerText = productPrice + "원";
	//cloned.querySelector('.col-md-6>div>div:nth-of-type(3)>div>p').innerText = product.productPrice + "원";
	cloned.querySelector('.col-md-6>div>div:nth-of-type(1)>img').addEventListener('click', function() {
		productInfo(product.productNo);
	});
	cloned.querySelector('.col-md-6>div>div:nth-of-type(3)>h4').addEventListener('click', function() {
		productInfo(product.productNo);
	});
	cloned.querySelector('.col-md-6>div>div:nth-of-type(3)>div>button').addEventListener('click', function() {
		let cartListVO = {
			productNo: product.productNo,
			memberId: memberId
		}
		addCart(cartListVO);
	});
	return cloned;
}
document.querySelectorAll('#orgProductList').forEach(item => {
	let productNo = item.dataset.productNo;
	item.querySelector('.col-md-6>div>div:nth-of-type(1)>img').addEventListener('click', function() {
		productInfo(productNo);
	});
	item.querySelector('.col-md-6>div>div:nth-of-type(3)>h4').addEventListener('click', function() {
		productInfo(productNo);
	});
});

const prevElement = document.querySelector('.prev');
if (prevElement) {
	prevElement.addEventListener('click', function() {
		let keyword = document.querySelector('#keyword').value;
		let cdName = document.querySelector('#nowCdName').value;
		let selectedOrder = document.querySelector('#fruits').value;
		let startPage = document.querySelector('#startPage').value;
		let orderValue;
		if (selectedOrder === 'latest') {
			orderValue = '1';
		} else if (selectedOrder === 'lowPrice') {
			orderValue = '2';
		} else if (selectedOrder === 'highPrice') {
			orderValue = '3';
		}
		location.href = "index.do?keyword=" + keyword + "&cdName=" + cdName + "&order=" + orderValue + "&page=" + startPage;
	});
}
document.querySelectorAll('.pageNum').forEach(item => {
	item.addEventListener('click', function() {
		let keyword = document.querySelector('#keyword').value;
		let cdName = document.querySelector('#nowCdName').value;
		let selectedOrder = document.querySelector('#fruits').value;
		let page = this.dataset.page;
		let orderValue;
		if (selectedOrder === 'latest') {
			orderValue = '1';
		} else if (selectedOrder === 'lowPrice') {
			orderValue = '2';
		} else if (selectedOrder === 'highPrice') {
			orderValue = '3';
		}
		location.href = "index.do?keyword=" + keyword + "&cdName=" + cdName + "&order=" + orderValue + "&page=" + page;
	});
});


const nextElement = document.querySelector('.next');
if (nextElement) {
	nextElement.addEventListener('click', function() {
		let keyword = document.querySelector('#keyword').value;
		let cdName = document.querySelector('#nowCdName').value;
		let selectedOrder = document.querySelector('#fruits').value;
		let endPage = document.querySelector('#endPage').value;
		let orderValue;
		if (selectedOrder === 'latest') {
			orderValue = '1';
		} else if (selectedOrder === 'lowPrice') {
			orderValue = '2';
		} else if (selectedOrder === 'highPrice') {
			orderValue = '3';
		}
		location.href = "index.do?keyword=" + keyword + "&cdName=" + cdName + "&order=" + orderValue + "&page=" + endPage;
	});
}
function productInfo(productNo) {
	location.href = "productInfo.do?productNo=" + productNo;
}
// Add to cart 버튼을 누르면 실행되는 이벤트
// onclick 이벤트를 활용하여 실행하면된다 (매개변수로 제품 번호와, 제품 이름을 입력받는다.)
function addCartEvent(productNo) {
	let cartListVO = {
		productNo: productNo,
		memberId: memberId
	}
	addCart(cartListVO);
}

// http 요청을 보내는 함수 실질적으로 정보를 입력한다.
function addCart(cartListVO) {
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
	fetch(url, optionObj)
		.then(result => {
			return result.json();
		})
		.then(function(result) {
			if (result.addCart == "Faild") {
				alert("장바구니에 추가가 실패하였습니다.");
			} else {
				alert("장바구니에 추가가 완료되었습니다.");
			}
		});
}
