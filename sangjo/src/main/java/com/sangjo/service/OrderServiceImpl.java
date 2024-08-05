package com.sangjo.service;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
<<<<<<< HEAD:sangjo/src/main/java/com/sangjo/service/OrderServiceImpl.java

import com.sangjo.common.DataSource;
import com.sangjo.mapper.OrderMapper;
import com.sangjo.vo.OrderVO;
=======
import sangjo.common.DataSource;
import sangjo.mapper.OrderMapper;
import sangjo.vo.OrderVO;
>>>>>>> origin/LSC:sangjo/src/main/java/sangjo/service/OrderServiceImpl.java

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