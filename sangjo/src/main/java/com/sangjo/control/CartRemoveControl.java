package com.sangjo.control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.sangjo.common.Control;
import com.sangjo.service.CartListService;
import com.sangjo.service.CartListServiceImpl;

public class CartRemoveControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 요청 파라미터에서 장바구니 번호를 가져옴
		String cartNo = req.getParameter("cartNo");

		CartListService cls = new CartListServiceImpl();
		if (cartNo != null) {
            // 서비스 클래스의 메서드를 호출하여 장바구니 항목을 삭제
			cls.removeCartLIst(cartNo);
        }

		req.getRequestDispatcher("sangjo/cartList.tiles").forward(req, resp);
}
}
