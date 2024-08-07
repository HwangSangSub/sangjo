package com.sangjo.service;

import java.util.List;

import com.sangjo.vo.CategoryVO;

public interface CategoryService {
	List<CategoryVO> categoryList(CategoryVO category);

	CategoryVO getCategoryName(int categoryNo);
}
