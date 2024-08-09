package com.sangjo.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.sangjo.common.DataSource;
import com.sangjo.mapper.InquiryMapper;
import com.sangjo.vo.InquiryVO;

public class InquiryServiceImpl implements InquiryService {
	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	InquiryMapper mapper = sqlSession.getMapper(InquiryMapper.class);

	@Override
	public List<InquiryVO> myInquiryList(String memberId) {
		return mapper.getMyInquiryList(memberId);
	}
}// end class