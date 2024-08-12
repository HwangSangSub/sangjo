package com.sangjo.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.sangjo.common.Control;
import com.sangjo.service.CategoryService;
import com.sangjo.service.CategoryServiceImpl;
import com.sangjo.vo.CategoryVO;

public class CategoryControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");

		String categoryName = req.getParameter("categoryName");
		categoryName = (categoryName != "" ? categoryName : "홈인테리어");

		CategoryService csvc = new CategoryServiceImpl();
		List<CategoryVO> list = csvc.categorySelectList(categoryName);

		// json 문자열
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(list);

		resp.getWriter().print(json);
	}

}
