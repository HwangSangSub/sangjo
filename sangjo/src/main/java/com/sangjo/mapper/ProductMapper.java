package com.sangjo.mapper;

import java.util.List;

import com.sangjo.vo.CategoryVO;
import com.sangjo.vo.ProductVO;

public interface ProductMapper {
	List<ProductVO> productTotalList();
	
	List<ProductVO> selectProductList(String cdName);
	
	List<CategoryVO> categoryList();
}
