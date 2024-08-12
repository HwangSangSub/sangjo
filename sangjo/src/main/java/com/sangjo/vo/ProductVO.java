package com.sangjo.vo;

import java.util.Date;

import lombok.Data;

@Data 
public class ProductVO {
	private int productNo;
	private int categoryNo;
	private String productName;
	private String productPrice;
	private String productImg;
	private String productThumbnailImg;
	private String productContent;
	private Date regDate;
	private String cdName;
}
