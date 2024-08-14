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
	public int addOrder(OrderVO ovo) {
		// TODO Auto-generated method stub
		return mapper.insertOrder(ovo);
	}

	@Override
	public int addOrderDetail(OrderVO ovo) {
		// TODO Auto-generated method stub
		return mapper.insertOrderDetail(ovo);
	}

	@Override
	public List<OrderVO> myOrderList(String memberId) {
		return mapper.getMyOrderList(memberId);
	}

	@Override
	public List<OrderVO> myOrderDetailList(int orderNo) {
		return mapper.getMyOrderDetailList(orderNo);
	}

	public boolean processOrder(String fullName, String phone, String address, String detailAddress, String orderMemo,
			String productNos, String productImgs, String productNames, String productPrices, String quantities,
			String shippingCost, String totalAmount) {
		
		

		
		return true; 

	}
}