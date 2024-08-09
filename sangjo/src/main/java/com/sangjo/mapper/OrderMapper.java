package com.sangjo.mapper;

import java.util.List;

import com.sangjo.vo.OrderVO;

public interface OrderMapper {
	List<OrderVO> selectOrderList(OrderVO ovo);
	 int insertOrder(OrderVO ovo);
	 int insertOrderDetail(OrderVO ovo);
	 
}
