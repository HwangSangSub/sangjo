package com.sangjo.vo;

import java.util.Date;

import lombok.Data;

@Data
public class CartListVO {

	private int cartNo; // 장바구니번호
	private int productNo; // 상품번호
	private String memberId; //회원,아이디
	private Date regDate;//장바구니등록일
	
	private int categoryNo; // 상품카테고리번호
	private String productName; // 상품명
	private String productPrice; // 상품가격
	private String productImg; // 상품이미지
	private String productTthumbnai_lImg; // 상품이미지(썸네일)
	private String productContent; //상품내용
	private int quantity; //수량
	
}