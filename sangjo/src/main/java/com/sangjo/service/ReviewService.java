package com.sangjo.service;

import java.util.List;

import com.sangjo.vo.ReviewVO;

public interface ReviewService {

	boolean addReview(ReviewVO reviewVO);
	
	boolean checkSameMember(ReviewVO reviewVO);

	float getAvgPoint(int productNo);

	List<ReviewVO> getReviewList(String productNo, String reviewPage);

	int getReviewCnt(String productMainNo);

}
