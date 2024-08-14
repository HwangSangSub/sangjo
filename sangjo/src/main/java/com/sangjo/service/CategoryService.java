package com.sangjo.service;

import java.util.List;

import com.sangjo.vo.CategoryVO;

public interface CategoryService {
	List<CategoryVO> categoryList();
	List<CategoryVO> categorySelectList(String categoryName);
	CategoryVO getCategoryName(int categoryNo);
	List<CategoryVO> categoryCountList();
	
}
