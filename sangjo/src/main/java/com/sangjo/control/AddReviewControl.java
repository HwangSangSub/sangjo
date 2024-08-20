package com.sangjo.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sangjo.common.Control;
import com.sangjo.service.ReviewService;
import com.sangjo.service.ReviewServiceImpl;
import com.sangjo.vo.ReviewVO;

public class AddReviewControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		ReviewService reviewService = new ReviewServiceImpl();
		
		String memberId = req.getParameter("memberId");
		int productNo = Integer.parseInt(req.getParameter("productNo"));
		String reviewContent = req.getParameter("reviewContent");
		int reviewPoint = Integer.parseInt(req.getParameter("reviewPoint"));
		
		String addReviewResult = "Faild";
		
		ReviewVO reviewVO = new ReviewVO();
		reviewVO.setMemberId(memberId);
		reviewVO.setProductNo(productNo);
		reviewVO.setReviewContent(reviewContent);
		reviewVO.setReviewPoint(reviewPoint);
		
		// 리뷰내용이 없을경우 반환된다.
		if(reviewContent.length() < 1) {
			addReviewResult = "WrongContent";
			resp.sendRedirect("productInfo.do?productNo="+productNo+"&addReviewResult="+addReviewResult);
			return;
		}
		// 리뷰 점수는 1~5 점까지기에 점수를 선택하지 않은 상태면 리뷰추가를 허용하지 않는다.
		if(reviewPoint < 1 || reviewPoint >5 ) {
			addReviewResult = "WrongPoint";
			resp.sendRedirect("productInfo.do?productNo="+productNo+"&addReviewResult="+addReviewResult);
			return;
		}
		// 이미 리뷰가 존재한다면 실행된다.
		if(reviewService.checkSameMember(reviewVO)) {
			addReviewResult = "AlreadyReview";
			resp.sendRedirect("productInfo.do?productNo="+productNo+"&addReviewResult="+addReviewResult);
			return;
		}
		
		if(reviewService.addReview(reviewVO)) {
			addReviewResult = "Success";
		}
		resp.sendRedirect("productInfo.do?productNo="+productNo+"&addReviewResult="+addReviewResult);
	}

}
