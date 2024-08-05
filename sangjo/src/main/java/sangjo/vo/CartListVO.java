package sangjo.vo;

import java.util.Date;

import lombok.Data;

@Data
public class CartListVO {

	private int CartNo; // 장바구니번호
	private int ProductNo; // 상품번호
	private String MemberId; //회원,아이디
	private Date RegDate;//장바구니등록일
	
	private int CategoryNo; // 상품카테고리번호
	private String ProductName; // 상품명
	private String ProductPrice; // 상품가격
	private String ProductImg; // 상품이미지
	private String ProductTthumbnailImg; // 상품이미지(썸네일)
	private String ProductContent; //상품내용
	
	
	
}
