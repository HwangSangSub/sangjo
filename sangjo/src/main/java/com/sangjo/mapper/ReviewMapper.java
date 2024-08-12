package com.sangjo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sangjo.vo.ReviewVO;

public interface ReviewMapper {

	int insertReview(ReviewVO reviewVO);

	int selectReviewSameMemberId(ReviewVO reviewVO);

	float selectAvgPoint(int productNo);

	List<ReviewVO> selectReviewList(@Param("no") String productNo,@Param("page") String reviewPage);

	int selectReviewCnt(String productMainNo);
	
}
