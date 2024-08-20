package com.sangjo.mapper;

import java.util.List;

import com.sangjo.common.SearchVO;
import com.sangjo.vo.CategoryVO;
import com.sangjo.vo.ProductVO;

public interface ProductMapper {
	List<ProductVO> productTotalList();
	
	List<ProductVO> selectProductList(String cdName);
	
	List<CategoryVO> categoryList();

	ProductVO selectProduct(String productNo);

	List<ProductVO> selectProductListByCategoryNo(int categoryNo);
	
	List<ProductVO> searchProductList(SearchVO search);
}
