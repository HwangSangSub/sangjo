package com.sangjo.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.sangjo.common.Control;
import com.sangjo.service.ReviewService;
import com.sangjo.service.ReviewServiceImpl;
import com.sangjo.vo.ReviewVO;

public class ReviewListControl implements Control {
	ReviewService reviewService = new ReviewServiceImpl();

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");

		String reviewPage = req.getParameter("reviewPage");
		String productMainNo = req.getParameter("productMainNo");
		if (reviewPage == null) {
			reviewPage = "1";
		}

		List<ReviewVO> reviewList = reviewService.getReviewList(productMainNo, reviewPage);
//		reviewList.forEach(System.out::println);

		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(reviewList);
		resp.getWriter().print(json);
	}

}
