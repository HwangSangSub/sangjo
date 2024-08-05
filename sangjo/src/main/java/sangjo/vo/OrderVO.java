package sangjo.vo;

import java.util.Date;

import lombok.Data;

@Data
public class OrderVO {
	//오더
private int OrderNo; // 주문번호
private int OrderPrice; // 주문금액
private int DeliveryPrice; //배송비
private String OrderStatus; //주문상태 주문상태 1: 결제완료(배송전), 2배송시작, 3.배송완료,4 :주문취소
private int AddressNo; //배송지주소번호
private String MemberId; //주문자
private Date OrderDate; //주문일시
private Date DeliveryDate; //배송일시
private Date CancleDate; //취소일시
 // 오더디테일
private int OdNo; //주문상세번호
private int ProductNo; //상품번호
private int OdPrice; //주문상세가격
private int OdCnt; //주문수량

}
