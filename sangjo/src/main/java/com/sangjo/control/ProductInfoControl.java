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
import com.sangjo.service.ReviewService;
import com.sangjo.service.ReviewServiceImpl;
import com.sangjo.vo.CategoryVO;
import com.sangjo.vo.ProductVO;
import com.sangjo.vo.ReviewVO;

public class ProductInfoControl implements Control {
	ProductService productService = new ProductServiceImpl();
	CategoryService categoryService = new CategoryServiceImpl();
	ReviewService reviewService = new ReviewServiceImpl();
	
	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		ProductVO productMain 
			= productService.getProductByNo(req.getParameter("productNo"));
		List<ProductVO> productList = getProductList(productMain);
		CategoryVO categoryVO 
			= categoryService.getCategoryName(productMain.getCategoryNo());
		float avgPoint = reviewService.getAvgPoint(productMain.getProductNo());
		
		// setAttrivute 하기
		req.setAttribute("productMain", productMain);
		req.setAttribute("productLsit", productList);
		req.setAttribute("category", categoryVO);
		req.setAttribute("avgPoint", avgPoint);
		// 타일즈를 활용하여 페이지 출력하기
		req.getRequestDispatcher("sangjo/productInfo.tiles").forward(req, resp);
	}// end exec()

	private List<ProductVO> getProductList(ProductVO productMain) {
		List<ProductVO> productList = productService.productListByCategoryNo(productMain.getCategoryNo());
		for (ProductVO productVO : productList) {
			if(productVO.getProductNo() == productMain.getProductNo()){
				productList.remove(productVO);
				// 브레이크를 안하면 ConcurrentModificationException 오류가 발생한다.
				break;
			}
		}
		return productList;
	}

}// end class
