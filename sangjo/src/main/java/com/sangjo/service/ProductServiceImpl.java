package com.sangjo.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.sangjo.common.DataSource;
import com.sangjo.common.SearchVO;
import com.sangjo.mapper.ProductMapper;
import com.sangjo.vo.ProductVO;

public class ProductServiceImpl implements ProductService{
	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);
	
	@Override
	public List<ProductVO> productList() {
		return mapper.productTotalList();
	}
	
	@Override
	public List<ProductVO> selectProductList(String cdName) {
	    return mapper.selectProductList(cdName);
	}
	
	@Override
	public ProductVO getProductByNo(String productNo) {
		return mapper.selectProduct(productNo);
	}

	@Override
	public List<ProductVO> productListByCategoryNo(int categoryNo) {
		return mapper.selectProductListByCategoryNo(categoryNo);
	}

	@Override
	public List<ProductVO> searchProductList(SearchVO search) {
		return mapper.searchProductList(search);
	}
	
	@Override
	public List<ProductVO> sortingDate(SearchVO search) {
		return mapper.sortingDate(search);
	}
}
