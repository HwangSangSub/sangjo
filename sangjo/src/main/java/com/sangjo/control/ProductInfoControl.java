package com.sangjo.control;

import java.io.IOException;

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

public class ProductInfoControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ProductService productService = new ProductServiceImpl();
		CategoryService categoryService = new CategoryServiceImpl();
		String productNo = req.getParameter("productNo");
		ProductVO productVO = productService.getProductByNo(productNo);
		CategoryVO categoryVO = categoryService.getCategoryName(productVO.getCategoryNo());
		req.setAttribute("product", productVO);
		req.setAttribute("category", categoryVO);
		
		req.getRequestDispatcher("sangjo/productInfo.tiles").forward(req, resp);
	}// end exec()

}// end class
