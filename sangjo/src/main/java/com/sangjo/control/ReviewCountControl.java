package com.sangjo.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sangjo.common.Control;
import com.sangjo.service.ReviewService;
import com.sangjo.service.ReviewServiceImpl;

public class ReviewCountControl implements Control {
	ReviewService reviewService = new ReviewServiceImpl();
	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String productMainNo = req.getParameter("productMainNo");
		
		int reviewCnt = reviewService.getReviewCnt(productMainNo);
		
		String json = String.format("{\"reviewCnt\" : %s }", reviewCnt);
		resp.getWriter().print(json);
	}

}
