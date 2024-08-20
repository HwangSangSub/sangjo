package com.sangjo.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.sangjo.common.Control;
import com.sangjo.common.PageDTO;
import com.sangjo.common.SearchVO;
import com.sangjo.service.ProductService;
import com.sangjo.service.ProductServiceImpl;
import com.sangjo.vo.ProductVO;

public class ProductListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");

		String cdName = req.getParameter("cdName");
		cdName = (cdName != "" && cdName != null ? cdName : "주방");

		String keyword = req.getParameter("keyword");
		keyword = (keyword != "" && keyword != null ? keyword : "");

		String order = req.getParameter("order");
		order = (order != "" && order != null ? order : "1");

		String page = req.getParameter("page");
		page = (page != "" && page != null ? page : "1");

		SearchVO search = new SearchVO();
		search.setCdName(cdName);
		search.setKeyword(keyword);
		search.setOrder(order);
		search.setPage(Integer.parseInt(page));

		ProductService svc = new ProductServiceImpl();
		int totalCnt = svc.totalCount(search);

		PageDTO paging = new PageDTO(Integer.parseInt(page), totalCnt);

		List<ProductVO> list = svc.sortingDatePaging(search);
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("search", search);
		map.put("paging", paging);
		map.put("list", list);

		// json 문자열
		Gson gson = new GsonBuilder().create();
		String json;
		json = gson.toJson(map);
		resp.getWriter().print(json);

	}// end exec();

}// end class
