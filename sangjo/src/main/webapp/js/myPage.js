/**
 * myPage.js
 */
document.querySelector('#userModInfo #modBtn').addEventListener('click', function(e){
	let memberId = document.querySelector('#userModInfo #memberId').value;
	let memberPw = document.querySelector('#userModInfo #memberPw').value;
	let memberOldPw = document.querySelector('#userModInfo #memberOldPw').value;
	let memberName = document.querySelector('#userModInfo #memberName').value;
	let memberPhone = document.querySelector('#userModInfo #memberPhone').value;
	let memberEmail = document.querySelector('#userModInfo #memberEmail').value;
	
	console.log(memberId + ", " + memberPw+ ", " +memberOldPw + ", " + memberPhone+ ", " + memberEmail)
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
		console.log(xHtp);
		let result = JSON.parse(xHtp.responseText);
		if (result.retCode == 'Success') {
			alert('성공!');
		} else if (result.retCode == 'Fail') {
			alert("관리자에게 문의하세요!");
		}
	}

});