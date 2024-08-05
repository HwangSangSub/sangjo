package sangjo.mapper;

import java.util.List;

import sangjo.vo.OrderVO;

public interface OrderMapper {
	List<OrderVO> selectOrderList(OrderVO ovo);
	 void insertOrder(OrderVO ovo);
}
