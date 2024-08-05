package sangjo.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import sangjo.common.DataSource;
import sangjo.mapper.CartListMapper;
import sangjo.vo.CartListVO;

public class CartListServiceImpl implements CartListService {
	 SqlSession sqlSession = DataSource.getInstance().openSession(true);
	    CartListMapper mapper = sqlSession.getMapper(CartListMapper.class);

	@Override
	public List<CartListVO> getCartList(String memberId) {
		// TODO Auto-generated method stub
		return mapper.selectCartList(memberId);
	}

}
