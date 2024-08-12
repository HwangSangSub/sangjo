/**
 * myPage.js
 */
document.querySelector('#userModInfo #modBtn').addEventListener('click', function() {
	if (memberId == "" || memberId == null) {
		alert('로그인되지 않아서 조회 할 수 없습니다.');
		return;
	}
	let memberId = document.querySelector('#userModInfo #memberId').value;
	let memberPw = document.querySelector('#userModInfo #memberPw').value;
	let memberOldPw = document.querySelector('#userModInfo #memberOldPw').value;
	let memberName = document.querySelector('#userModInfo #memberName').value;
	let memberPhone = document.querySelector('#userModInfo #memberPhone').value;
	let memberEmail = document.querySelector('#userModInfo #memberEmail').value;

	//console.log(memberId + ", " + memberPw + ", " + memberOldPw + ", " + memberPhone + ", " + memberEmail)
	/*
		if (!sno || !sname || !phone) {
			alert("값을 입력하세요.");
			return;
		}
	*/
	const xHtp = new XMLHttpRequest();
	xHtp.open('get', 'memberMod.do?memberId=' + memberId + '&memberPw=' + memberPw + '&memberOldPw=' + memberOldPw + '&memberName=' + memberName + '&memberPhone=' + memberPhone + '&memberEmail=' + memberEmail);
	xHtp.send();
	xHtp.onload = function() {
		//console.log(xHtp);
		let result = JSON.parse(xHtp.responseText);
		if (result.retCode == 'Success') {
			alert('성공!');
		} else if (result.retCode == 'Fail') {
			alert("관리자에게 문의하세요!");
		}
	}

});


const svc = {
	// 주문내역 조회
	orderList(memberId, loadCallback) {
		const xhtp = new XMLHttpRequest();
		xhtp.open('get', 'myPageOrder.do?memberId=' + memberId);
		xhtp.send();
		xhtp.onload = loadCallback;
	},// end of orderList
	// 주문상세내역조회
	orderDetailList(orderNo, loadCallback) {
		const xhtp = new XMLHttpRequest();
		xhtp.open('get', 'orderDetailList.do?orderNo=' + orderNo);
		xhtp.send();
		xhtp.onload = loadCallback;
	}, // end of inquiryList
	// 문의내역 조회
	inquiryList(memberId, loadCallback) {
		const xhtp = new XMLHttpRequest();
		xhtp.open('get', 'myPageInquiry.do?memberId=' + memberId);
		xhtp.send();
		xhtp.onload = loadCallback;
	} // end of inquiryList
}// end of svc

let memberId = document.querySelector('#logid').value;
// 주문내역 탭 메뉴 클릭시
document.querySelector('#myorder-tab').addEventListener('click', function() {
	svc.orderList(memberId, function() {
		if (memberId == "" || memberId == null) {
			alert('로그인되지 않아서 조회 할 수 없습니다.');
			return;
		}
		let result = JSON.parse(this.responseText)
		let myOrdTbody = document.querySelector('#myOrdList tbody');

		myOrdTbody.querySelectorAll('tr').forEach((tr) => {
			tr.remove();
		});

		result.forEach(order => {
			myOrdTbody.appendChild(makeOrderRow(order));
		});
	});
});
function makeOrderRow(order = {}) {

	let fields = ['OrderNo', 'OrderPrice', 'DeliveryPrice', 'AddressNo', 'OrderStatus', 'OrderDate'];
	let tr = document.createElement('tr');
	tr.setAttribute('data-ono', order.OrderNo);
	fields.forEach(field => {
		let td = document.createElement('td');
		if (field == 'OrderPrice' || field == 'DeliveryPrice') {
			let num = order[field].toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			td.innerHTML = num + "원";
		} else if (field == 'OrderStatus') {
			let statusName;
			//주문상태 1: 결제완료(배송전), 2배송시작, 3.배송완료,4 :주문취소
			switch (order[field]) {
				case "1":
					statusName = "결제완료(배송전)";
					break;
				case "2":
					statusName = "배송시작";
					break;
				case "3":
					statusName = "배송완료";
					break;
				case "4":
					statusName = "주문취소";
					break;
				default:
					statusName = "-";
					break;
			}
			td.innerHTML = statusName;
		} else if (field == 'OrderDate') {
			let objectDate = new Date(order[field]);
			let day = objectDate.getDate();
			let month = objectDate.getMonth();
			let year = objectDate.getFullYear();

			if (day < 10) {
				day = '0' + day;
			}

			if (month < 10) {
				month = `0${month + 1}`;
			}

			let orderDate = year + "-" + month + "-" + day;

			td.innerHTML = orderDate;
		} else {
			td.innerHTML = order[field];
		}
		tr.appendChild(td);
		tr.addEventListener('click', viewOrderDetail);
	});
	return tr;
}

function viewOrderDetail(e) {
	if (document.querySelector('.odTable')) {
		document.querySelector('.odTable').remove();
	}
	let trTarget = e.target.parentElement;
	let orderNo = trTarget.dataset.ono;
	let newTr = document.createElement('tr');
	newTr.classList.add('odTable');
	let newTd = document.createElement('td');
	svc.orderDetailList(orderNo, function() {
		let result = JSON.parse(this.responseText);
		let table = document.createElement('table');
		table.classList.add('table', 'mb-0');
		let thead = document.createElement('thead');
		let tbody = document.createElement('tbody');

		let tr = document.createElement('tr');
		let th = document.createElement('th');

		th.innerHTML = "주문상세번호";
		tr.appendChild(th);

		th = document.createElement('th');
		th.innerHTML = "상품명";
		tr.appendChild(th);

		th = document.createElement('th');
		th.innerHTML = "상품가격";
		tr.appendChild(th);

		th = document.createElement('th');
		th.innerHTML = "주문수량";
		tr.appendChild(th);

		th = document.createElement('th');
		th.innerHTML = "합계금액";
		tr.appendChild(th);
		thead.appendChild(tr);
		table.appendChild(thead);

		result.forEach(od => {
			tbody.appendChild(makeOrderDetailRow(od));
		});
		table.appendChild(tbody);
		newTd.setAttribute('colspan', 6);
		newTd.appendChild(table);
		newTr.appendChild(newTd);
		trTarget.after(newTr);
	});
}

