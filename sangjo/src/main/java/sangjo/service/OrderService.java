package sangjo.service;

import java.util.List;
import sangjo.vo.OrderVO;

public interface OrderService {
    List<OrderVO> getOrderList(OrderVO ovo);
    void addOrderToCart(OrderVO ovo); // 장바구니에 상품 추가
}