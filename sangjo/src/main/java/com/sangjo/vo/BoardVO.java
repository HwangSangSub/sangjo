package com.sangjo.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	int boardNo;
	String boardTitle;
	String boardContent;
	String boardType;
	String memberId;
	Date regDate;
}
