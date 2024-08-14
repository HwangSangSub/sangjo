package com.sangjo.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.sangjo.common.Control;
import com.sangjo.common.SearchVO;
import com.sangjo.service.ProductService;
import com.sangjo.service.ProductServiceImpl;
import com.sangjo.vo.ProductVO;

public class ProductListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");

		String cdName = req.getParameter("cdName");
		cdName = (cdName != "" ? cdName : "주방");

		String keyword = req.getParameter("keyword");
		keyword = (keyword != "" ? keyword : "욕실");

		SearchVO search = new SearchVO();
		search.setCdName(cdName);
		search.setKeyword(keyword);

		ProductService svc = new ProductServiceImpl();
		//List<ProductVO> list = svc.selectProductList(cdName);
		//List<ProductVO> searchList = svc.searchProductList(search);
		

		List<ProductVO> list = svc.searchProductList(search);

		// json 문자열
		Gson gson = new GsonBuilder().create();
		String json;

//		if (searchList != null && !searchList.isEmpty()) {
//			json = gson.toJson(searchList);
//		} else {
//			json = gson.toJson(list);
//		}
		json = gson.toJson(list);
		resp.getWriter().print(json);

	}// end exec();

}// end class
