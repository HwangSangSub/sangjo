package sangjo.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sangjo.common.Control;
import sangjo.service.OrderService;
import sangjo.service.OrderServiceImpl;
import sangjo.vo.OrderVO;

public class OrderControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("sangjo/order.tiles").forward(req, resp);
		
		
		OrderVO ovo = new OrderVO ();		
		ovo.setMemberId("user01");
		
		
		req.setAttribute("myName", "홍길동");
		OrderService osv = new OrderServiceImpl();
		List<OrderVO> list = osv.getOrderList(ovo); //서비스 - 매퍼
		req.setAttribute("OrderList", list);
		
		
		
	}

}
