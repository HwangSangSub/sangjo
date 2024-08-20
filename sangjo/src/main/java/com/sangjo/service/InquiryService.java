package com.sangjo.service;

import java.util.List;

import com.sangjo.vo.InquiryVO;

public interface InquiryService {
	// 마이페이지 문의내역 확인하기.
    List<InquiryVO> myInquiryList(String memberId);
    
    boolean addInquiry(InquiryVO Inquiry);
}// end