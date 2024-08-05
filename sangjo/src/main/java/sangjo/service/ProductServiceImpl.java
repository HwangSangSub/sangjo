package sangjo.service;

import org.apache.ibatis.session.SqlSession;

import sangjo.common.DataSource;

public class ProductServiceImpl implements ProductService{
	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);

}
