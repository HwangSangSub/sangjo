package com.sangjo.mapper;

import java.util.List;

import com.sangjo.vo.InquiryVO;

public interface InquiryMapper {
	List<InquiryVO> getMyInquiryList(String memberId);
	int insertInquiry(InquiryVO inquiry);
}	
