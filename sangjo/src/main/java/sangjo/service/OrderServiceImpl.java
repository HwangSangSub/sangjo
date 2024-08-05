package sangjo.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.sangjo.common.DataSource;

import sangjo.mapper.OrderMapper;
import sangjo.vo.OrderVO;

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
}