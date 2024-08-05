/**
 * helpDesk.js
 */
let page = 1; // 아래쪽에서 댓글의 페이지를 지정.

svc.boardList(function() {
	let result = JSON.parse(this.responseText);
	result.forEach(board => {
		document.querySelector('#boardList').appendChild(makeRow(board));
	});
});

// reply => row 생성
function makeRow(board = {}) {
	let cloned = document.querySelector('#boardClone').cloneNode(true);
	cloned.style.display = 'block';
	cloned.setAttribute('data-bno', board.boardNo);
	cloned.querySelector('div.position-relative>div.border-bottom>p').innerText = board.boardTitle;
	cloned.querySelector('div.position-relative>div.align-items-center>div.d-block>h4').innerText = board.boardContent;
	return cloned;
}
