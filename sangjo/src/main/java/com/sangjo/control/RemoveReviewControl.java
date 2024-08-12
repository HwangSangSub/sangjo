package com.sangjo.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sangjo.common.Control;
import com.sangjo.service.ReviewService;
import com.sangjo.service.ReviewServiceImpl;

public class RemoveReviewControl implements Control {
	ReviewService reviewService = new ReviewServiceImpl();
	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String productNo = req.getParameter("productMainNo");
		String memberId = req.getParameter("memberId");
		
		String json;
		json = String.format("{\"removeReview\" : %s }", "Faild");
		if(reviewService.removeReview(productNo,memberId)) {
			json = String.format("{\"removeReview\" : %s }", "Success");
		}
		resp.getWriter().print(json);
	}

}
