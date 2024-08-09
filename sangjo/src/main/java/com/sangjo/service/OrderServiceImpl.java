package com.sangjo.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.sangjo.common.DataSource;
import com.sangjo.mapper.OrderMapper;
import com.sangjo.vo.OrderVO;

public class OrderServiceImpl implements OrderService {
    SqlSession sqlSession = DataSource.getInstance().openSession(true);
    OrderMapper mapper = sqlSession.getMapper(OrderMapper.class);

    @Override
    public List<OrderVO> getOrderList(OrderVO ovo) {
        return mapper.selectOrderList(ovo);
    }

    @Override
    public void addOrderToCart(OrderVO ovo) {
        mapper.insertOrder(ovo);
    }

	@Override
	public List<OrderVO> myOrderList(String memberId) {
		return mapper.getMyOrderList(memberId);
	}

	@Override
	public List<OrderVO> myOrderDetailList(int orderNo) {
		return mapper.getMyOrderDetailList(orderNo);
	}
}