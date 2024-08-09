package com.sangjo.service;

import java.util.List;

import com.sangjo.vo.OrderVO;

public interface OrderService {
    List<OrderVO> getOrderList(OrderVO ovo);
    //주문 넣는 것 
    int addOrder(OrderVO ovo);
    //주문 상세   
    int addOrderDetail(OrderVO ovo);
    
    List<OrderVO> myOrderList(String memberId);
    List<OrderVO> myOrderDetailList(int orderNo);
}