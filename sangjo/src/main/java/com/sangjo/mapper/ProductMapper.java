package com.sangjo.mapper;

import java.util.List;

import com.sangjo.vo.ProductVO;

public interface ProductMapper {
	List<ProductVO> selectProductList();

	ProductVO selectProduct(String productNo);
}
