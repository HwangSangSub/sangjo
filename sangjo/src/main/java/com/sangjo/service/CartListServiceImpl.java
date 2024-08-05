package com.sangjo.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.sangjo.common.DataSource;
import com.sangjo.mapper.CartListMapper;
import com.sangjo.vo.CartListVO;

public class CartListServiceImpl implements CartListService {
	 SqlSession sqlSession = DataSource.getInstance().openSession(true);
	    CartListMapper mapper = sqlSession.getMapper(CartListMapper.class);

	@Override
	public List<CartListVO> getCartList(String memberId) {
		// TODO Auto-generated method stub
		return mapper.selectCartList(memberId);
	}

}
