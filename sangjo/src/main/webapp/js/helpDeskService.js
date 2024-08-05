/**
 * 
 *//**
 * helpDeskSerivce.js
 */

const svc = {
	// 목록 조회
	boardList(loadCallback) {
		const xhtp = new XMLHttpRequest();
		xhtp.open('get', 'boardList.do');
		xhtp.send();
		xhtp.onload = loadCallback;
	}// end of boardList
}// end of svc