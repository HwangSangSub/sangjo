package com.sangjo.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.sangjo.common.DataSource;
import com.sangjo.mapper.ReviewMapper;
import com.sangjo.vo.ReviewVO;

public class ReviewServiceImpl implements ReviewService{
	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
	
	
	@Override
	public boolean addReview(ReviewVO reviewVO) {
		return mapper.insertReview(reviewVO) == 1 ;
	}
	
	@Override
	public boolean checkSameMember(ReviewVO reviewVO) {
		return mapper.selectReviewSameMemberId(reviewVO) > 0;
	}

	@Override
	public float getAvgPoint(int productNo) {
		return mapper.selectAvgPoint(productNo);
	}

	@Override
	public List<ReviewVO> getReviewList(String productNo, String reviewPage) {
		return mapper.selectReviewList(productNo, reviewPage);
	}

}
