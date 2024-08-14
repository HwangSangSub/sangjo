package com.sangjo.vo;

import java.util.Date;

import lombok.Data;

@Data
public class OrderVO {
	// 오더
	private int orderNo; // 주문번호
	private int orderPrice; // 주문금액
	private int deliveryPrice; // 배송비
	private String orderStatus; // 주문상태 주문상태 1: 결제완료(배송전), 2배송시작, 3.배송완료,4 :주문취소
	private int addressNo; // 배송지주소번호
	private String memberId; // 주문자
	private Date orderDate; // 주문일시
	private Date deliveryDate; // 배송일시
	private Date cancleDate; // 취소일시
	// 오더디테일
	private int odNo; // 주문상세번호
	private int productNo; // 상품번호
	private int odPrice; // 주문상세가격
	private int odCnt; // 주문수량
	private String productName; // 상품제목
	private String productPrice; // 상품가격
	private String productImg; // 상품이미지
	private int totalAmount; //총금액


}
