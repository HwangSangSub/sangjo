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
		document.querySelector('.bg-light .display-6.mb-4').textContent = grandTotal + ' 원';
		document.querySelector('.bg-light .py-4.mb-4.border-top.border-bottom.d-flex.justify-content-between p').textContent = totalAmount + ' 원';
	}


});

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
