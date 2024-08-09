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

public class ProductInfoControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ProductService productService = new ProductServiceImpl();
		CategoryService categoryService = new CategoryServiceImpl();
		String productNo = req.getParameter("productNo");
		
		ProductVO productMain = productService.getProductByNo(productNo);
		List<ProductVO> productList = productService.productListByCategoryNo(productMain.getCategoryNo());

		for (ProductVO productVO : productList) {
			if(productVO.getProductNo() == productMain.getProductNo()){
				productList.remove(productVO);
				// 브레이크를 안하면 ConcurrentModificationException 오류가 발생한다.
				break;
			}
		}
		// 데이터를 가져와쓴지 확인하기위한 출력문이다. (필요할떄 주석을 제거하자!)
//		for (ProductVO productVO : productList) {
//			System.out.println(productVO.toString());
//		}
		
		req.setAttribute("productMain", productMain);
		req.setAttribute("productLsit", productList);
		
		CategoryVO categoryVO = categoryService.getCategoryName(productMain.getCategoryNo());
		req.setAttribute("category", categoryVO);
		
		req.getRequestDispatcher("sangjo/productInfo.tiles").forward(req, resp);
	}// end exec()

}// end class
