package com.sangjo.vo;

import java.util.Date;

import lombok.Data;

@Data
public class InquiryVO {
	private int inquiryNo;
	private String inquiryInquirer;
	private String inquiryType;
	private String inquiryTitle;
	private String inquiryContent;
	private String inquiryResponser;
	private String inquiryAnswer;
	private int refNo;
	private Date inquiryDate;
}// end class
