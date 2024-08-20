package com.sangjo.common;

import lombok.Data;

@Data
public class PageDTO {
	private int page; // 현재 페이지
	int pageCnt = 12; // 페이지 당 출력되는 데이터 수
	int pageTCnt = 10; // 한 화면에 총 페이지 출력 수 (10개 페이지 출력한다는 의미)
	private int startPage, endPage; // 현재 페이지 기준 첫 페이지와 마지막 페이지 번호
	private boolean prev, next; // 이전페이지가 있는지 다음페이지가 있는지 여부를 출력

	public PageDTO(int page, int totalCnt) {
		this.page = page; // 현재 페이지 넣기
		this.endPage = (int) Math.ceil(page / (double) pageTCnt) * 10; // 마지막 페이지 번호 구하기
		this.startPage = this.endPage - (pageTCnt - 1);

		// 실제 데이터에 맞는 endPage 구하기
		int realEnd = (int) Math.ceil(totalCnt / (double) pageCnt);
		this.endPage = this.endPage > realEnd ? realEnd : endPage;

		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}// end PageDTO
	
}// end class