package sangjo.service;

import java.util.List;

import sangjo.vo.CategoryVO;

public interface CategoryService {
	List<CategoryVO> categoryList(CategoryVO category);
}
