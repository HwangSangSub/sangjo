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
		let result = JSON.parse(this.responseText);
		result.forEach(order => {
			console.log(order);
			//replyList.appendChild(makeRow(order));
		});
	});
});

// 문의내역 탭 메뉴 클릭시
document.querySelector('#myinquiry-tab').addEventListener('click', function() {
	svc.inquiryList(memberId, function() {
		if (memberId == "" || memberId == null) {
			alert('로그인되지 않아서 조회 할 수 없습니다.');
			return;
		}
		let result = JSON.parse(this.responseText);
		result.forEach(inquiry => {
			console.log(inquiry);
			//replyList.appendChild(makeRow(order));
		});
	});
});