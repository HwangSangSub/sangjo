package com.sangjo.service;

import com.sangjo.vo.ReviewVO;

public interface ReviewService {

	boolean addReview(ReviewVO reviewVO);
	
	boolean checkSameMember(ReviewVO reviewVO);

}
