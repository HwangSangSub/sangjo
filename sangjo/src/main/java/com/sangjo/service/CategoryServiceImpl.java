package com.sangjo.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.sangjo.common.DataSource;
import com.sangjo.mapper.CategoryMapper;
import com.sangjo.vo.CategoryVO;

public class CategoryServiceImpl implements CategoryService {
	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	CategoryMapper mapper = sqlSession.getMapper(CategoryMapper.class);
	
	
	@Override
	public List<CategoryVO> categoryNameList() {
		return mapper.categoryNameList();
	}
	
	@Override
	public List<CategoryVO> categoryList() {
		return mapper.categoryList();
	}
	
	@Override
	public List<CategoryVO> categorySelectList(String categoryName) {
		return mapper.categorySelectList(categoryName);
	}
}
