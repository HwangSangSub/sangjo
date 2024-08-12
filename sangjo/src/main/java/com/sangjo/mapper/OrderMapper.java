package com.sangjo.mapper;

import java.util.List;

import com.sangjo.vo.OrderVO;

public interface OrderMapper {
	// 주문건 조회
	List<OrderVO> selectOrderList(OrderVO ovo);
	 int insertOrder(OrderVO ovo);
	 int insertOrderDetail(OrderVO ovo);
	
	// 마이페이지 주문내역 확인하기
	List<OrderVO> getMyOrderList(String memberId);
	List<OrderVO> getMyOrderDetailList(int orderNo);
	
}
