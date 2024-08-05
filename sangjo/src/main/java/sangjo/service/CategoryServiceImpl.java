package sangjo.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import sangjo.common.DataSource;
import sangjo.mapper.CategoryMapper;
import sangjo.vo.CategoryVO;

public class CategoryServiceImpl implements CategoryService {
	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	CategoryMapper mapper = sqlSession.getMapper(CategoryMapper.class);
	
	@Override
	public List<CategoryVO> categoryList(CategoryVO category) {
		return mapper.selectList();
	}
}