function makeOrderDetailRow(orderDetail = {}) {
	//'ProductNo', 
	let fields = ['OdNo', 'ProductName', 'ProductPrice', 'OdCnt', 'OdPrice'];
	let tr = document.createElement('tr');
	tr.setAttribute('data-odno', orderDetail.OdNo);
	fields.forEach(field => {
		let td = document.createElement('td');
		if (field == 'ProductPrice') {
			let num = orderDetail[field].toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			td.innerHTML = num + "원";
		} else if (field == 'OdPrice') {
			let totMoney = Number(orderDetail['OdCnt']) * Number(orderDetail['ProductPrice']);
			let num = totMoney.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			td.innerHTML = num + "원";
		} else if (field == 'OdCnt') {
			let num = orderDetail[field].toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			td.innerHTML = num + "개";
		} else {
			td.innerHTML = orderDetail[field];
		}
		tr.appendChild(td);
		tr.addEventListener('click', function() {
			location.href = "productInfo.do?productNo=" + orderDetail['OdNo'];
		});
	});
	return tr;
}
// 문의내역 탭 메뉴 클릭시
document.querySelector('#myinquiry-tab').addEventListener('click', function() {
	svc.inquiryList(memberId, function() {
		if (memberId == "" || memberId == null) {
			alert('로그인되지 않아서 조회 할 수 없습니다.');
			return;
		}
		let result = JSON.parse(this.responseText);
		let myInqTbody = document.querySelector('#myInqList tbody');
		myInqTbody.querySelectorAll('tr').forEach((tr) => {
			tr.remove();
		});
		result.forEach(inquiry => {
			myInqTbody.appendChild(makeInquiryRow(inquiry));
		});
	});
});

function makeInquiryRow(inquiry = {}) {

	let fields = ['inquiryNo', 'inquiryTitle', 'inquiryType', 'inquiryDate'];
	let tr = document.createElement('tr');
	tr.setAttribute('data-ono', inquiry.inquiryNo);
	fields.forEach(field => {
		let td = document.createElement('td');

		if (field == 'inquiryNo') {
			td.innerHTML = inquiry[field];
			tr.appendChild(td);
		} else if (field == 'inquiryType') {
			let statusName;
			//주문상태 1: 결제완료(배송전), 2배송시작, 3.배송완료,4 :주문취소
			switch (inquiry[field]) {
				case "1":
					statusName = "일반문의";
					break;
				case "2":
					statusName = "상품문의";
					break;
				case "3":
					statusName = "주문문의";
					break;
				default:
					statusName = "-";
					break;
			}
			td.innerHTML = statusName;
		} else if (field == 'inquiryDate') {
			let objectDate = new Date(inquiry[field]);
			let day = objectDate.getDate();
			let month = objectDate.getMonth();
			let year = objectDate.getFullYear();

			if (day < 10) {
				day = '0' + day;
			}

			if (month < 10) {
				month = `0${month + 1}`;
			}

			let inquiryDate = year + "-" + month + "-" + day;

			td.innerHTML = inquiryDate;
		} else {
			td.innerHTML = inquiry[field];
		}
		tr.appendChild(td);
	});

	// 상세보기 버튼 추가
	td = document.createElement('td');
	let btn = document.createElement('button');
	btn.setAttribute('data-bs-toggle', 'modal');
	btn.setAttribute('data-bs-target', '#inqModel_' + inquiry.inquiryNo);
	btn.className = 'my-auto';
	btn.classList.add('btn', 'btn-success');
	btn.innerHTML = '상세보기';
	btn.addEventListener('click', function() {
		veiwInquiryInfo('inqModel_' + inquiry.inquiryNo);
	});
	td.appendChild(btn);
	tr.appendChild(td);
	tr.appendChild(createInquiryInfo(inquiry));

	return tr;
}

// 모달창생성
function createInquiryInfo(inquiry = {}) {
	let cloneDiv = document.querySelector('#inqModel').cloneNode(true);
	cloneDiv.id = 'inqModel_' + inquiry.inquiryNo;
	cloneDiv.querySelector('#inquiryTitle').value = inquiry.inquiryTitle;
	cloneDiv.querySelector('#inquiryContent').value = inquiry.inquiryContent;
	let inquiryAnswer = "";
	if(inquiry.inquiryAnswer == "" || inquiry.inquiryAnswer == undefined || inquiry.inquiryAnswer == null){
		inquiryAnswer += "등록된 답변이 없습니다.";
	}else{
		inquiryAnswer += inquiry.inquiryAnswer;
	}
	cloneDiv.querySelector('#inquiryAnswer').value = inquiryAnswer;
	return cloneDiv;
}

// 모달창 열기
function veiwInquiryInfo(inquiryTagId) {
	let viewDiv = document.querySelector("#" + inquiryTagId);
	viewDiv.style.display = 'block';
	viewDiv.classList.add('show');
	viewDiv.removeAttribute('aria-hidden');
	viewDiv.setAttribute('aria-modal', true);
}