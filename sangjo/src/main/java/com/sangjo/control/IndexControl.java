package com.sangjo.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sangjo.common.Control;
import com.sangjo.common.PageDTO;
import com.sangjo.common.SearchVO;
import com.sangjo.service.CategoryService;
import com.sangjo.service.CategoryServiceImpl;
import com.sangjo.service.ProductService;
import com.sangjo.service.ProductServiceImpl;
import com.sangjo.vo.CategoryVO;
import com.sangjo.vo.ProductVO;

/**
 * 메인페이지 열어줍니다
 */
public class IndexControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");

		String cdName = req.getParameter("cdName");
		cdName = (cdName != "" && cdName != null  ? cdName : "주방");

		String keyword = req.getParameter("keyword");
		keyword = (keyword != "" && keyword != null  ? keyword : "");

		String order = req.getParameter("order");
		order = (order != "" && order != null ? order : "1");

		String page = req.getParameter("page");
		page = (page != "" && page != null ? page : "1");

		SearchVO search = new SearchVO();
		search.setCdName(cdName);
		search.setKeyword(keyword);
		search.setOrder(order);
		search.setPage(Integer.parseInt(page));

		ProductService psvc = new ProductServiceImpl();

		int totalCnt = psvc.totalCount(search);

		PageDTO paging = new PageDTO(Integer.parseInt(page), totalCnt);

		List<ProductVO> list = psvc.sortingDatePaging(search);

		CategoryService csvc = new CategoryServiceImpl();

		List<CategoryVO> category = csvc.categoryList();

		// List<CategoryVO> count = csvc.categoryCountList()
		req.setAttribute("paging", paging);

		req.setAttribute("productList", list);
		
		req.setAttribute("searching", search);

		req.setAttribute("categoryList", category);

		req.getRequestDispatcher("sangjo/indexBody.tiles").forward(req, resp);
	}

}
