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
		// 실제 결제 처리 로직을 구현합니다.
		// 예를 들어, 결제 API 호출, 데이터베이스 업데이트 등을 수행합니다.
		// 현재는 예시로 항상 결제가 성공한 것으로 가정합니다.

		// 결제 성공 여부를 반환합니다.
		return true; // 실제 로직에 맞게 true/false 값을 반환합니다.

	}
}