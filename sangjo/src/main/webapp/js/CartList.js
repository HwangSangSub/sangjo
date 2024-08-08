document.addEventListener('DOMContentLoaded', function() {
	// 수량 조절 버튼에 대한 이벤트 리스너 추가
	document.querySelectorAll('.btn-minus, .btn-plus').forEach(button => {
		button.addEventListener('click', function(e) {

			const button = e.currentTarget;
			const row = button.closest('tr');
			const quantityInput = row.querySelector('input[type="text"]');
			let quantity = parseInt(quantityInput.value, 10);

			// 상품 가격을 가져옴
			const productPrice = parseFloat(row.querySelector('td:nth-child(3) p').textContent.replace('원', '').trim());
			// 수량 증가 또는 감소
			if (button.classList.contains('btn-minus')) {
				quantity - 1; // 수량을 0으로 제한
			} else if (button.classList.contains('btn-plus')) {
				quantity + 1;
			}

			// 수량 업데이트
			quantityInput.value = quantity;

			// 총액 계산 및 업데이트
			const itemTotal = productPrice * quantity;
			row.querySelector('td:nth-child(5) p').textContent = itemTotal + ' 원';

			// 전체 합계 업데이트
			updateGrandTotal();

			// 1. 상품번호넣는 배열 빈값 만들기 [] =>    (장바구니번호, 수량, 금액 총 4개 빈배열 만들기)
			let product_Nos = [];
			let cart_Nos = [];
			let quantities = [];
			let product_Prices = [];
			let product_Imgs = [];
			let product_Names = [];
			// 2. 전체 tr 가져와서 반복문 만들기
			document.querySelectorAll('#cart>tr')
				.forEach(tr => {
					// 3. 반복문안에서 해당 하는 tr에 상품번호, 장바구니번호, 수량, 금액을 가져와서 해당하는 빈배열에 값 너기배열명.push(값)

					// tr 안에서 값 가져오기
					let cartNo = tr.dataset.cartNo;
					let productNo = tr.dataset.productNo;
					let productPrice = tr.dataset.productPrice;
					let productName = tr.dataset.productName;
					let productImg = tr.dataset.productImg;
					let quantity = tr.querySelector('#quantity').value;

					// 빈배열에 값 넣기
					if (quantity > 0) {
						cart_Nos.push(cartNo);
						product_Nos.push(productNo);
						product_Prices.push(productPrice);
						product_Names.push(productName);
						product_Imgs.push(productImg);
						quantities.push(quantity);
					}
				});
			// 숨겨진 입력 필드에 값 설정
			document.querySelector('#cartForm input[name="cartNos"]').value = cart_Nos.join(',');
			document.querySelector('#cartForm input[name="productNos"]').value = product_Nos.join(',');
			document.querySelector('#cartForm input[name="quantities"]').value = quantities.join(',');
			document.querySelector('#cartForm input[name="productPrices"]').value = product_Prices.join(',');
			document.querySelector('#cartForm input[name="productImgs"]').value = product_Imgs.join(',');
			document.querySelector('#cartForm input[name="productNames"]').value = product_Names.join(',');
		});
	});

	document.querySelector('#cartForm').addEventListener('submit', function(e) {
		e.preventDefault(); // 기본 제출 방지
		this.submit(); // 폼 제출
	});
});



function updateGrandTotal() {
	let grandTotal = 0;

	// 각 아이템의 총액을 계산하여 grandTotal에 추가
	document.querySelectorAll('tbody tr').forEach(row => {
		const itemTotalText = row.querySelector('td:nth-child(5) p').textContent.replace(' 원', '').trim();
		const itemTotal = parseFloat(itemTotalText) || 0; // NaN이 될 경우 0으로 대체
		grandTotal += itemTotal;
	});

	// 배송비 설정
	const shippingCost = 3000;
	const totalAmount = grandTotal + shippingCost;

	// 소계와 총합 업데이트
	document.querySelector('#grandTotal').textContent = grandTotal + ' 원';
	document.querySelector('.bg-light .py-4.mb-4.border-top.border-bottom.d-flex.justify-content-between p').textContent = totalAmount + ' 원';
}
function remove_proNo(e) {
	if (e.target.tagName == 'I') {

		console.dir(e.target.parentElement.dataset.productId);
		removeCart(e);
		e.target.parentElement.parentElement.parentElement.remove();
	}
	else if (e.target.tagName == 'BUTTON') {
		console.dir(e.target.dataset.productId);
		removeCart(e);
		e.target.parentElement.parentElement.remove();
	}
	updateGrandTotal();
}
function removeCart(e) {
	let cartNo = e.target.dataset.cartNo;
	let url = "cartRemove.do?cartNo=" + cartNo;
	fetch(url) // promise객체, then(), catch()
		.then(function(result) {
			console.log(result);
		})
		.catch(function(err) {
			console.error(err);
		})
}