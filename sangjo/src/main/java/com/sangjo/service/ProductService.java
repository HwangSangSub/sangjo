package com.sangjo.service;

import java.util.List;

import com.sangjo.vo.ProductVO;

public interface ProductService {
	List<ProductVO> productList();
	
	List<ProductVO> selectProductList(String cdName);

	List<ProductVO> productListByCategoryNo(int categoryNo);

	ProductVO getProductByNo(String productNo);
}
