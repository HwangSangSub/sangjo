package com.sangjo.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sangjo.common.Control;
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
		
		ProductService psvc = new ProductServiceImpl();
		
		List<ProductVO> list = psvc.productList();
		
		CategoryService csvc = new CategoryServiceImpl();
		
		List<CategoryVO> category = csvc.categoryList();
		
		req.setAttribute("productList", list);
		
		req.setAttribute("categoryList", category);
		
		req.getRequestDispatcher("sangjo/indexBody.tiles").forward(req, resp);
	}

}
