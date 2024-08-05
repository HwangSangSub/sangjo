package com.sangjo.service;

import java.util.List;
<<<<<<< HEAD:sangjo/src/main/java/com/sangjo/service/OrderService.java

import com.sangjo.vo.OrderVO;
=======
import sangjo.vo.OrderVO;
>>>>>>> origin/LSC:sangjo/src/main/java/sangjo/service/OrderService.java

public interface OrderService {
    List<OrderVO> getOrderList(OrderVO ovo);
    void addOrderToCart(OrderVO ovo); // 장바구니에 상품 추가
}