package com.sangjo.mapper;

import com.sangjo.vo.ReviewVO;

public interface ReviewMapper {

	int insertReview(ReviewVO reviewVO);

	int selectReviewSameMemberId(ReviewVO reviewVO);
	
}
