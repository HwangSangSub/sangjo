package com.sangjo.mapper;

import java.util.List;

import sangjo.vo.ProductVO;

public interface ProductMapper {
	List<ProductVO> selectProductList();
}
