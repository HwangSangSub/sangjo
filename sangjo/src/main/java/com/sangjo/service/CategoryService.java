package com.sangjo.service;

import java.util.List;

import com.sangjo.vo.CategoryVO;

public interface CategoryService {
	List<CategoryVO> categoryNameList();
	List<CategoryVO> categoryList();
	List<CategoryVO> categorySelectList(String categoryName);
	
}
