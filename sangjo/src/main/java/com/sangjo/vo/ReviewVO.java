package com.sangjo.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {
	int reviewNo;
	int productNo;
	String memberId;
	String reviewContent;
	int reviewPoint;
	Date regDate;
}
