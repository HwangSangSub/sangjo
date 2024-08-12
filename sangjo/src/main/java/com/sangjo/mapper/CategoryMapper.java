package com.sangjo.mapper;

import java.util.List;

import com.sangjo.vo.CategoryVO;

public interface CategoryMapper {
	List<CategoryVO> categoryList();
	List<CategoryVO> categoryNameList();
	List<CategoryVO> categorySelectList(String categoryName);
}
